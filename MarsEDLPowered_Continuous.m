% MarsEDLPowered_Continuous.m %
function phaseout = MarsEDLPowered_Continuous(input)
% save



%% PHASE 1 - Freefall
ip = 1;
% ---------------------------------------------------%
% ------------- Components of the State ------------ %
% ---------------------------------------------------%

h       = input.phase(ip).state(:,1);
v       = input.phase(ip).state(:,2);
fpa     = input.phase(ip).state(:,3);
s       = input.phase(ip).state(:,4);
% m       = input.phase(ip).state(:,5);

cbank    = input.phase(ip).control(:,1);

% ---------------------------------------------------%
% ---------- Compute relevant quantities ----------- %
% ---------------------------------------------------%

% Mars Parameters
rho0        = input.auxdata.rho0;
H           = input.auxdata.H;
mu          = input.auxdata.mu;
g0          = input.auxdata.g0;
Re          = input.auxdata.Re;
k           = input.auxdata.k;

% Entry Vehicle Parameters
beta        = input.auxdata.beta;
LD          = input.auxdata.LD;
rn          = input.auxdata.rn;

% Constants
r = h + Re;                         % Radius (m)
rho = rho0.*exp(-h./H);             % Atmospheric Density (kg/m^3)
g = mu./r.^2;                       % Gravitational acceleration (m/s^2)

% ---------------------------------------------------%
% ------------- Dynamics --------------------------- %
% ---------------------------------------------------%
hdot = v.*sin(fpa);
vdot   = -(rho.*v.^2)/(2*beta)-g.*sin(fpa);
fpadot = (v.*cos(fpa))./r - (g.*cos(fpa))./v + ((rho.*v)/(2*beta)).* (LD*cbank);
sdot = v.*sin(fpa);

phaseout(ip).dynamics = [hdot, vdot, fpadot, sdot];

% Path constraints
gE = 9.807;
n = sqrt(LD.^2+1).*0.5.*rho.*v.^2./(beta.*gE);

q = k.*sqrt(rho./rn).*v.^3;

phaseout(ip).path = [n, q];
        
%% PHASE 2 - Powered Descent

ip = 2;

% ---------------------------------------------------%
% ------------- Components of the State ------------ %
% ---------------------------------------------------%

h       = input.phase(ip).state(:,1);
v       = input.phase(ip).state(:,2);
fpa     = input.phase(ip).state(:,3);
s       = input.phase(ip).state(:,4);
m       = input.phase(ip).state(:,5);

u       = input.phase(ip).control(:,1);
 
% ---------------------------------------------------%
% ---------- Compute relevant quantities ----------- %
% ---------------------------------------------------%

% Mars Parameters
rho0        = input.auxdata.rho0;
H           = input.auxdata.H;
mu          = input.auxdata.mu;
g0          = input.auxdata.g0;
Re          = input.auxdata.Re;
k           = input.auxdata.k;

% Entry Vehicle Parameters
beta        = input.auxdata.beta;
LD          = input.auxdata.LD;
rn          = input.auxdata.rn;
T           = input.auxdata.T;
isp         = input.auxdata.isp;

% Constants
r           = h + Re;                         % Radius (m)
rho         = rho0.*exp(-h./H);             % Atmospheric Density (kg/m^3)
g           = mu./r.^2;                       % Gravitational acceleration (m/s^2)
gE          = 9.807;
cbank = 1;

% ---------------------------------------------------%
% ------------- Dynamics --------------------------- %
% ---------------------------------------------------%
hdot        = v.*sin(fpa);
vdot        = -(rho.*v.^2)/(2*beta)-g.*sin(fpa) - T.*u./m;
fpadot      = (v.*cos(fpa))./r - (g.*cos(fpa))./v + ((rho.*v)/(2*beta)).* (LD*cbank);
sdot        = v.*sin(fpa);
mdot        = -T.*u./(gE.*isp);                         % Mass

phaseout(ip).dynamics = [hdot, vdot, fpadot, sdot, mdot];

phaseout(ip).integrand = 0.1*u;


% Path constraints

n = sqrt(LD.^2+1).*0.5.*rho.*v.^2./(beta.*gE) + T.*u./(m.*gE);

q = k.*sqrt(rho./rn).*v.^3;

phaseout(ip).path = [n, q];








