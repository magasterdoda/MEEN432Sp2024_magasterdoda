%%% Initialization File for P4 

%% Vehicle Parameters 
carData.Inertia = 1600;     % kg-m^2 - Car Inertia
carData.Mass = 1000;        % kg - Car Mass

%% Initial Conditions
carData.init.X0 = 0;        % m - Initial X Position of the Car
carData.init.Y0 = 0;        % m - Initial Y Position of the Car
carData.init.vx0 = 0.1;     % m/s - Initial Velocity in X of the Car
carData.init.vy0 = 0;       % m/s - Initial Velocity in Y of the Car
carData.init.omega0 = 0;    % rad/s - Initial Yaw Rate of the Car
carData.init.psi0 = 0;      % rad - Initial Heading of the Car

%% Vehicle Tire Information 
carData.Calpha_f = 40000;           % N/rad - Front Tire Coefficient (slope)
carData.Calpha_r = 40000;           % N/rad - Rear Tire Coefficient (slope)
carData.Fyfmax = 40000*1/180*pi;    % N - Max Front Tire Force
carData.Fyrmax = 40000*1/180*pi;    % N - Max Rear Tire Force
carData.lr = 1.5;                   % m - Distance from CG to rear axis
carData.lf = 1.0;                   % m - Distance from CG to front axis
carData.r = 0.3;                    % m - Radius of tires
carData.Iw = 0.5*7*(carData.r^2);   % kg-m^2 - Inertia of the tire
track_radius = 200;
carData.understeerCoeff = ...       % Understeering Coefficient 
    carData.Mass / ((carData.lr + carData.lf) * track_radius) ...
      * (carData.lr / carData.Calpha_f - ...
         carData.lf / carData.Calpha_r);

carData.maxAlpha = 4 / 180 * pi;    % Max Alpha Angle for Tires

%% Gear Ratio Information
carData.FDG = 2.5; % Final Drive Gear Ratio

% NOTE: Meant for teams utilizing switching gear ratios
carData.gearRatio1 = 10.0;
carData.gearRatio2 = 3.0;
carData.gearRatio3 = 1.0;

%% Velocity Information
carData.vxd = 15.0;          % m/s - Desired Velocity in X
carData.vx_threshold1 = 0.1; % m/s - Threshold for Velocity in X

%% Longitudinal Dynamics Properties
carData.C0 = 0.0041;         % N - Static Friction Coefficient 
carData.C1 = 0.000066;       % N/(m/s) - Rolling Friction Coefficient

% Parameters for Calculation of C2
Rho =1.225;                  % Kg/m^3 - Density of Atmosphere
A  = 2.32;                   % m^2 - Projected Area
Cd = 0.36;                   % unitless - Drag Coefficient
carData.C2 = 0.5*Rho*A*Cd;   % N/(m/s)^2 - Aerodynamic Drag Coefficient

%% Electric Motor Data (HVH410-150 Electric Motor)
%scaleFactor = 0.75;
motorData.Inertia = 1.09; % kg-m^2 - Motor Rotational Inertia
motorData.Mass = 140;     % kg - Motor Mass

motorData.rpm =       [0,  1000,2000,3000,4000,5000,6000,7000,8000,9000,10000,11000, 12000]; % rpm - Motor Speed for Max Torque curve
motorData.maxtorque = [280, 280, 280, 220, 160, 110,  95,  75,  60,  55,   50,   40,     0;  % N-m - Max Motor Torque for Max Torque curve
             280, 280, 275, 255, 240, 180, 140, 125,  95,  75,   70,   50,     0;
             280, 280, 275, 260, 250, 220, 180, 150, 125, 100,   80,   70,     0;
             280, 280, 275, 260, 250, 230, 200, 175, 140, 120,  100,   75,     0];
motorData.vbus = [350, 500, 600, 700]; % V - Motor Voltage 

motorData.eta_torque = [0:25:325];      % N-m - Motor Torque for Efficiency Contour
motorData.eta_speed = [0:500:10000];    % rpm - Motor Speed for Efficiency Contour
motorData.eta_speed(1) = 10;
motorData.eta_val = [0.740000000000000,0.740000000000000,0.740000000000000,0.740000000000000,0.740000000000000,0.740000000000000,0.740000000000000,0.740000000000000,0.740000000000000,0.740000000000000,0.740000000000000,0.740000000000000,0.740000000000000,0.740000000000000,0.740000000000000,0.740000000000000,0.740000000000000,0.740000000000000,0.740000000000000,0.740000000000000,0.740000000000000;
    0.860000000000000,0.940000000000000,0.96000000000000,0.940000000000000,0.940000000000000,0.940000000000000,0.920000000000000,0.920000000000000,0.900000000000000,0.900000000000000,0.880000000000000,0.860000000000000,0.860000000000000,0.860000000000000,0.860000000000000,0.840000000000000,0.820000000000000,0.800000000000000,0.780000000000000,0.760000000000000,0.740000000000000;
    0.840000000000000,0.940000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.960000000000000,0.940000000000000,0.940000000000000,0.940000000000000,0.940000000000000,0.920000000000000,0.920000000000000,0.920000000000000,0.920000000000000,0.920000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.880000000000000,0.880000000000000;
    0.840000000000000,0.920000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.940000000000000,0.940000000000000,0.940000000000000,0.940000000000000,0.940000000000000,0.940000000000000,0.920000000000000,0.920000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.880000000000000;
    0.820000000000000,0.900000000000000,0.940000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.940000000000000,0.940000000000000,0.940000000000000,0.920000000000000,0.900000000000000,0.900000000000000,0.880000000000000,0.880000000000000,0.880000000000000;
    0.820000000000000,0.880000000000000,0.940000000000000,0.940000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.940000000000000,0.940000000000000,0.920000000000000,0.920000000000000,0.900000000000000,0.900000000000000,0.880000000000000,0.860000000000000,0.860000000000000;
    0.800000000000000,0.880000000000000,0.920000000000000,0.940000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.940000000000000,0.940000000000000,0.920000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000;
    0.800000000000000,0.860000000000000,0.900000000000000,0.940000000000000,0.940000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.940000000000000,0.920000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000;
    0.780000000000000,0.860000000000000,0.900000000000000,0.920000000000000,0.940000000000000,0.940000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.96000000000000,0.940000000000000,0.920000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000;
    0.780000000000000,0.860000000000000,0.900000000000000,0.920000000000000,0.920000000000000,0.940000000000000,0.940000000000000,0.940000000000000,0.96000000000000,0.940000000000000,0.940000000000000,0.920000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000;
    0.760000000000000,0.860000000000000,0.880000000000000,0.900000000000000,0.920000000000000,0.940000000000000,0.940000000000000,0.940000000000000,0.940000000000000,0.940000000000000,0.920000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000;
    0.740000000000000,0.840000000000000,0.860000000000000,0.900000000000000,0.920000000000000,0.920000000000000,0.940000000000000,0.940000000000000,0.940000000000000,0.940000000000000,0.920000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.9000000000000000;
    .740000000000000,0.840000000000000,0.860000000000000,0.880000000000000,0.900000000000000,0.920000000000000,0.920000000000000,0.940000000000000,0.920000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000;
    0.720000000000000,0.820000000000000,0.860000000000000,0.880000000000000,0.900000000000000,0.900000000000000,0.920000000000000,0.920000000000000,0.920000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000];

% figure;
% [C,h] = contour(motorData.eta_speed, motorData.eta_torque, motorData.eta_val);
% clabel(C,h);
% h.LineColor='k';
% xlabel('Speed (rpm)');
% ylabel('Torque (Nm)');
% title('Motor Efficiency (%) Contour Maps');
% grid
% hold on
% plot(motorData.rpm,motorData.maxtorque,'--')

%% Battery Data
batData.SOC = [0, 0.01, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];            % State of Charge
batData.OCV = [0, 3.1, 3.55, 3.68, 3.74, 3.76, 3.78, 3.85, 3.9, 3.95, 4.08, 4.15];  % OCV per cell
batData.Rint=0.1695;    % Internal Resistance per cell
batData.C = 150;        % Amp-hr - Total battery capacity (default 150)
batData.numSeries = 96; % Number of Cells in Series
batData.numParallel = 74; % Number of Cells in Parallel
batData.initSOC = 0.8; % initialize SOC

% figure;
% plot(batData.SOC,batData.OCV)
% xlabel('Cell State of Charge ')
% ylabel('Cell Open Circuit Volage (OCV) - Volts')
% title('Lithium Ion Cell Characteristic - Project 3')
% grid

%% Conversions
mph2mps = 1600/3600;
rps2rpm = 60/(2*pi());

% Path/track structure used in racestat functions
path.radius = 200;
path.width = 15;
path.l_st = 900;
