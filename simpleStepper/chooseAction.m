% written by Professor Jay McClelland
function [] = chooseAction()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

global w a p;
prob = softmax(a.q(w.curs+p.range+1,:), p.qscale)
w.cura = sample(prob);
end

% softmax transformation
% expects the input x to be a vector a Q-values
function [distribution] = softmax(x, scale)
distribution = (x.^scale) / sum(x.^scale);
end

% choose action based on the probability distribution
function [c] = sample(pr)
rv = rand(1);
cp = cumsum(pr);
for i = 1:length(pr)
    if rv < cp(i)
        c = i;
        return;
    end
end
end

