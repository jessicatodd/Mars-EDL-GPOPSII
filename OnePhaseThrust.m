% MarsEDLPowered_Main.m %

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

% Orion
auxdata.S = 19.6;       % Spacecraft reference area (m^2)
auxdata.mass = 10400; % Spacecraft mass (kg)
auxdata.beta = 300;   % Spacecraft ballistic coefficient (kg/m^2)
auxdata.LD = 0.15;    % Lift to drag ratio
auxdata.rn = 6.1;    % Effective nose radius

% Superheavy Orion
% auxdata.S = 29.2;       % Spacecraft reference area (m^2)
% auxdata.mass = 40000; % Spacecraft mass (kg)
% auxdata.beta = 460;   % Spacecraft ballistic coefficient (kg/m^2)
% auxdata.LD = 0.25;    % Lift to drag ratio
% auxdata.rn = 6.1;    % Effective nose radius

% SpaceX
auxdata.T = 568000;         % Maximum thrust (N)
auxdata.isp = 240;          % ISP

% LOX-Methane
% auxdata.T = 600000;         % Maximum thrust (N)
% auxdata.isp = 360;          % ISP


% PHASE 2 - Powered Descent
% Boundary constraints
h0 = 11.08e3;     hf = 0;  % Landed on surface         
v0 = 854;           vf = 1;  % Landing velocity is 0 m/s
fpa0 = -10.44*pi/180;
t0 = 0;

% Variable constraints
tfMin = 10;                tfMax = 5000;
hMin = 0;                   hMax = 125000;
vMin = 0;                   vMax = 7500;
fpaMin = -90*pi/180;        fpaMax = 90*pi/180;
smin = -500000;             smax = 935000;          %[m]
mMin = 0;                   mMax = auxdata.mass;

% Control (throttle 0-100%)
uMin = 0;               uMax = 1;

% Path constraints
nMin = 0; nMax = 4.5;
qMin = 0; qMax = 80*10000;

% Phase 2

ip = 1;
bounds.phase(ip).initialtime.lower = t0;
bounds.phase(ip).initialtime.upper = t0;
bounds.phase(ip).finaltime.lower = tfMin;
bounds.phase(ip).finaltime.upper = tfMax;
bounds.phase(ip).initialstate.lower = [h0, v0, fpa0, smin, mMax];
bounds.phase(ip).initialstate.upper = [h0, v0, fpa0, smax, mMax];
bounds.phase(ip).state.lower = [hMin, vMin, fpaMin, smin, mMin];
bounds.phase(ip).state.upper = [hMax, vMax, fpaMax, smax, mMax];
bounds.phase(ip).finalstate.lower = [hf, vf, fpaMin, smin, mMin];
bounds.phase(ip).finalstate.upper = [hf, vf, fpaMax, smax, mMax];
bounds.phase(ip).control.lower = uMin;
bounds.phase(ip).control.upper = uMax;

bounds.phase.integral.lower = 0;
bounds.phase.integral.upper = 1000;

bounds.phase(ip).path.lower = [nMin, qMin];
bounds.phase(ip).path.upper = [nMax, qMax];

% bounds.phase.control.lower = [aoaMin, cbankMin, sbankMin];
% bounds.phase.control.upper = [aoaMax, cbankMax, sbankMax];


%-------------------------------------------------------------------------%
%---------------------- Provide Guess of Solution ------------------------%
%-------------------------------------------------------------------------%
tGuess              = [t0; t0+300];
hGuess              = [h0; hf];
vGuess              = [v0; vf];
fpaGuess            = [fpa0; fpaMax];
sGuess              = [0; 5000];
mGuess              = [mMax; 0.2*mMax];

uGuess              = [1; 1];

guess.phase(ip).state   = [hGuess, vGuess, fpaGuess, sGuess, mGuess];
guess.phase(ip).control = uGuess;
guess.phase(ip).time    = tGuess;
guess.phase(ip).integral = 0;


%-------------------------------------------------------------------------%
%----------Provide Mesh Refinement Method and Initial Mesh ---------------%
%-------------------------------------------------------------------------%
% mesh.method       = 'hp-LiuRao-Legendre';
mesh.maxiterations = 10;
mesh.colpointsmin = 4;
% mesh.colpointsmax = 20;
mesh.tolerance    = 1e-3;
%setup.nlp.ipoptoptions.tolerance = 1e-20;

%-------------------------------------------------------------------%
%---------- Configure Setup Using the information provided ---------%
%-------------------------------------------------------------------%
setup.name                           = 'Mars-EDL';
setup.functions.continuous           = @MarsEDLPowered2_Continuous;
setup.functions.endpoint             = @MarsEDLPowered2_Endpoint;
setup.auxdata                        = auxdata;
setup.bounds                         = bounds;
setup.guess                          = guess;
setup.mesh                           = mesh;
% setup.displaylevel                   = 2;
setup.nlp.solver                     = 'ipopt';
setup.nlp.ipoptoptions.linear_solver = 'mumps';
% setup.derivatives.supplier           = 'adigator';
setup.derivatives.supplier           = 'sparseCD';
setup.derivatives.derivativelevel    = 'second';
setup.scales.method                  = 'automatic-bounds';
setup.method                         = 'RPM-Differentiation';


%-------------------------------------------------------------------%
%------------------- Solve Problem Using GPOPS2 --------------------%
%-------------------------------------------------------------------%
output = gpops2(setup);
MarsEDLPowered2_Plot;
