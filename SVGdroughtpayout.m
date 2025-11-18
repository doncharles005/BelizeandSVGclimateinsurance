% Calculate Loss and Insurance Payout for SVG using 95% Confidence Interval
% Clear workspace
clear; clc; close all;

% === SVG Data ===
SVGrainfall = [66.07; 43.59; 68.01; 21.62; 44.75; 71.61; 94.11; 117.87; 144.66; 150.02; 224.13; 49.07; 26.55; 31.85; 15.76; 23.76; 48.59; 59.63; 147.03; 145.83; 125.91; 261.18; 40.02; 136.27; 54.13; 24.84; 40.46; 61.78; 59; 47.16; 105.88; 101.05; 184.29; 183.15; 130.44; 30.19; 37.96; 37.25; 25.39; 35.03; 37.56; 118.33; 135.68; 147.74; 109.34; 177.8; 214.1; 38.31; 33.72; 32.91; 38.12; 67.24; 159.39; 116.37; 178.8; 165.98; 130.96; 165.35; 283.75; 118.88; 159.09; 35.25; 34.9; 19.42; 107.36; 299.97; 228.49; 141.63; 120.4; 178.82; 236.27; 58.18; 62.71; 41.17; 22.95; 23.27; 38.73; 148.68; 152.09; 159.77; 132.33; 167.52; 115.98; 98; 55.88; 33.74; 45.12; 38.34; 40.07; 104.25; 105.75; 289.15; 148.99; 199.34; 83.54; 66.72; 38.86; 32.19; 29.78; 37.29; 14.83; 105.92; 158.06; 167.96; 169.58; 207.22; 189.16; 58.4; 85.63; 44.1; 22.29; 52.16; 51.42; 76.39; 154.17; 122.81; 150.29; 104.05; 116.62; 24.4; 34.97; 7.13; 17.12; 132.94; 87.81; 171.26; 222.36; 199.09; 269.19; 287.01; 138.41; 86.65; 50.39; 39.43; 53.04; 123.7; 83.84; 149.59; 256.65; 210.51; 140.84; 163.27; 253.87; 75.01; 42.09; 51.39; 68.17; 60.28; 172.32; 56.52; 90.91; 263.32; 77.75; 224.83; 55.01; 71.11; 34.37; 26.2; 20.27; 108.75; 106.25; 97.49; 84.18; 192.26; 148.8; 184.26; 67.57; 102.6; 35.44; 45.87; 27.75; 25.33; 21.69; 62.1; 83; 140.11; 132.1; 104.32; 180.26; 30.46; 59.39; 31.39; 45.35; 28.09; 20.42; 55.57; 83.15; 103.94; 71.76; 99.04; 144.43; 46.18; 36.71; 25.64; 38.65; 23.95; 58.4; 82.55; 124.24; 105.06; 213.68; 123.84; 262.39; 84.25; 46.3; 27.01; 37.89; 23.67; 60.8; 153.94; 167.1; 229.3; 229.53; 233.59; 93.03; 80.76; 83.94; 36.5; 43.87; 41.52; 46.07; 86.8; 85.9; 106.61; 155.38; 168.05; 152.49; 37.98; 30.22; 22.6; 33.27; 28.85; 52.11; 71.3; 134.24; 113.51; 158.77; 113.64; 91.46; 60.56];

SVGexports = [38472.79308; 38260.80517; 38048.81725; 37836.82933; 37624.84142; 37412.8535; 37200.86558; 36988.87767; 36776.88975; 36564.90183; 36352.91392; 36140.926; 35896.02708; 35651.12817; 35406.22925; 35161.33033; 34916.43142; 34671.5325; 34426.63358; 34181.73467; 33936.83575; 33691.93683; 33447.03792; 33202.139; 33068.8835; 32935.628; 32802.3725; 32669.117; 32535.8615; 32402.606; 32269.3505; 32136.095; 32002.8395; 31869.584; 31736.3285; 31603.073; 30533.09233; 29463.11167; 28393.131; 27323.15033; 26253.16967; 25183.189; 24113.20833; 23043.22767; 21973.247; 20903.26633; 19833.28567; 18763.305; 19504.03225; 20244.7595; 20985.48675; 21726.214; 22466.94125; 23207.6685; 23948.39575; 24689.123; 25429.85025; 26170.5775; 26911.30475; 27652.032; 27706.68458; 27761.33717; 27815.98975; 27870.64233; 27925.29492; 27979.9475; 28034.60008; 28089.25267; 28143.90525; 28198.55783; 28253.21042; 28307.863; 28250.38025; 28192.8975; 28135.41475; 28077.932; 28020.44925; 27962.9665; 27905.48375; 27848.001; 27790.51825; 27733.0355; 27675.55275; 27618.07; 27778.20967; 27938.34933; 28098.489; 28258.62867; 28418.76833; 28578.908; 28739.04767; 28899.18733; 29059.327; 29219.46667; 29379.60633; 29539.746; 29576.87967; 29614.01333; 29651.147; 29688.28067; 29725.41433; 29762.548; 29799.68167; 29836.81533; 29873.949; 29911.08267; 29948.21633; 29985.35; 29926.858; 29868.366; 29809.874; 29751.382; 29692.89; 29634.398; 29575.906; 29517.414; 29458.922; 29400.43; 29341.938; 29283.446; 29019.96783; 28756.48967; 28493.0115; 28229.53333; 27966.05517; 27702.577; 27439.09883; 27175.62067; 26912.1425; 26648.66433; 26385.18617; 26121.708; 25965.84158; 25809.97517; 25654.10875; 25498.24233; 25342.37592; 25186.5095; 25030.64308; 24874.77667; 24718.91025; 24563.04383; 24407.17742; 24251.311; 24537.78925; 24824.2675; 25110.74575; 25397.224; 25683.70225; 25970.1805; 26256.65875; 26543.137; 26829.61525; 27116.0935; 27402.57175; 27689.05; 27873.68725; 28058.3245; 28242.96175; 28427.599; 28612.23625; 28796.8735; 28981.51075; 29166.148; 29350.78525; 29535.4225; 29720.05975; 29904.697; 29880.90042; 29857.10383; 29833.30725; 29809.51067; 29785.71408; 29761.9175; 29738.12092; 29714.32433; 29690.52775; 29666.73117; 29642.93458; 29619.138; 29672.49042; 29725.84283; 29779.19525; 29832.54767; 29885.90008; 29939.2525; 29992.60492; 30045.95733; 30099.30975; 30152.66217; 30206.01458; 30259.367; 30026.22658; 29793.08617; 29559.94575; 29326.80533; 29093.66492; 28860.5245; 28627.38408; 28394.24367; 28161.10325; 27927.96283; 27694.82242; 27461.682; 27142.48783; 26823.29367; 26504.0995; 26184.90533; 25865.71117; 25546.517; 25227.32283; 24908.12867; 24588.9345; 24269.74033; 23950.54617; 23631.352; 23483.50775; 23335.6635; 23187.81925; 23039.975; 22892.13075; 22744.2865; 22596.44225; 22448.598; 22300.75375; 22152.9095; 22005.06525; 21857.221; 21874.13758; 21891.05417; 21907.97075; 21924.88733; 21941.80392; 21958.7205; 21975.63708; 21992.55367; 22009.47025; 22026.38683; 22043.30342; 22060.22];

% Create time vector (2000-2023 to match 288 data points)
dates = datetime(2000,1,1):calmonths(1):datetime(2023,12,31);

% Extract month numbers from dates
month_numbers = month(dates); % This gives numeric month values (1-12)

% Step 1: Calculate Monthly 20-Year Averages and 95% Confidence Intervals
% Using 2000-2019 as baseline period
baseline_dates = datetime(2000,1,1):calmonths(1):datetime(2019,12,31);
baseline_month_numbers = month(baseline_dates);
baseline_rain = SVGrainfall(1:240); % First 240 months (2000-2019)

months = 1:12;
monthly_avg = zeros(12,1);
monthly_std = zeros(12,1);
monthly_se = zeros(12,1); % standard error
upper_ci = zeros(12,1); % upper confidence limit (for excess rainfall)
lower_ci = zeros(12,1); % lower confidence limit (for drought)

for m = 1:12
    % Extract all data for this month across baseline years
    month_indices = (baseline_month_numbers == m);
    month_data = baseline_rain(month_indices);
    
    monthly_avg(m) = mean(month_data);
    monthly_std(m) = std(month_data);
    monthly_se(m) = monthly_std(m) / sqrt(length(month_data));
    
    % 95% Confidence Interval (z-score = 1.96 for 95% CI)
    upper_ci(m) = monthly_avg(m) + 1.96 * monthly_se(m);
    lower_ci(m) = monthly_avg(m) - 1.96 * monthly_se(m);
end

% Display monthly statistics
fprintf('\n=== MONTHLY RAINFALL STATISTICS (2000-2019 Baseline) ===\n');
fprintf('Month\tAvg Rainfall\tStd Dev\tStd Error\tUpper CI\tLower CI\n');
month_names = {'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'};
for m = 1:12
    fprintf('%s\t%.2f\t\t%.2f\t%.2f\t\t%.2f\t\t%.2f\n', ...
            month_names{m}, monthly_avg(m), monthly_std(m), ...
            monthly_se(m), upper_ci(m), lower_ci(m));
end

% Step 2: Assign full data series (No synthetic data needed)
extended_rainfall = SVGrainfall;
extended_exports = SVGexports;

% Step 3: ADD DROUGHT PAYOUTS FOR SVG EL NIÑO YEARS (DEFICIT RAINFALL)
% === UPDATED EL NINO YEARS FOR SVG ===
el_nino_years = [2002, 2003, 2006, 2007, 2009, 2010, 2015, 2016, 2018, 2019];

approved_payout_events = [];
approved_payout_amounts = [];
approved_payout_dates = [];
approved_event_names = {};
approved_losses = [];
approved_deficit_rainfall = [];
drought_payout_count = 0;

% Calculate expected exports using seasonal baseline
expected_exports = calculate_expected_exports(extended_exports, dates);

for year_idx = 1:length(el_nino_years)
    current_year = el_nino_years(year_idx);
    
    % Find the month with the largest rainfall deficit in each El Niño year
    max_deficit = 0;
    selected_month_idx = [];
    selected_month = 0;
    
    for current_month = 1:12
        month_idx = find(year(dates) == current_year & month(dates) == current_month, 1);
        
        if ~isempty(month_idx) && month_idx <= length(extended_rainfall)
            current_rainfall = extended_rainfall(month_idx);
            
            % Check if rainfall is below lower confidence interval (drought condition)
            if current_rainfall < lower_ci(current_month)
                deficit_amount = lower_ci(current_month) - current_rainfall;
                
                % Track the month with the largest deficit
                if deficit_amount > max_deficit
                    max_deficit = deficit_amount;
                    selected_month_idx = month_idx;
                    selected_month = current_month;
                end
            end
        end
    end
    
    % If we found a month with deficit rainfall, create ONE payout for that year
    if ~isempty(selected_month_idx)
        % Calculate deficit amount
        deficit_amount = lower_ci(selected_month) - extended_rainfall(selected_month_idx);
        
        % Create export loss for drought (25% reduction from expected)
        drought_loss = expected_exports(selected_month_idx) * 0.25;
        
        % =================================================================
        % === Calculate payout as 66.6666% of loss (from Belize code) ===
        % =================================================================
        payout_amount = drought_loss * 0.666666;
        % =================================================================
        
        % Add to approved payouts (ONLY ONE PER YEAR)
        approved_payout_events = [approved_payout_events; selected_month_idx];
        approved_payout_amounts = [approved_payout_amounts; payout_amount];
        approved_payout_dates = [approved_payout_dates; dates(selected_month_idx)];
        approved_losses = [approved_losses; drought_loss];
        approved_deficit_rainfall = [approved_deficit_rainfall; deficit_amount];
        approved_event_names{end+1} = sprintf('El Niño Drought %d', current_year);
        
        drought_payout_count = drought_payout_count + 1;
        
        % Update exports data to reflect the loss
        extended_exports(selected_month_idx) = expected_exports(selected_month_idx) - drought_loss;
        
        fprintf('Added drought payout for %s: Deficit = %.2f mm, Loss = $%.2f, Payout = $%.2f\n', ...
                datestr(dates(selected_month_idx), 'mmm yyyy'), deficit_amount, drought_loss, payout_amount);
    end
end

% Step 4: Final Payout Calculation
total_approved_loss = sum(approved_losses);
total_approved_payout = sum(approved_payout_amounts);

fprintf('\n=== EL NIÑO DROUGHT INSURANCE PAYOUTS (SVG El Niño Years) ===\n');
fprintf('Number of drought payouts: %d\n', drought_payout_count);
fprintf('Total detected loss during drought events: $%.2f\n', total_approved_loss);
fprintf('Total insurance payout: $%.2f\n', total_approved_payout);
if total_approved_loss > 0
    fprintf('Payout ratio: %.2f%% of detected losses\n', (total_approved_payout/total_approved_loss)*100);
else
    fprintf('Payout ratio: N/A (No losses)\n');
end

% Step 5: Detailed Drought Event Analysis
fprintf('\n=== DETAILED DROUGHT PAYOUTS ===\n');
fprintf('Event\t\t\tDate\t\t\tRainfall\tLower CI\tDeficit\t\tLoss\t\tPayout\n');
for i = 1:length(approved_payout_events)
    event_idx = approved_payout_events(i);
    current_month = month_numbers(event_idx);
    
    fprintf('%-20s\t%s\t%.2f\t\t%.2f\t\t%.2f\t\t$%.2f\t$%.2f\n', ...
            approved_event_names{i}, ...
            datestr(approved_payout_dates(i), 'dd-mmm-yyyy'), ...
            extended_rainfall(event_idx), lower_ci(current_month), ...
            approved_deficit_rainfall(i), ...
            approved_losses(i), approved_payout_amounts(i));
end

% Step 6: Create 4-Subplot Figure
figure('Position', [100, 100, 1400, 1000]);

% Subplot 1: Drought Payouts by Month
subplot(2,2,1);
plot(1:12, monthly_avg, 'b-o', 'LineWidth', 2, 'MarkerSize', 6, 'DisplayName', '20-Year Average');
hold on;
plot(1:12, lower_ci, 'r--s', 'LineWidth', 2, 'MarkerSize', 4, 'DisplayName', 'Lower CI (95%)');

% Plot drought payout events by month
if ~isempty(approved_payout_dates)
    drought_months = month(approved_payout_dates);
    drought_rainfall = extended_rainfall(approved_payout_events);
    scatter(drought_months, drought_rainfall, 100, 'g', 'filled', 'DisplayName', 'Drought Payouts');
end

xlabel('Month');
ylabel('Rainfall (mm)');
title('Drought Payout Events by Month');
legend('Location', 'best');
grid on;
set(gca, 'XTick', 1:12, 'XTickLabel', month_names);

% Subplot 2: Timeline of Actual Rainfall with Drought Payouts (2000-2019 only)
subplot(2,2,2);

% Restrict to 2000–2019
start_date = datetime(2000,1,1);
end_date = datetime(2019,12,31);
mask_2000_2019 = (dates>=start_date & dates<=end_date);

dates_2000_2019 = dates(mask_2000_2019);
rainfall_2000_2019 = extended_rainfall(mask_2000_2019);

plot(dates_2000_2019, rainfall_2000_2019, 'b-','LineWidth',1); hold on;

% Plot lower CI monthly lines
for m = 1:12
    md = dates_2000_2019(month(dates_2000_2019)==m);
    plot(md, repmat(lower_ci(m), size(md)), 'm--','LineWidth',1);
end

% Drought payout points in 2000–2019
if ~isempty(approved_payout_dates)
    mask_payout_2000_2019 = (approved_payout_dates>=start_date & approved_payout_dates<=end_date);
    scatter(approved_payout_dates(mask_payout_2000_2019), ...
            extended_rainfall(approved_payout_events(mask_payout_2000_2019)), ...
            100,'r','filled', 'DisplayName', 'El Niño Payout');
end

% --- Removed Belize-specific year shading ---

ylabel('Rainfall (mm)');
title('Actual Rainfall, Lower CI & Payouts (2000–2019)');
legend('Location', 'best');
grid on;

% Subplot 3: Bar Chart of Individual Drought Payouts
subplot(2,2,3);
if ~isempty(approved_payout_amounts)
    bar(approved_payout_amounts, 'FaceColor', [0.8 0.2 0.2], 'EdgeColor', 'black');
    set(gca, 'XTick', 1:length(approved_event_names), 'XTickLabel', approved_event_names);
    xtickangle(45); % Angle labels for better readability
    ylabel('Payout Amount ($)');
    title('Individual Drought Insurance Payouts');
    grid on;

    % Add value labels on top of bars
    for i = 1:length(approved_payout_amounts)
        text(i, approved_payout_amounts(i), sprintf('$%.0f', approved_payout_amounts(i)), ...
             'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', ...
             'FontWeight', 'bold', 'FontSize', 8);
    end
else
    text(0.5, 0.5, 'No Payouts', 'HorizontalAlignment', 'center', 'FontSize', 12);
    title('Individual Drought Insurance Payouts');
end


% Subplot 4: Cumulative Insurance Payout for Droughts (2000-2019)
subplot(2,2,4);

% Filter payouts for 2000-2019 period
twenty_year_end = datetime(2019,12,31);
if ~isempty(approved_payout_dates)
    twenty_year_mask = (approved_payout_dates <= twenty_year_end);
    twenty_year_payouts = approved_payout_amounts(twenty_year_mask);
    twenty_year_dates = approved_payout_dates(twenty_year_mask);
else
    twenty_year_payouts = [];
    twenty_year_dates = [];
end


if ~isempty(twenty_year_payouts)
    [sorted_dates, sort_idx] = sort(twenty_year_dates);
    cumulative_payout = cumsum(twenty_year_payouts(sort_idx));
    plot(sorted_dates, cumulative_payout, 'g-', 'LineWidth', 3);
    
    % Add markers for each payout event
    hold on;
    scatter(sorted_dates, cumulative_payout, 80, 'filled', 'MarkerFaceColor', [0.2 0.6 0.2]);
    
    % Add value labels for each payout
    for i = 1:length(sorted_dates)
        text(sorted_dates(i), cumulative_payout(i), sprintf('$%.0f', cumulative_payout(i)), ...
             'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom', ...
             'FontSize', 9, 'Color', [0.2 0.6 0.2]);
    end
else
    plot([datetime(2000,1,1), datetime(2019,12,31)], [0, 0], 'g-', 'LineWidth', 3);
    text(datetime(2009,1,1), 0, 'No Drought Payouts 2000-2019', ...
         'HorizontalAlignment', 'center', 'FontSize', 12, 'Color', 'red');
end

xlabel('Year');
ylabel('Cumulative Payout ($)');
title('Cumulative Drought Insurance Payout (2000-2019)');
grid on;

% Add overall title for the figure
sgtitle('SVG Drought Insurance Payout Analysis (El Niño Years)', 'FontSize', 16, 'FontWeight', 'bold');

% Summary Statistics
fprintf('\n=== SUMMARY STATISTICS (SVG EL NIÑO DROUGHT PAYOUTS) ===\n');
fprintf('Number of El Niño years analyzed: %d\n', length(el_nino_years));
fprintf('Number of drought payouts: %d\n', length(approved_payout_events));
if ~isempty(approved_payout_amounts)
    fprintf('Average payout per drought event: $%.2f\n', mean(approved_payout_amounts));
    fprintf('Total insurance payout for drought: $%.2f\n', total_approved_payout);
    fprintf('Maximum single drought payout: $%.2f\n', max(approved_payout_amounts));
    fprintf('Average rainfall deficit: %.2f mm\n', mean(approved_deficit_rainfall));
else
    fprintf('No drought payouts to summarize.\n');
end

% Helper function to calculate expected exports
function expected = calculate_expected_exports(exports, dates)
    expected = zeros(size(exports));
    
    for i = 1:length(exports)
        current_date = dates(i);
        current_month = month(current_date);
        current_year = year(current_date);
        
        % Get same month from previous 5 years (excluding current year)
        baseline_years = [];
        for year_offset = 1:5
            target_year = current_year - year_offset;
            if target_year >= 2000 % Ensure we have data
                target_idx = find(year(dates) == target_year & month(dates) == current_month, 1);
                if ~isempty(target_idx) && target_idx <= length(exports)
                    baseline_years = [baseline_years, exports(target_idx)];
                end
            end
        end
        
        if ~isempty(baseline_years)
            expected(i) = mean(baseline_years);
        else
            % Fallback for early years (e.g., 2000) that don't have 5 prior years
            % Use the average of all available data up to this point
            if i > 1
                baseline_years = exports(1:i-1);
                baseline_months = month(dates(1:i-1));
                month_match = (baseline_months == current_month);
                if any(month_match)
                    expected(i) = mean(baseline_years(month_match));
                else
                     expected(i) = mean(exports(1:12)); % Use first year avg if no match
                end
            else
                 expected(i) = exports(i); % Use itself if it's the very first data point
            end
        end
    end
end