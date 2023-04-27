% MarsEDL_Continuous.m %
function phaseout = MarsEDL_Continuous(input)

% ---------------------------------------------------%
% ------------- Components of the State ------------ %
% ---------------------------------------------------%

h       = input.phase.state(:,1);
v       = input.phase.state(:,2);
fpa     = input.phase.state(:,3);
s       = input.phase.state(:,4);

cbank    = input.phase.control(:,1);

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

phaseout.dynamics = [hdot, vdot, fpadot, sdot];




% Path constraints
gE = 9.807;
n = sqrt(LD.^2+1).*0.5.*rho.*v.^2./(beta.*gE);

q = k.*sqrt(rho./rn).*v.^3;

phaseout.integrand = [0.1.*cbank.^2];

phaseout.path = [n, q];

        
%dgammadt    = (1./(m.*v)).*L.*csigma - ...          % Flight path angle
%    (g./v).*cgamma + (v./r).*cgamma;


%dsdt        = v.*cgamma;                            % Downrange
%dpsidt      = 1./(m.*v).*L.*ssigma./cgamma - ...    % Heading angle
%    (v./r).*cgamma.*cpsi.*tphi;
%dthetadt    = (v.*cgamma.*cpsi)./(r.*cphi);         % Longitude
%dphidt      = (v.*cgamma.*spsi)./r;                 % Latitude
%dmdt        = -T./(g.*isp);                        % Mass



% Path Constraints
%dqdt = k*sqrt(pho./rn).*v.^3;                       % Heat rate                       
%n = sqrt(L^2 + D^2)./(m.*g0);                     % Loading (g's)

%phaseout(ip).path = n;



% % PHASE 2: Powered Descent
% ip = 2;
% 
% % States
% r       = input.phase(ip).state(:,1);       % Radius (km) (from Mars center)
% s       = input.phase(ip).state(:,2);       % Downrange (km)
% v       = input.phase(ip).state(:,3);       % Velocity (km/s)
% gamma   = input.phase(ip).state(:,4);       % Flight path angle (rad)
% psi     = input.phase(ip).state(:,5);       % Heading angle (rad)
% theta   = input.phase(ip).state(:,6);       % Latitude (rad)
% phi     = input.phase(ip).state(:,7);       % Longitude (rad)
% m       = input.phase(ip).state(:,8);       % Vehicle mass (kg)
% 
% % Control Input
% sigma = input.phase(ip).control(:,1);       % Bank angle control (rad)
% %alpha = input.phase(ip).control(:,2);       % Angle of Attack control (rad)
% T = input.phase(ip).control(:,3);          % Thrust magnitude (N)
% 
% % Dynamics
% sgamma      = sin(gamma);    
% cgamma      = cos(gamma);
% ssigma      = sin(sigma);
% csigma      = cos(sigma);
% spsi        = sin(psi);
% cpsi        = cos(psi);
% sphi        = sin(phi);
% cphi        = cos(phi);
% tphi        = tan(phi);
% 
% drdt        = v.*sgamma;                            % Altitude 
% dsdt        = v.*cgamma;                            % Downrange
% dvdt        = -(1./m).*T - g.*sgamma;               % Velocity
% dgammadt    = (g./v).*cgamma + (v./r).*cgamma;      % Flight path angle
% dpsidt      = (v./r).*cgamma.*cpsi.*tphi;           % Heading angle
% dthetadt    = (v.*cgamma.*cpsi)./(r.*cphi);         % Longitude
% dphidt      = (v.*cgamma.*spsi)./r;                 % Latitude
% dmdt        = -T./(g.*isp);                         % Mass
% 
% phaseout(ip).dynamics = [drdt, dsdt, dvdt, dgammadt, dpsidt, dthetadt, ...
%                             dphidt];
% 
% % Path Constraints
% dqdt = k*sqrt(pho./rn).*v.^3;                       % Heat rate                       
% n = sqrt(L^2 + D^2)./(m.*g0);                     % Loading (g's)
% 
% phaseout(ip).path = [dqdt, n];





