% Calculate Loss and Insurance Payout for Belize using 95% Confidence Interval
% Clear workspace
clear; clc; close all;

% Belize Data
belizerain = [60.43; 38.91; 32.93; 36.69; 188.76; 207.92; 101.38; 204.69; 204.25; 345.84; 96.11; 80.36; 57.6; 86.04; 25.19; 48.97; 173.64; 100.77; 116.14; 202.81; 211.02; 223.61; 68.09; 130.25; 55.95; 79.6; 64.52; 33.99; 143.99; 189.71; 157.91; 128.22; 159.88; 157.59; 100.1; 108.23; 54.43; 56.45; 50.67; 43.42; 95.65; 159.57; 158.53; 121.48; 151; 210.95; 172.76; 73.6; 68.06; 56.95; 83.43; 56.9; 184.4; 173.32; 135.79; 103.93; 149.53; 173.66; 139.36; 64.72; 51.75; 24.53; 32.45; 45.29; 85.36; 229.72; 220.9; 236.19; 203.81; 155.81; 138.51; 96.9; 129.39; 57.77; 53; 39.97; 124.05; 291.43; 217.61; 168.69; 153.99; 205.05; 184.09; 200.82; 118.93; 31.07; 60.82; 32.1; 107.15; 186.36; 137.56; 234.82; 261.87; 236.7; 147; 58.16; 83.34; 69.46; 64.03; 38.79; 148.01; 262.21; 194.7; 107.12; 224.13; 371.63; 22.51; 62.15; 120.29; 43.65; 38.5; 57.39; 96.88; 159.96; 139.26; 140.45; 160.53; 113.95; 153.05; 105.85; 67.89; 28.05; 38.12; 78.73; 222.49; 165.31; 253.14; 267.7; 232.57; 110.23; 100.06; 35.53; 48.79; 61.23; 52.9; 31.71; 61.23; 206.6; 255.96; 215.47; 239.02; 241.98; 82.07; 94.46; 100.79; 75.04; 76.38; 69.64; 248.72; 232.49; 181.86; 202.84; 117.81; 160.87; 80.01; 56.68; 115.1; 54.52; 41.54; 29.87; 132.81; 274.74; 193.33; 232.16; 291.11; 242.02; 177.88; 156.66; 108.61; 54.62; 49.96; 41; 195.33; 220.51; 123.17; 115.64; 277.99; 261.02; 190.16; 85.29; 88.35; 35.59; 101.26; 68.13; 79.13; 256.73; 119.87; 83.93; 190.67; 230.78; 251.74; 127.66; 43.08; 77.38; 70.94; 50.12; 58.08; 270.61; 152.69; 253.04; 198.88; 139.88; 131.23; 120.03; 44.19; 45.7; 65.36; 67.36; 106.72; 258.06; 182.51; 191; 203.55; 360.31; 86.45; 74.24; 111.13; 78.71; 40.3; 54.45; 114.3; 230.31; 138.29; 199.64; 168.27; 244.86; 105.07; 51.82; 60.08; 36.22; 37.57; 71.4; 99.38; 136.64; 88.38; 90.14; 144.36; 227.31; 74.47; 72.81];

belizeexports = [19117.54117; 32091.12833; 45064.7155; 58038.30267; 71011.88983; 83985.477; 96959.06417; 109932.6513; 122906.2385; 135879.8257; 148853.4128; 161827; 153579.9546; 145332.9092; 137085.8638; 128838.8183; 120591.7729; 112344.7275; 104097.6821; 95850.63667; 87603.59125; 79356.54583; 71109.50042; 62862.455; 60573.8095; 58285.164; 55996.5185; 53707.873; 51419.2275; 49130.582; 46841.9365; 44553.291; 42264.6455; 39976; 37687.3545; 35398.709; 46699.38342; 58000.05783; 69300.73225; 80601.40667; 91902.08108; 103202.7555; 114503.4299; 125804.1043; 137104.7788; 148405.4532; 159706.1276; 171006.802; 171750.2578; 172493.7135; 173237.1693; 173980.625; 174724.0808; 175467.5365; 176210.9923; 176954.448; 177697.9038; 178441.3595; 179184.8153; 179928.271; 179075.4709; 178222.6708; 177369.8708; 176517.0707; 175664.2706; 174811.4705; 173958.6704; 173105.8703; 172253.0703; 171400.2702; 170547.4701; 169694.67; 172038.2791; 174381.8882; 176725.4973; 179069.1063; 181412.7154; 183756.3245; 186099.9336; 188443.5427; 190787.1518; 193130.7608; 195474.3699; 197817.979; 195211.2649; 192604.5508; 189997.8368; 187391.1227; 184784.4086; 182177.6945; 179570.9804; 176964.2663; 174357.5523; 171750.8382; 169144.1241; 166537.41; 166737.0345; 166936.659; 167136.2835; 167335.908; 167535.5325; 167735.157; 167934.7815; 168134.406; 168334.0305; 168533.655; 168733.2795; 168932.904; 168682.1455; 168431.387; 168180.6285; 167929.87; 167679.1115; 167428.353; 167177.5945; 166926.836; 166676.0775; 166425.319; 166174.5605; 165923.802; 165522.8841; 165121.9662; 164721.0483; 164320.1303; 163919.2124; 163518.2945; 163117.3766; 162716.4587; 162315.5408; 161914.6228; 161513.7049; 161112.787; 161898.7792; 162684.7713; 163470.7635; 164256.7557; 165042.7478; 165828.74; 166614.7322; 167400.7243; 168186.7165; 168972.7087; 169758.7008; 170544.693; 175698.2538; 180851.8145; 186005.3753; 191158.936; 196312.4968; 201466.0575; 206619.6183; 211773.179; 216926.7398; 222080.3005; 227233.8613; 232387.422; 234423.9215; 236460.421; 238496.9205; 240533.42; 242569.9195; 244606.419; 246642.9185; 248679.418; 250715.9175; 252752.417; 254788.9165; 256825.416; 251761.9575; 246698.499; 241635.0405; 236571.582; 231508.1235; 226444.665; 221381.2065; 216317.748; 211254.2895; 206190.831; 201127.3725; 196063.914; 195402.1503; 194740.3865; 194078.6228; 193416.859; 192755.0953; 192093.3315; 191431.5678; 190769.804; 190108.0403; 189446.2765; 188784.5128; 188122.749; 184339.2066; 180555.6642; 176772.1218; 172988.5793; 169205.0369; 165421.4945; 161637.9521; 157854.4097; 154070.8673; 150287.3248; 146503.7824; 142720.24; 147029.1561; 151338.0722; 155646.9883; 159955.9043; 164264.8204; 168573.7365; 172882.6526; 177191.5687; 181500.4848; 185809.4008; 190118.3169; 194427.233; 192450.7639; 190474.2948; 188497.8258; 186521.3567; 184544.8876; 182568.4185; 180591.9494; 178615.4803; 176639.0113; 174662.5422; 172686.0731; 170709.604; 171710.6738; 172711.7435; 173712.8133; 174713.883; 175714.9528; 176716.0225; 177717.0923; 178718.162; 179719.2318; 180720.3015; 181721.3713; 182722.441];

% Create time vector (extended to cover all hurricane years)
dates = datetime(2000,1,1):calmonths(1):datetime(2024,12,31);

% Extract month numbers from dates
month_numbers = month(dates); % This gives numeric month values (1-12)

% Step 1: Calculate Monthly 20-Year Averages and 95% Confidence Intervals
% Using 2000-2019 as baseline period
baseline_dates = datetime(2000,1,1):calmonths(1):datetime(2019,12,31);
baseline_month_numbers = month(baseline_dates);
baseline_rain = belizerain(1:240); % First 240 months (2000-2019)

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

% Step 2: Create synthetic rainfall data for 2020-2024 to cover all hurricanes
extended_rainfall = [belizerain; zeros(60,1)]; % Add 5 years (2020-2024)
extended_exports = [belizeexports; zeros(60,1)]; % Add 5 years (2020-2024)

% For years beyond 2019, use baseline averages
for i = 241:length(extended_rainfall)
    current_date = dates(i);
    current_month = month(current_date);
    extended_rainfall(i) = monthly_avg(current_month);
    extended_exports(i) = mean(belizeexports);
end

% Step 3: ADD DROUGHT PAYOUTS FOR EL NIÑO YEARS 2018-2019 (DEFICIT RAINFALL)
el_nino_years = [2018, 2019];
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
        % ===  Calculate payout as 66.6666% of loss ===
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

fprintf('\n=== EL NIÑO DROUGHT INSURANCE PAYOUTS (2018-2019) ===\n');
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
            100,'r','filled');
end

% ---- FIXED SHADING USING PATCH (works with datetime) ----
yl = ylim;
patch([datetime(2018,1,1), datetime(2019,12,31), ...
       datetime(2019,12,31), datetime(2018,1,1)], ...
      [yl(1) yl(1) yl(2) yl(2)], ...
      [1 0.8 0.8], 'FaceAlpha',0.4, 'EdgeColor','none');

ylabel('Rainfall (mm)');
title('Actual Rainfall, Lower CI & Payouts (2000–2019)');
grid on;

% Subplot 3: Bar Chart of Individual Drought Payouts
subplot(2,2,3);
if ~isempty(approved_payout_amounts)
    bar(approved_payout_amounts, 'FaceColor', [0.8 0.2 0.2], 'EdgeColor', 'black');
    set(gca, 'XTick', 1:length(approved_event_names), 'XTickLabel', approved_event_names);
    ylabel('Payout Amount ($)');
    title('Individual Drought Insurance Payouts');
    grid on;

    % Add value labels on top of bars
    for i = 1:length(approved_payout_amounts)
        text(i, approved_payout_amounts(i), sprintf('$%.2f', approved_payout_amounts(i)), ...
             'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', ...
             'FontWeight', 'bold', 'FontSize', 10);
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
sgtitle('Belize Drought Insurance Payout Analysis (El Niño Years 2018-2019)', 'FontSize', 16, 'FontWeight', 'bold');

% Summary Statistics
fprintf('\n=== SUMMARY STATISTICS (EL NIÑO DROUGHT PAYOUTS) ===\n');
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
            expected(i) = mean(exports); % Fallback to overall mean
        end
    end
end