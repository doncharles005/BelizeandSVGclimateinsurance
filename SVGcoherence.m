
% Wavelet Coherence between belizerain and belizeloss
figure;

% Calculate and plot wavelet coherence
wcoherence(SVG_rain_scaled, SVG_transformed_exports);

% Customize the plot (optional)
title('Wavelet Coherence: SVG rain scaled vs SVG transformed exports');
xlabel('Time (or Years)');
ylabel('Period (or Months)');