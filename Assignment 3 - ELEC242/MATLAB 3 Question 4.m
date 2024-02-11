% Mamadou Diao Kaba 27070179

R = 1000; 
C = 0.25e-6; 
L = 20e-3; 

% Frequency range
frequencies = logspace(1, 5, 1000); % 10 Hz to 100 kHz

% Calculate the magnitude of the frequency response for Question 1
H = 1./sqrt(1 + (R*C*2*pi*frequencies).^2 + L*C*(2*pi*frequencies).^2);

% Find the maximum magnitude and corresponding frequency for Question 1
[max_magnitude_1, idx_max_1] = max(H);
max_frequency_1 = frequencies(idx_max_1);

% Plot the magnitude versus frequency for Question 1
subplot(2,2,1);
semilogx(frequencies, abs(H));
title('Magnitude vs Frequency (Question 1)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Identify frequencies with low attenuation (within 20 dB of maximum magnitude) for Question 1
low_attenuation_idx_1 = find(20*log10(H) >= max_magnitude_1 - 20);
low_attenuation_frequencies_1 = frequencies(low_attenuation_idx_1);

% Identify frequencies with high attenuation (less than 30 dB of maximum magnitude) for Question 1
high_attenuation_idx_1 = find(20*log10(H) < max_magnitude_1 - 30);
high_attenuation_frequencies_1 = frequencies(high_attenuation_idx_1);

% Plot low and high attenuation frequencies on the same plot for Question 1
subplot(2,2,2);
semilogx(frequencies, 20*log10(H));
hold on;
scatter(low_attenuation_frequencies_1, 20*log10(H(low_attenuation_idx_1)), 'b', 'filled', 'DisplayName', 'Low Attenuation');
scatter(high_attenuation_frequencies_1, 20*log10(H(high_attenuation_idx_1)), 'o', 'filled', 'DisplayName', 'High Attenuation');
hold off;
title('Low and High Attenuation Frequencies (Question 1)');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
legend('show');
grid on;

% Calculate the impedance of the capacitor and inductor for Question 2
Z_C = 1./(1i*2*pi*frequencies*C);
Z_L = 1i*2*pi*frequencies*L;

% Calculate the impedance of the parallel RLC circuit for Question 2
Z_parallel = 1./(1/R + 1./Z_C + 1./Z_L);

% Calculate the magnitude of the frequency response for Question 2
H2 = abs(Z_parallel./(R + Z_parallel));

% Find the maximum magnitude and corresponding frequency for Question 2
[max_magnitude_2, idx_max_2] = max(H2);
max_frequency_2 = frequencies(idx_max_2);

% Plot the magnitude versus frequency for Question 2
subplot(2,2,3);
semilogx(frequencies, abs(H2));
title('Magnitude vs Frequency (Question 2)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Identify frequencies with low attenuation (within 20 dB of maximum magnitude) for Question 2
low_attenuation_idx_2 = find(20*log10(H2) >= max_magnitude_2 - 20);
low_attenuation_frequencies_2 = frequencies(low_attenuation_idx_2);

% Identify frequencies with high attenuation (less than 30 dB of maximum magnitude) for Question 2
high_attenuation_idx_2 = find(20*log10(H2) < max_magnitude_2 - 30);
high_attenuation_frequencies_2 = frequencies(high_attenuation_idx_2);

% Plot low and high attenuation frequencies on the same plot for Question 2
subplot(2,2,4);
semilogx(frequencies, 20*log10(H2));
hold on;
scatter(low_attenuation_frequencies_2, 20*log10(H2(low_attenuation_idx_2)), 'b', 'filled', 'DisplayName', 'Low Attenuation');
scatter(high_attenuation_frequencies_2, 20*log10(H2(high_attenuation_idx_2)), 'o', 'filled', 'DisplayName', 'High Attenuation');
hold off;
title('Low and High Attenuation Frequencies (Question 2)');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
legend('show');
grid on;

% Display frequency range with low attenuation (within 20 dB) for Question 1
fprintf('Frequency range with low attenuation (within 20 dB - Q1): %.2f Hz to %.2f Hz\n', min(low_attenuation_frequencies_1), max(low_attenuation_frequencies_1));

% Display frequency range with high attenuation (less than 30 dB) for Question 1
fprintf('Frequency range with high attenuation (less than 30 dB - Q1): %.2f Hz to %.2f Hz\n', min(high_attenuation_frequencies_1), max(high_attenuation_frequencies_1));

% Display frequency range with low attenuation (within 20 dB) for Question 2
fprintf('Frequency range with low attenuation (within 20 dB - Q2): %.2f Hz to %.2f Hz\n', min(low_attenuation_frequencies_2), max(low_attenuation_frequencies_2));

% Display frequency range with high attenuation (less than 30 dB) for Question 2
fprintf('Frequency range with high attenuation (less than 30 dB - Q2): %.2f Hz to %.2f Hz\n', min(high_attenuation_frequencies_2), max(high_attenuation_frequencies_2));