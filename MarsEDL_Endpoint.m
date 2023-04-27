% MarsEDL_Endpoint.m %

function output = MarsEDL_Endpoint(input)

% Output
% Maximising entry state termination
hf = input.phase.finalstate(1);
output.objective = -hf + input.phase.integral;