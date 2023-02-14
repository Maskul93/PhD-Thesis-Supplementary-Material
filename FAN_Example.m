%% Clear and Initialize Variables
close all
clear

fs = 100; % Sampling Frequency

% Tuning Parameters for KF
acc_noise = (6.78 * 10^(-7))^.5;
gyr_noise = (5.23 * 10^(-5))^.5;

%% Build FUSE KF
FUSE = ahrsfilter('SampleRate', fs, 'AccelerometerNoise', acc_noise, ...
    'GyroscopeNoise', gyr_noise, 'OrientationFormat', 'Rotation matrix');

%% Load Functional Calibration Trial
FC = readtable('./data/FAN_FC_FOOT.csv');

D.acc = [FC.ax, FC.ay, FC.az];
D.gyr = [FC.gx, FC.gy, FC.gz];
D.mag = [FC.mx, FC.my, FC.mz];

% ACS Functional Axis
a_F = get_functional_axes(D, fs);

% Shank Vertical Axis
POSTURE_SH = readtable('./data/FAN_STATIC_SHANK.csv');
a_v = unit( mean( [POSTURE_SH.ax, POSTURE_SH.ay, POSTURE_SH.az] ) );

POSTURE_FT = readtable('./data/FAN_STATIC_FOOT.csv');
POSTURE_CA = readtable('./data/FAN_STATIC_CALIB.csv');

% Foot Long Axis
R_cali = quat2rotm( get_q0([POSTURE_CA.ax, POSTURE_CA.ay, POSTURE_CA.az], ...
    [POSTURE_CA.mx, POSTURE_CA.my, POSTURE_CA.mz]) );
R_foot = quat2rotm( get_q0([POSTURE_FT.ax, POSTURE_FT.ay, POSTURE_FT.az], ...
    [POSTURE_FT.mx, POSTURE_FT.my, POSTURE_FT.mz]) );

a_l = R_foot' * R_cali(:,1);

% Shank ACS
Z_sh = a_F;
X_sh = unit( cross( Z_sh, a_v ) );
Y_sh = unit( cross( Z_sh, X_sh ) );
R_sh = [X_sh', Y_sh', Z_sh'];

% Foot ACS
Z_ft = a_F;
Y_ft = unit( cross( a_l, Z_ft ) );
X_ft = unit( cross( Y_ft, Z_ft ) );
R_ft = [X_ft', Y_ft', Z_ft'];

h = figure
subplot(121); plot_DCM(R_sh, 'Shank ACS')
subplot(122); plot_DCM(R_ft, 'Foot ACS')
exportgraphics(h, './img/FAN_FIG.png', 'Resolution', 300)