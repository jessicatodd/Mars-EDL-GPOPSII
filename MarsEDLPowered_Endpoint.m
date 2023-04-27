% MarsEDLPowered_Endpoint.m %
function output = MarsEDLPowered_Endpoint(input)

% Phase Data
% t0phase1 = input.phase(1).initialtime;
tfphase1 = input.phase(1).finaltime;
% x0phase1 = input.phase(1).initialstate;
xfphase1 = input.phase(1).finalstate;

t0phase2 = input.phase(2).initialtime;
% tfphase2 = input.phase(2).finaltime;
% x0phase1 = input.phase(2).initialstate; % You had x0phase1 should be xfphase1
x0phase2 = input.phase(2).initialstate;
% xfphase1 = input.phase(2).finalstate;

output.eventgroup(1).event = [x0phase2(1:4) - xfphase1, t0phase2 - tfphase1];

% Output
% Maximising landing mass
mf = input.phase(2).finalstate(5);
output.objective = -mf;
