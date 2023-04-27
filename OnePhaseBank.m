% MarsEDL_Main.m %

% Description of problem %

close all
clear
clc

% Auxiliary Data 
auxdata.rho0 = 0.02;        % Mars atmospheric density at surface (kg/m^3)
auxdata.h0 = 0;             % Mars reference altitude (m)
auxdata.g0 = 3.71;          % Grav acceleration at surface (m/s^2)
auxdata.Re = 3397*1000;     % Planetary radius (m)
auxdata.H = 11.1*1000;      % Scale height of martian atmosphere m);
auxdata.mu = 4.282837e13;   % Mars gravitational constant (m^3/s^2);
auxdata.k = 1.9027e-4;      % Heat rate for Mars
auxdata.Mach1 = 240;        % Speed of sound in Martian atmosphere

% Orion
% auxdata.S = 19.6;       % Spacecraft reference area (m^2)
% auxdata.mass = 10400; % Spacecraft mass (kg)
% auxdata.beta = 300;   % Spacecraft ballistic coefficient (kg/m^2)
% auxdata.LD = 0.15;    % Lift to drag ratio
% auxdata.rn = 6.1;    % Effective nose radius

% Superheavy Orion
auxdata.S = 29.2;       % Spacecraft reference area (m^2)
auxdata.mass = 40000; % Spacecraft mass (kg)
auxdata.beta = 460;   % Spacecraft ballistic coefficient (kg/m^2)
auxdata.LD = 0.5;    % Lift to drag ratio
auxdata.rn = 6.1;    % Effective nose radius

% % MSL
% auxdata.S = 15.9;       % Spacecraft reference area (m^2)
% auxdata.mass = 2800; % Spacecraft mass (kg)
% auxdata.beta = 115;   % Spacecraft ballistic coefficient (kg/m^2)
% auxdata.LD = 0.24;    % Lift to drag ratio
% auxdata.rn = 4.5;    % Effective nose radius

% Boundary constraints
t0 = 0;                         %tf free
h0 = 125000;                    %rf free
%v0 = 5850; vf = 854; % Direct entry Mach 3 for Mars %854; Terminal velocity for inflatable deployment
v0 = 3360; vf = 854; % Aerocapture entry300
fpa0 = -15*pi/180; 
s0 = 0;

% Variable constraints
tfMin = 100;                tfMax = 5000;
hMin = 10000;                hMax = 125000;
vMin = 450;                 vMax = 7500;
fpaMin = -25*pi/180;        fpaMax = 25*pi/180;
smin = -500000;         %[m] 
smax = 935000;          %[m]

bankMin = -1;               bankMax = 1;


nMin = 0; nMax = 4.5;
qMin = 0; qMax = 100*10000;

% Phase 1
ip = 1;
bounds.phase(ip).initialtime.lower = t0;
bounds.phase(ip).initialtime.upper = t0;
bounds.phase(ip).finaltime.lower = tfMin;
bounds.phase(ip).finaltime.upper = tfMax;
bounds.phase(ip).initialstate.lower = [h0, v0, fpaMin, s0];
bounds.phase(ip).initialstate.upper = [h0, v0, fpaMax, s0];
bounds.phase(ip).state.lower = [hMin, vMin, fpaMin, smin];
bounds.phase(ip).state.upper = [hMax, vMax, fpaMax, smax];
bounds.phase(ip).finalstate.lower = [hMin, vf, fpaMin, smin];
bounds.phase(ip).finalstate.upper = [hMax, vf, fpaMax, smax];
bounds.phase(ip).control.lower = bankMin;
bounds.phase(ip).control.upper = bankMax;


bounds.phase(ip).integral.lower = [0];
bounds.phase(ip).integral.upper = [1000];

bounds.phase(ip).path.lower = [nMin, qMin];
bounds.phase(ip).path.upper = [nMax, qMax];

% bounds.phase.control.lower = [aoaMin, cbankMin, sbankMin];
% bounds.phase.control.upper = [aoaMax, cbankMax, sbankMax];


%-------------------------------------------------------------------------%
%---------------------- Provide Guess of Solution ------------------------%
%-------------------------------------------------------------------------%
tGuess              = [0; 300];
hGuess              = [h0; hMin];
vGuess              = [v0; vf];
fpaGuess            = [fpa0; fpaMax];
sGuess              = [s0; 5000];

bankGuess           = [-1; 1];

guess.phase.state   = [hGuess, vGuess, fpaGuess, sGuess];
guess.phase.control = bankGuess;
guess.phase.time    = tGuess;
guess.phase.integral = [0];

%-------------------------------------------------------------------------%
%----------Provide Mesh Refinement Method and Initial Mesh ---------------%
%-------------------------------------------------------------------------%
% mesh.method       = 'hp-LiuRao-Legendre';
mesh.maxiterations = 10;
mesh.colpointsmin = 4;
% mesh.colpointsmax = 20;
mesh.tolerance    = 1e-5;
%setup.nlp.ipoptoptions.tolerance = 1e-20;

%-------------------------------------------------------------------%
%---------- Configure Setup Using the information provided ---------%
%-------------------------------------------------------------------%
setup.name                           = 'Mars-EDL';
setup.functions.continuous           = @MarsEDL_Continuous;
setup.functions.endpoint             = @MarsEDL_Endpoint;
setup.auxdata                        = auxdata;
setup.bounds                         = bounds;
setup.guess                          = guess;
setup.mesh                           = mesh;
% setup.displaylevel                   = 2;
setup.nlp.solver                     = 'ipopt';
% setup.nlp.ipoptoptions.linear_solver = 'mumps';
% setup.derivatives.supplier           = 'adigator';
setup.derivatives.supplier           = 'sparseCD';
setup.derivatives.derivativelevel    = 'second';
setup.scales.method                  = 'automatic-bounds';
% setup.method                         = 'RPM-Differentiation';


%-------------------------------------------------------------------%
%------------------- Solve Problem Using GPOPS2 --------------------%
%-------------------------------------------------------------------%
output = gpops2(setup);
MarsEDL_Plot;
