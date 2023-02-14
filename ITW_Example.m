% Clear and Initialize variables
close all
clear

fs = 128; % Sampling Frequency

% Load data
gML = table2array( readtable('./data/ITW_gML.csv') );

[FC, FO] = ITW_GetFootContacts(gML, fs);

h = figure
plot(gML, 'k', 'LineWidth',1.2); hold on;
plot(FC, gML(FC), 'or', 'MarkerFaceColor','r')
plot(FO, gML(FO), 'ob', 'MarkerFaceColor','b')
legend({'ML-Gyroscope', 'FCs', 'FOs'}, 'Location','northwest')
box off
xlabel('Time (samples)')
ylabel('Angular Velocity (rad / s)')
exportgraphics(h, './img/ITW_FIG.png', 'Resolution', 300)

