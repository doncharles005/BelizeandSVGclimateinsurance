% Belize Data Visualization: Original vs Transformed Data
% Clear workspace
clear; clc; close all;

% Belize Data
belizerain = [60.43; 38.91; 32.93; 36.69; 188.76; 207.92; 101.38; 204.69; 204.25; 345.84; 96.11; 80.36; 57.6; 86.04; 25.19; 48.97; 173.64; 100.77; 116.14; 202.81; 211.02; 223.61; 68.09; 130.25; 55.95; 79.6; 64.52; 33.99; 143.99; 189.71; 157.91; 128.22; 159.88; 157.59; 100.1; 108.23; 54.43; 56.45; 50.67; 43.42; 95.65; 159.57; 158.53; 121.48; 151; 210.95; 172.76; 73.6; 68.06; 56.95; 83.43; 56.9; 184.4; 173.32; 135.79; 103.93; 149.53; 173.66; 139.36; 64.72; 51.75; 24.53; 32.45; 45.29; 85.36; 229.72; 220.9; 236.19; 203.81; 155.81; 138.51; 96.9; 129.39; 57.77; 53; 39.97; 124.05; 291.43; 217.61; 168.69; 153.99; 205.05; 184.09; 200.82; 118.93; 31.07; 60.82; 32.1; 107.15; 186.36; 137.56; 234.82; 261.87; 236.7; 147; 58.16; 83.34; 69.46; 64.03; 38.79; 148.01; 262.21; 194.7; 107.12; 224.13; 371.63; 22.51; 62.15; 120.29; 43.65; 38.5; 57.39; 96.88; 159.96; 139.26; 140.45; 160.53; 113.95; 153.05; 105.85; 67.89; 28.05; 38.12; 78.73; 222.49; 165.31; 253.14; 267.7; 232.57; 110.23; 100.06; 35.53; 48.79; 61.23; 52.9; 31.71; 61.23; 206.6; 255.96; 215.47; 239.02; 241.98; 82.07; 94.46; 100.79; 75.04; 76.38; 69.64; 248.72; 232.49; 181.86; 202.84; 117.81; 160.87; 80.01; 56.68; 115.1; 54.52; 41.54; 29.87; 132.81; 274.74; 193.33; 232.16; 291.11; 242.02; 177.88; 156.66; 108.61; 54.62; 49.96; 41; 195.33; 220.51; 123.17; 115.64; 277.99; 261.02; 190.16; 85.29; 88.35; 35.59; 101.26; 68.13; 79.13; 256.73; 119.87; 83.93; 190.67; 230.78; 251.74; 127.66; 43.08; 77.38; 70.94; 50.12; 58.08; 270.61; 152.69; 253.04; 198.88; 139.88; 131.23; 120.03; 44.19; 45.7; 65.36; 67.36; 106.72; 258.06; 182.51; 191; 203.55; 360.31; 86.45; 74.24; 111.13; 78.71; 40.3; 54.45; 114.3; 230.31; 138.29; 199.64; 168.27; 244.86; 105.07; 51.82; 60.08; 36.22; 37.57; 71.4; 99.38; 136.64; 88.38; 90.14; 144.36; 227.31; 74.47; 72.81];

belizeexports = [19117.54117; 32091.12833; 45064.7155; 58038.30267; 71011.88983; 83985.477; 96959.06417; 109932.6513; 122906.2385; 135879.8257; 148853.4128; 161827; 153579.9546; 145332.9092; 137085.8638; 128838.8183; 120591.7729; 112344.7275; 104097.6821; 95850.63667; 87603.59125; 79356.54583; 71109.50042; 62862.455; 60573.8095; 58285.164; 55996.5185; 53707.873; 51419.2275; 49130.582; 46841.9365; 44553.291; 42264.6455; 39976; 37687.3545; 35398.709; 46699.38342; 58000.05783; 69300.73225; 80601.40667; 91902.08108; 103202.7555; 114503.4299; 125804.1043; 137104.7788; 148405.4532; 159706.1276; 171006.802; 171750.2578; 172493.7135; 173237.1693; 173980.625; 174724.0808; 175467.5365; 176210.9923; 176954.448; 177697.9038; 178441.3595; 179184.8153; 179928.271; 179075.4709; 178222.6708; 177369.8708; 176517.0707; 175664.2706; 174811.4705; 173958.6704; 173105.8703; 172253.0703; 171400.2702; 170547.4701; 169694.67; 172038.2791; 174381.8882; 176725.4973; 179069.1063; 181412.7154; 183756.3245; 186099.9336; 188443.5427; 190787.1518; 193130.7608; 195474.3699; 197817.979; 195211.2649; 192604.5508; 189997.8368; 187391.1227; 184784.4086; 182177.6945; 179570.9804; 176964.2663; 174357.5523; 171750.8382; 169144.1241; 166537.41; 166737.0345; 166936.659; 167136.2835; 167335.908; 167535.5325; 167735.157; 167934.7815; 168134.406; 168334.0305; 168533.655; 168733.2795; 168932.904; 168682.1455; 168431.387; 168180.6285; 167929.87; 167679.1115; 167428.353; 167177.5945; 166926.836; 166676.0775; 166425.319; 166174.5605; 165923.802; 165522.8841; 165121.9662; 164721.0483; 164320.1303; 163919.2124; 163518.2945; 163117.3766; 162716.4587; 162315.5408; 161914.6228; 161513.7049; 161112.787; 161898.7792; 162684.7713; 163470.7635; 164256.7557; 165042.7478; 165828.74; 166614.7322; 167400.7243; 168186.7165; 168972.7087; 169758.7008; 170544.693; 175698.2538; 180851.8145; 186005.3753; 191158.936; 196312.4968; 201466.0575; 206619.6183; 211773.179; 216926.7398; 222080.3005; 227233.8613; 232387.422; 234423.9215; 236460.421; 238496.9205; 240533.42; 242569.9195; 244606.419; 246642.9185; 248679.418; 250715.9175; 252752.417; 254788.9165; 256825.416; 251761.9575; 246698.499; 241635.0405; 236571.582; 231508.1235; 226444.665; 221381.2065; 216317.748; 211254.2895; 206190.831; 201127.3725; 196063.914; 195402.1503; 194740.3865; 194078.6228; 193416.859; 192755.0953; 192093.3315; 191431.5678; 190769.804; 190108.0403; 189446.2765; 188784.5128; 188122.749; 184339.2066; 180555.6642; 176772.1218; 172988.5793; 169205.0369; 165421.4945; 161637.9521; 157854.4097; 154070.8673; 150287.3248; 146503.7824; 142720.24; 147029.1561; 151338.0722; 155646.9883; 159955.9043; 164264.8204; 168573.7365; 172882.6526; 177191.5687; 181500.4848; 185809.4008; 190118.3169; 194427.233; 192450.7639; 190474.2948; 188497.8258; 186521.3567; 184544.8876; 182568.4185; 180591.9494; 178615.4803; 176639.0113; 174662.5422; 172686.0731; 170709.604; 171710.6738; 172711.7435; 173712.8133; 174713.883; 175714.9528; 176716.0225; 177717.0923; 178718.162; 179719.2318; 180720.3015; 181721.3713; 182722.441];

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

% Apply the transformation
rain_norm = (belizerain - mean(belizerain)) / std(belizerain);
exports_norm = (belizeexports - mean(belizeexports)) / std(belizeexports);

% Base transformation
transformed_exports = -exports_norm + (rain_norm * 0.3);

% Create strong, localized "islands" around hurricane months
for i = 1:length(hurricane_indices)
    idx = hurricane_indices(i);
    
    window_start = max(1, idx - 1);
    window_end = min(length(transformed_exports), idx + 2);
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
        transformed_exports(window_indices(j)) = transformed_exports(window_indices(j)) + pattern(j);
    end
end

% Add seasonal hurricane season effects
hurricane_season_months = [6, 7, 8, 9, 10, 11];
for year = 2000:2019
    for month = hurricane_season_months
        idx = find(dates.Year == year & dates.Month == month, 1);
        if ~isempty(idx) && ~ismember(idx, hurricane_indices)
            transformed_exports(idx) = transformed_exports(idx) - 0.15;
        end
    end
end

% Add multi-year cycles
t = (1:length(transformed_exports))';
multi_year_cycle = 0.1 * sin(2*pi*t/24) + 0.05 * sin(2*pi*t/48);
transformed_exports = transformed_exports + multi_year_cycle;

% Rescale back to original export range
transformed_exports_rescaled = (transformed_exports * std(belizeexports)) + mean(belizeexports);

% Calculate correlations
original_corr = corr(belizerain, belizeexports);
transformed_corr = corr(belizerain, transformed_exports_rescaled);

% Create the main figure with three subplots
figure('Position', [100, 100, 1400, 900]);

% Subplot 1: Original Data – Rainfall vs Exports
subplot(3,1,1);
yyaxis left
plot(dates, belizerain, 'b-', 'LineWidth', 2);
ylabel('Rainfall (mm)', 'FontSize', 11, 'FontWeight', 'bold');
yyaxis right
plot(dates, belizeexports, 'r-', 'LineWidth', 2);
ylabel('Exports', 'FontSize', 11, 'FontWeight', 'bold');
title('Original Data – Rainfall vs Exports', 'FontSize', 14, 'FontWeight', 'bold');
legend('Rainfall', 'Exports', 'Location', 'northwest');
grid on;
set(gca, 'FontSize', 10);

% Mark hurricane months
yyaxis left
hold on;
for i = 1:length(hurricane_indices)
    plot([dates(hurricane_indices(i)) dates(hurricane_indices(i))], ylim, 'k--', 'LineWidth', 1);
    text(dates(hurricane_indices(i)), max(ylim)*0.95, 'H', ...
         'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'Color', 'red', 'FontSize', 12);
end

% Subplot 2: Transformed Data – Rainfall vs Transformed Exports
subplot(3,1,2);
yyaxis left
plot(dates, belizerain, 'b-', 'LineWidth', 2);
ylabel('Rainfall (mm)', 'FontSize', 11, 'FontWeight', 'bold');
yyaxis right
plot(dates, transformed_exports_rescaled, 'r-', 'LineWidth', 2);
ylabel('Transformed Exports', 'FontSize', 11, 'FontWeight', 'bold');
title(sprintf('Transformed Data – Rainfall vs Transformed Exports (Correlation: %.4f)', transformed_corr), ...
      'FontSize', 14, 'FontWeight', 'bold');
legend('Rainfall', 'Transformed Exports', 'Location', 'northwest');
grid on;
set(gca, 'FontSize', 10);

% Mark hurricane months
yyaxis left
hold on;
for i = 1:length(hurricane_indices)
    plot([dates(hurricane_indices(i)) dates(hurricane_indices(i))], ylim, 'k--', 'LineWidth', 1);
    text(dates(hurricane_indices(i)), max(ylim)*0.95, 'H', ...
         'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'Color', 'red', 'FontSize', 12);
end

% Subplot 3: Comparison – Rainfall (scaled) vs Transformed Exports
subplot(3,1,3);
% Scale rainfall to match transformed exports range for better comparison
rain_scaled = (belizerain - mean(belizerain)) / std(belizerain) * std(transformed_exports_rescaled) + mean(transformed_exports_rescaled);

plot(dates, rain_scaled, 'b-', 'LineWidth', 2, 'DisplayName', 'Rainfall (scaled)');
hold on;
plot(dates, transformed_exports_rescaled, 'r-', 'LineWidth', 2, 'DisplayName', 'Transformed Exports');
title('Comparison: Rainfall (scaled) vs Transformed Exports', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('Value', 'FontSize', 11, 'FontWeight', 'bold');
xlabel('Time', 'FontSize', 11, 'FontWeight', 'bold');
legend('Location', 'northwest');
grid on;
set(gca, 'FontSize', 10);

% Mark hurricane months with highlighted regions
for i = 1:length(hurricane_indices)
    idx = hurricane_indices(i);
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
sgtitle('Belize Data Analysis: Impact of Hurricane Transformation on Rainfall-Exports Relationship', ...
        'FontSize', 16, 'FontWeight', 'bold');

% Display correlation information
fprintf('Belize Data Correlation Analysis:\n');
fprintf('Original correlation between rainfall and exports: %.4f\n', original_corr);
fprintf('Transformed correlation between rainfall and exports: %.4f\n', transformed_corr);
fprintf('Correlation improvement: %.4f\n', transformed_corr - original_corr);

% Save the figure
saveas(gcf, 'Belize_Data_Comparison.png');
fprintf('Figure saved as "Belize_Data_Comparison.png"\n');

% Display hurricane information
fprintf('\nHurricane months analyzed:\n');
for i = 1:length(hurricane_months)
    fprintf('%s\n', datestr(hurricane_months(i), 'mmmm yyyy'));
end