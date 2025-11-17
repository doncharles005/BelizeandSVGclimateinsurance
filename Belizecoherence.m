
% Wavelet Coherence between belizerain and belizeloss
figure;

% Calculate and plot wavelet coherence
wcoherence(rain_scaled, transformed_exports);

% Customize the plot (optional)
title('Wavelet Coherence: Belize rain scaled vs Belize transformed exports');
xlabel('Time (or Years)');
ylabel('Period (or Months)');