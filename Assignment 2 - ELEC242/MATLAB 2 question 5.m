% Mamadou Diao Kaba 27070179

ref = 1;
freq = 0.5:5:3000;

mag_dB_x1 = zeros(size(freq));
phase_x1 = zeros(size(freq));

mag_dB_x2 = zeros(size(freq));
phase_x2 = zeros(size(freq));

mag_dB_x3 = zeros(size(freq));
phase_X3 = zeros(size(freq));

for i = 1:length(freq)
    o = 2 * pi * freq(i); 
    % x1
    x1 = 1000 / ((1j*o)^2 + 40*1j*o + 40000);
    mag_dB_x1(i) = 20 * log10(abs(x1)/ref);
    phase_x1(i) = angle(x1);
    
    % x2
    x2 = 10000 / ((1j*o)^2 + 160 * 1j*o+1000);
    mag_dB_x2(i) = 20 * log10(abs(x2)/ref);
    phase_x2(i) = angle(x2);
    
    % x3
    x3 = (1j*o+100)/((1j*o+200)*(1j*o+10)*(1j*o+1000)*(1j*o+10000));
    mag_dB_x3(i) = 20 * log10(abs(x3)/ref);
    phase_X3(i) = angle(x3);
end

max_mag_x1 = max(mag_dB_x1);
max_mag_x2 = max(mag_dB_x2);
max_mag_x3 = max(mag_dB_x3);

% Plot magnitude x1
figure;
plot(log10(freq), mag_dB_x1);
xlabel('freq (log10(Hz))');
ylabel('Magnitude (dB)');
title('x1 Magnitude vs. Log of Frequency');

% Plot phase x1
figure;
plot(log10(freq), phase_x1);
xlabel('freq (log10(Hz))');
ylabel('Phase (rad)');
title('x1 Phase vs. Log of Frequency');

% Plot magnitude x2
figure;
plot(log10(freq), mag_dB_x2);
xlabel('freq (log10(Hz))');
ylabel('Magnitude (dB)');
title('x2 Magnitude vs. Log of Frequency');

% Plot phase x2
figure;
plot(log10(freq), phase_x2);
xlabel('freq (log10(Hz))');
ylabel('Phase (rad)');
title('x2 Phase vs. Log of Frequency');

% Plot magnitude x3
figure;
plot(log10(freq), mag_dB_x3);
xlabel('freq (log10(Hz))');
ylabel('Magnitude (dB)');
title('x3 Magnitude vs. Log of Frequency');

% Plot phase x3
figure;
plot(log10(freq), phase_X3);
xlabel('freq (log10(Hz))');
ylabel('Phase (rad)');
title('x3 Phase vs. Log of Frequency');


% frequencies with low and high attenuation
low_att_x1 = freq(mag_dB_x1 >= max_mag_x1 - 20);
high_att_x1 = freq(mag_dB_x1 <= max_mag_x1 - 30);

low_att_x2 = freq(mag_dB_x2 >= max_mag_x2 - 20);
high_att_x2 = freq(mag_dB_x2 <= max_mag_x2 - 30);

low_att_x3 = freq(mag_dB_x3 >= max_mag_x3 - 20);
high_att_x3 = freq(mag_dB_x3 <= max_mag_x3 - 30);

fprintf('Low attenuation frequencies for x1 from %.2f Hz to %.2f Hz\n', min(low_att_x1), max(low_att_x1));
fprintf('High attenuation frequencies for x1 from %.2f Hz to %.2f Hz\n', min(high_att_x1), max(high_att_x1));

fprintf('Low attenuation frequencies for x2 from: %.2f Hz to %.2f Hz\n', min(low_att_x2), max(low_att_x2));
fprintf('High attenuation frequencies for x2 from %.2f Hz to %.2f Hz\n', min(high_att_x2), max(high_att_x2));

fprintf('Low attenuation frequencies for x3 from %.2f Hz to %.2f Hz\n', min(low_att_x3), max(low_att_x3));
fprintf('High attenuation frequencies for x3 from %.2f Hz to %.2f Hz\n', min(high_att_x3), max(high_att_x3));