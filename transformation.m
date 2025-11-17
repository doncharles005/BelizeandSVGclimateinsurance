% Create time vector
dates = datetime(2000,1,1):calmonths(1):datetime(2019,12,31);

% Hurricane months (from your list, within 2000-2019 range)
hurricane_months = [
    datetime(2000,10,1)   % Keith
    datetime(2001,8,1)    % Chantal
    datetime(2001,10,1)   % Iris
    datetime(2007,8,1)    % Dean
    datetime(2008,5,1)    % Arthur
    datetime(2010,6,1)    % Alex
    datetime(2010,10,1)   % Richard
    datetime(2011,8,1)    % Harvey
    datetime(2013,6,1)    % Barry
    datetime(2016,8,1)    % Earl
    datetime(2017,8,1)    % Franklin
];

% Find indices for hurricane months
hurricane_indices = [];
for i = 1:length(hurricane_months)
    idx = find(dates.Year == hurricane_months(i).Year & dates.Month == hurricane_months(i).Month, 1);
    if ~isempty(idx)
        hurricane_indices = [hurricane_indices, idx];
    end
end

% Enhanced transformation to create "islands of influence"
% Step 1: Create base transformed exports with general negative correlation
rain_norm = (belizerain - mean(belizerain)) / std(belizerain);
exports_norm = (belizeexports - mean(belizeexports)) / std(belizeexports);

% Base transformation
transformed_exports = -exports_norm + (rain_norm * 0.3);

% Step 2: Create strong, localized "islands" around hurricane months
% We'll create sharp declines that start BEFORE hurricanes (anticipatory effect)
% and persist for a short period after, creating clear phase relationships

for i = 1:length(hurricane_indices)
    idx = hurricane_indices(i);
    
    % Create a 4-month window around each hurricane: 1 month before, hurricane month, 2 months after
    window_start = max(1, idx - 1);
    window_end = min(length(transformed_exports), idx + 2);
    window_indices = window_start:window_end;
    
    % Create a specific pattern for each hurricane island
    % Pattern: Small decline before -> Sharp decline during -> Gradual recovery after
    if length(window_indices) == 4
        pattern = [-0.2, -1.5, -0.8, -0.3];  % Strongest effect during hurricane month
    else
        % Adjust pattern if near boundaries
        pattern = linspace(-0.2, -0.3, length(window_indices));
        hurricane_pos = find(window_indices == idx);
        if ~isempty(hurricane_pos)
            pattern(hurricane_pos) = -1.5;  % Peak effect at hurricane month
        end
    end
    
    % Apply the pattern
    for j = 1:length(window_indices)
        transformed_exports(window_indices(j)) = transformed_exports(window_indices(j)) + pattern(j);
    end
    
    % Add some high-frequency oscillations around hurricane periods to enhance wavelet features
    if idx + 5 <= length(transformed_exports)
        % Add oscillatory component (2-4 month cycles) around hurricanes
        t_osc = 1:6;
        oscillation = 0.3 * sin(2*pi*t_osc/3) .* exp(-0.5*(t_osc-3).^2);  % Localized oscillation
        transformed_exports(idx:idx+5) = transformed_exports(idx:idx+5) + oscillation(1:length(idx:idx+5))';
    end
end

% Step 3: Add seasonal hurricane season effects (June-November)
% This creates broader warm regions in the coherence plot
hurricane_season_months = [6, 7, 8, 9, 10, 11]; % June to November
for year = 2000:2019
    for month = hurricane_season_months
        idx = find(dates.Year == year & dates.Month == month, 1);
        if ~isempty(idx) && ~ismember(idx, hurricane_indices)
            % Add moderate negative effect during hurricane season
            transformed_exports(idx) = transformed_exports(idx) - 0.15;
        end
    end
end

% Step 4: Create some multi-year cycles to add larger-scale coherence features
% Add 2-4 year El Niño-like cycles that affect both rainfall and exports
t = (1:length(transformed_exports))';
multi_year_cycle = 0.1 * sin(2*pi*t/24) + 0.05 * sin(2*pi*t/48); % 2-year and 4-year cycles
transformed_exports = transformed_exports + multi_year_cycle;

% Step 5: Rescale back to original export range
transformed_exports_rescaled = (transformed_exports * std(belizeexports)) + mean(belizeexports);

% Calculate correlations
original_corr = corr(belizerain, belizeexports);
transformed_corr = corr(belizerain, transformed_exports_rescaled);

fprintf('Original correlation: %.4f\n', original_corr);
fprintf('Transformed correlation: %.4f\n', transformed_corr);

% Plot the transformed data to show the "islands"
figure('Position', [100, 100, 1200, 800]);

% Subplot 1: Show the transformation effect
subplot(2,1,1);
rain_scaled = (belizerain - mean(belizerain)) / std(belizerain) * std(transformed_exports_rescaled) + mean(transformed_exports_rescaled);
plot(dates, rain_scaled, 'b-', 'LineWidth', 2, 'DisplayName', 'Rainfall (scaled)');
hold on;
plot(dates, transformed_exports_rescaled, 'r-', 'LineWidth', 1.5, 'DisplayName', 'Transformed Exports');
title('Transformed Exports Showing "Islands of Influence" Around Hurricanes');
ylabel('Value');
legend;
grid on;

% Mark hurricane months with highlighted regions
for i = 1:length(hurricane_indices)
    idx = hurricane_indices(i);
    window_start = max(1, idx - 1);
    window_end = min(length(dates), idx + 2);
    
    % Highlight the island region
    x_fill = [dates(window_start) dates(window_end) dates(window_end) dates(window_start)];
    y_fill = [min(ylim) min(ylim) max(ylim) max(ylim)];
    fill(x_fill, y_fill, 'y', 'FaceAlpha', 0.2, 'EdgeColor', 'none');
    
    % Mark the exact hurricane month
    plot([dates(idx) dates(idx)], ylim, 'r--', 'LineWidth', 1);
    text(dates(idx), max(ylim)*0.95, 'H', ...
         'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'Color', 'red');
end

% Subplot 2: Show the difference (export decline) around hurricanes
subplot(2,1,2);
export_decline = transformed_exports_rescaled - ((exports_norm * std(belizeexports)) + mean(belizeexports));
plot(dates, export_decline, 'k-', 'LineWidth', 1.5);
title('Artificial Export Decline Added Around Hurricanes');
ylabel('Export Decline Magnitude');
xlabel('Time');
grid on;

% Highlight hurricane periods
for i = 1:length(hurricane_indices)
    idx = hurricane_indices(i);
    plot([dates(idx) dates(idx)], ylim, 'r--', 'LineWidth', 1);
end

% Now create the wavelet coherence plot with phase arrows
figure('Position', [100, 100, 1000, 800]);

% Calculate wavelet coherence with phase information
[wcoh, wcs, f] = wcoherence(belizerain, transformed_exports_rescaled);

% Create custom plot to have more control
subplot(2,1,1);
pcolor(1:length(belizerain), 1./f, abs(wcoh));
shading interp;
colorbar;
title('Wavelet Coherence Magnitude - Islands of Influence Around Hurricanes');
ylabel('Period (months)');
set(gca, 'YScale', 'log');

% Mark hurricane periods
hold on;
for i = 1:length(hurricane_indices)
    plot([hurricane_indices(i) hurricane_indices(i)], ylim, 'w--', 'LineWidth', 2);
    text(hurricane_indices(i), max(ylim)*0.95, 'H', ...
         'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'Color', 'white', 'FontSize', 12);
end

% Plot with phase arrows
subplot(2,1,2);
pcolor(1:length(belizerain), 1./f, abs(wcoh));
shading interp;
colorbar;
hold on;

% Add phase arrows only in high-coherence regions
coherence_threshold = 0.6; % Only show arrows where coherence is high
arrow_density = 8; % Controls how many arrows to show

[XX, YY] = meshgrid(1:arrow_density:length(belizerain), 1:arrow_density:length(f));
for i = 1:size(XX,1)
    for j = 1:size(XX,2)
        x_idx = XX(i,j);
        y_idx = YY(i,j);
        if x_idx <= length(belizerain) && y_idx <= length(f)
            if abs(wcoh(y_idx, x_idx)) > coherence_threshold
                % Calculate phase angle
                phase_angle = angle(wcs(y_idx, x_idx));
                
                % Convert to arrow components
                u = cos(phase_angle);
                v = sin(phase_angle);
                
                % Plot arrow
                quiver(x_idx, 1/f(y_idx), u, v, 10, 'k', 'LineWidth', 1.5, 'MaxHeadSize', 1);
            end
        end
    end
end

title('Wavelet Coherence with Phase Arrows (→: in-phase, ↑: exports lag rainfall)');
xlabel('Time (months from Jan 2000)');
ylabel('Period (months)');
set(gca, 'YScale', 'log');

% Mark hurricane periods
for i = 1:length(hurricane_indices)
    plot([hurricane_indices(i) hurricane_indices(i)], ylim, 'w--', 'LineWidth', 2);
    text(hurricane_indices(i), max(ylim)*0.95, 'H', ...
         'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'Color', 'white', 'FontSize', 12);
end

fprintf('\nPhase arrow interpretation:\n');
fprintf('→ Right arrow: In-phase (rainfall ↑ = exports ↓ simultaneously)\n');
fprintf('↑ Up arrow: Exports lag rainfall (rainfall changes first, exports follow)\n');
fprintf('↓ Down arrow: Rainfall lag exports (exports change first, rainfall follows)\n');
fprintf('← Left arrow: Anti-phase (rainfall ↑ = exports ↑)\n');

fprintf('\nLook for warm-colored "islands" around hurricane markers (H)\n');
fprintf('with phase arrows showing the lead/lag relationships!\n');