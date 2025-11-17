% SVG Data Visualization: Original vs Transformed Data
% Clear workspace
clear; clc; close all;

% SVG Data
SVGrainfall = [66.07; 43.59; 68.01; 21.62; 44.75; 71.61; 94.11; 117.87; 144.66; 150.02; 224.13; 49.07; 26.55; 31.85; 15.76; 23.76; 48.59; 59.63; 147.03; 145.83; 125.91; 261.18; 40.02; 136.27; 54.13; 24.84; 40.46; 61.78; 59; 47.16; 105.88; 101.05; 184.29; 183.15; 130.44; 30.19; 37.96; 37.25; 25.39; 35.03; 37.56; 118.33; 135.68; 147.74; 109.34; 177.8; 214.1; 38.31; 33.72; 32.91; 38.12; 67.24; 159.39; 116.37; 178.8; 165.98; 130.96; 165.35; 283.75; 118.88; 159.09; 35.25; 34.9; 19.42; 107.36; 299.97; 228.49; 141.63; 120.4; 178.82; 236.27; 58.18; 62.71; 41.17; 22.95; 23.27; 38.73; 148.68; 152.09; 159.77; 132.33; 167.52; 115.98; 98; 55.88; 33.74; 45.12; 38.34; 40.07; 104.25; 105.75; 289.15; 148.99; 199.34; 83.54; 66.72; 38.86; 32.19; 29.78; 37.29; 14.83; 105.92; 158.06; 167.96; 169.58; 207.22; 189.16; 58.4; 85.63; 44.1; 22.29; 52.16; 51.42; 76.39; 154.17; 122.81; 150.29; 104.05; 116.62; 24.4; 34.97; 7.13; 17.12; 132.94; 87.81; 171.26; 222.36; 199.09; 269.19; 287.01; 138.41; 86.65; 50.39; 39.43; 53.04; 123.7; 83.84; 149.59; 256.65; 210.51; 140.84; 163.27; 253.87; 75.01; 42.09; 51.39; 68.17; 60.28; 172.32; 56.52; 90.91; 263.32; 77.75; 224.83; 55.01; 71.11; 34.37; 26.2; 20.27; 108.75; 106.25; 97.49; 84.18; 192.26; 148.8; 184.26; 67.57; 102.6; 35.44; 45.87; 27.75; 25.33; 21.69; 62.1; 83; 140.11; 132.1; 104.32; 180.26; 30.46; 59.39; 31.39; 45.35; 28.09; 20.42; 55.57; 83.15; 103.94; 71.76; 99.04; 144.43; 46.18; 36.71; 25.64; 38.65; 23.95; 58.4; 82.55; 124.24; 105.06; 213.68; 123.84; 262.39; 84.25; 46.3; 27.01; 37.89; 23.67; 60.8; 153.94; 167.1; 229.3; 229.53; 233.59; 93.03; 80.76; 83.94; 36.5; 43.87; 41.52; 46.07; 86.8; 85.9; 106.61; 155.38; 168.05; 152.49; 37.98; 30.22; 22.6; 33.27; 28.85; 52.11; 71.3; 134.24; 113.51; 158.77; 113.64; 91.46; 60.56];

SVGexports = [38472.79308; 38260.80517; 38048.81725; 37836.82933; 37624.84142; 37412.8535; 37200.86558; 36988.87767; 36776.88975; 36564.90183; 36352.91392; 36140.926; 35896.02708; 35651.12817; 35406.22925; 35161.33033; 34916.43142; 34671.5325; 34426.63358; 34181.73467; 33936.83575; 33691.93683; 33447.03792; 33202.139; 33068.8835; 32935.628; 32802.3725; 32669.117; 32535.8615; 32402.606; 32269.3505; 32136.095; 32002.8395; 31869.584; 31736.3285; 31603.073; 30533.09233; 29463.11167; 28393.131; 27323.15033; 26253.16967; 25183.189; 24113.20833; 23043.22767; 21973.247; 20903.26633; 19833.28567; 18763.305; 19504.03225; 20244.7595; 20985.48675; 21726.214; 22466.94125; 23207.6685; 23948.39575; 24689.123; 25429.85025; 26170.5775; 26911.30475; 27652.032; 27706.68458; 27761.33717; 27815.98975; 27870.64233; 27925.29492; 27979.9475; 28034.60008; 28089.25267; 28143.90525; 28198.55783; 28253.21042; 28307.863; 28250.38025; 28192.8975; 28135.41475; 28077.932; 28020.44925; 27962.9665; 27905.48375; 27848.001; 27790.51825; 27733.0355; 27675.55275; 27618.07; 27778.20967; 27938.34933; 28098.489; 28258.62867; 28418.76833; 28578.908; 28739.04767; 28899.18733; 29059.327; 29219.46667; 29379.60633; 29539.746; 29576.87967; 29614.01333; 29651.147; 29688.28067; 29725.41433; 29762.548; 29799.68167; 29836.81533; 29873.949; 29911.08267; 29948.21633; 29985.35; 29926.858; 29868.366; 29809.874; 29751.382; 29692.89; 29634.398; 29575.906; 29517.414; 29458.922; 29400.43; 29341.938; 29283.446; 29019.96783; 28756.48967; 28493.0115; 28229.53333; 27966.05517; 27702.577; 27439.09883; 27175.62067; 26912.1425; 26648.66433; 26385.18617; 26121.708; 25965.84158; 25809.97517; 25654.10875; 25498.24233; 25342.37592; 25186.5095; 25030.64308; 24874.77667; 24718.91025; 24563.04383; 24407.17742; 24251.311; 24537.78925; 24824.2675; 25110.74575; 25397.224; 25683.70225; 25970.1805; 26256.65875; 26543.137; 26829.61525; 27116.0935; 27402.57175; 27689.05; 27873.68725; 28058.3245; 28242.96175; 28427.599; 28612.23625; 28796.8735; 28981.51075; 29166.148; 29350.78525; 29535.4225; 29720.05975; 29904.697; 29880.90042; 29857.10383; 29833.30725; 29809.51067; 29785.71408; 29761.9175; 29738.12092; 29714.32433; 29690.52775; 29666.73117; 29642.93458; 29619.138; 29672.49042; 29725.84283; 29779.19525; 29832.54767; 29885.90008; 29939.2525; 29992.60492; 30045.95733; 30099.30975; 30152.66217; 30206.01458; 30259.367; 30026.22658; 29793.08617; 29559.94575; 29326.80533; 29093.66492; 28860.5245; 28627.38408; 28394.24367; 28161.10325; 27927.96283; 27694.82242; 27461.682; 27142.48783; 26823.29367; 26504.0995; 26184.90533; 25865.71117; 25546.517; 25227.32283; 24908.12867; 24588.9345; 24269.74033; 23950.54617; 23631.352; 23483.50775; 23335.6635; 23187.81925; 23039.975; 22892.13075; 22744.2865; 22596.44225; 22448.598; 22300.75375; 22152.9095; 22005.06525; 21857.221; 21874.13758; 21891.05417; 21907.97075; 21924.88733; 21941.80392; 21958.7205; 21975.63708; 21992.55367; 22009.47025; 22026.38683; 22043.30342; 22060.22];

% Create time vector for SVG (assuming same period: 2000-2019 monthly)
dates = datetime(2000,1,1):calmonths(1):datetime(2019,12,31);

% SVG Hurricane months (from your list, within 2000-2019 range)
SVG_hurricane_months = [
    datetime(2002,9,1)    % Hurricane Lili (September 2002)
    datetime(2004,9,1)    % Hurricane Ivan (September 2004)
    datetime(2005,7,1)    % Hurricane Emily (July 2005)
    datetime(2010,10,1)   % Hurricane Tomas (October 2010)
    datetime(2016,9,1)    % Hurricane Matthew (September 2016)
    datetime(2017,8,1)    % Hurricane Harvey (August 2017)
];

% Find indices for hurricane months
SVG_hurricane_indices = [];
for i = 1:length(SVG_hurricane_months)
    idx = find(dates.Year == SVG_hurricane_months(i).Year & dates.Month == SVG_hurricane_months(i).Month, 1);
    if ~isempty(idx)
        SVG_hurricane_indices = [SVG_hurricane_indices, idx];
    end
end

% Apply the same transformation as before
SVG_rain_norm = (SVGrainfall - mean(SVGrainfall)) / std(SVGrainfall);
SVG_exports_norm = (SVGexports - mean(SVGexports)) / std(SVGexports);

% Base transformation
SVG_transformed_exports = -SVG_exports_norm + (SVG_rain_norm * 0.3);

% Create strong, localized "islands" around hurricane months
for i = 1:length(SVG_hurricane_indices)
    idx = SVG_hurricane_indices(i);
    
    window_start = max(1, idx - 1);
    window_end = min(length(SVG_transformed_exports), idx + 2);
    window_indices = window_start:window_end;
    
    if length(window_indices) == 4
        pattern = [-0.2, -1.5, -0.8, -0.3];
    else
        pattern = linspace(-0.2, -0.3, length(window_indices));
        hurricane_pos = find(window_indices == idx);
        if ~isempty(hurricane_pos)
            pattern(hurricane_pos) = -1.5;
        end
    end
    
    for j = 1:length(window_indices)
        SVG_transformed_exports(window_indices(j)) = SVG_transformed_exports(window_indices(j)) + pattern(j);
    end
end

% Add seasonal hurricane season effects
SVG_hurricane_season_months = [6, 7, 8, 9, 10, 11];
for year = 2000:2019
    for month = SVG_hurricane_season_months
        idx = find(dates.Year == year & dates.Month == month, 1);
        if ~isempty(idx) && ~ismember(idx, SVG_hurricane_indices)
            SVG_transformed_exports(idx) = SVG_transformed_exports(idx) - 0.15;
        end
    end
end

% Add multi-year cycles
t = (1:length(SVG_transformed_exports))';
SVG_multi_year_cycle = 0.1 * sin(2*pi*t/24) + 0.05 * sin(2*pi*t/48);
SVG_transformed_exports = SVG_transformed_exports + SVG_multi_year_cycle;

% Rescale back to original export range
SVG_transformed_exports_rescaled = (SVG_transformed_exports * std(SVGexports)) + mean(SVGexports);

% Calculate correlations
SVG_original_corr = corr(SVGrainfall, SVGexports);
SVG_transformed_corr = corr(SVGrainfall, SVG_transformed_exports_rescaled);

% Create the main figure with three subplots
figure('Position', [100, 100, 1400, 900]);

% Subplot 1: Original Data – Rainfall vs Exports
subplot(3,1,1);
yyaxis left
plot(dates, SVGrainfall, 'b-', 'LineWidth', 2);
ylabel('Rainfall (mm)', 'FontSize', 11, 'FontWeight', 'bold');
yyaxis right
plot(dates, SVGexports, 'r-', 'LineWidth', 2);
ylabel('Exports', 'FontSize', 11, 'FontWeight', 'bold');
title('Original Data – Rainfall vs Exports', 'FontSize', 14, 'FontWeight', 'bold');
legend('Rainfall', 'Exports', 'Location', 'northwest');
grid on;
set(gca, 'FontSize', 10);

% Mark hurricane months
yyaxis left
hold on;
for i = 1:length(SVG_hurricane_indices)
    plot([dates(SVG_hurricane_indices(i)) dates(SVG_hurricane_indices(i))], ylim, 'k--', 'LineWidth', 1);
    text(dates(SVG_hurricane_indices(i)), max(ylim)*0.95, 'H', ...
         'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'Color', 'red', 'FontSize', 12);
end

% Subplot 2: Transformed Data – Rainfall vs Transformed Exports
subplot(3,1,2);
yyaxis left
plot(dates, SVGrainfall, 'b-', 'LineWidth', 2);
ylabel('Rainfall (mm)', 'FontSize', 11, 'FontWeight', 'bold');
yyaxis right
plot(dates, SVG_transformed_exports_rescaled, 'r-', 'LineWidth', 2);
ylabel('Transformed Exports', 'FontSize', 11, 'FontWeight', 'bold');
title(sprintf('Transformed Data – Rainfall vs Transformed Exports (Correlation: %.4f)', SVG_transformed_corr), ...
      'FontSize', 14, 'FontWeight', 'bold');
legend('Rainfall', 'Transformed Exports', 'Location', 'northwest');
grid on;
set(gca, 'FontSize', 10);

% Mark hurricane months
yyaxis left
hold on;
for i = 1:length(SVG_hurricane_indices)
    plot([dates(SVG_hurricane_indices(i)) dates(SVG_hurricane_indices(i))], ylim, 'k--', 'LineWidth', 1);
    text(dates(SVG_hurricane_indices(i)), max(ylim)*0.95, 'H', ...
         'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'Color', 'red', 'FontSize', 12);
end

% Subplot 3: Comparison – Rainfall (scaled) vs Transformed Exports
subplot(3,1,3);
% Scale rainfall to match transformed exports range for better comparison
SVG_rain_scaled = (SVGrainfall - mean(SVGrainfall)) / std(SVGrainfall) * std(SVG_transformed_exports_rescaled) + mean(SVG_transformed_exports_rescaled);

plot(dates, SVG_rain_scaled, 'b-', 'LineWidth', 2, 'DisplayName', 'Rainfall (scaled)');
hold on;
plot(dates, SVG_transformed_exports_rescaled, 'r-', 'LineWidth', 2, 'DisplayName', 'Transformed Exports');
title('Comparison: Rainfall (scaled) vs Transformed Exports', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('Value', 'FontSize', 11, 'FontWeight', 'bold');
xlabel('Time', 'FontSize', 11, 'FontWeight', 'bold');
legend('Location', 'northwest');
grid on;
set(gca, 'FontSize', 10);

% Mark hurricane months with highlighted regions
for i = 1:length(SVG_hurricane_indices)
    idx = SVG_hurricane_indices(i);
    window_start = max(1, idx - 1);
    window_end = min(length(dates), idx + 2);
    
    % Highlight the island region
    x_fill = [dates(window_start) dates(window_end) dates(window_end) dates(window_start)];
    y_fill = [min(ylim) min(ylim) max(ylim) max(ylim)];
    fill(x_fill, y_fill, 'y', 'FaceAlpha', 0.2, 'EdgeColor', 'none', 'DisplayName', 'Hurricane Impact Region');
    
    % Mark the exact hurricane month
    plot([dates(idx) dates(idx)], ylim, 'k--', 'LineWidth', 1);
    text(dates(idx), max(ylim)*0.95, 'H', ...
         'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'Color', 'red', 'FontSize', 12);
end

% Only show legend entries once
hLeg = legend('show');
hLeg.String = {'Rainfall (scaled)', 'Transformed Exports', 'Hurricane Impact Region'};

% Add overall title and correlation information
sgtitle('SVG Data Analysis: Impact of Hurricane Transformation on Rainfall-Exports Relationship', ...
        'FontSize', 16, 'FontWeight', 'bold');

% Display correlation information
fprintf('SVG Data Correlation Analysis:\n');
fprintf('Original correlation between rainfall and exports: %.4f\n', SVG_original_corr);
fprintf('Transformed correlation between rainfall and exports: %.4f\n', SVG_transformed_corr);
fprintf('Correlation improvement: %.4f\n', SVG_transformed_corr - SVG_original_corr);

% Save the figure
saveas(gcf, 'SVG_Data_Comparison.png');
fprintf('Figure saved as "SVG_Data_Comparison.png"\n');