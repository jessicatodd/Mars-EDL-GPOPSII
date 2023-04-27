% MarsEDLPowered_Endpoint.m %

function output = MarsEDLPowered2_Endpoint(input)
% Output
% Maximising landing mass
mf = input.phase.finalstate(5);
output.objective = -mf;