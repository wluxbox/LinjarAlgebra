%%
x = randn(4,1);
y = randn(4,1);

scatter(x,y,30,'filled')
hold on
constants = interpolant(x,y);
dim = size(x,1);
f = @(t) (t.^[0:(dim-1)])*constants; %do this for each element in linspace NOT on the whole vector

plot(linspace(-3,3),arrayfun(f,linspace(-3,3)))

function [alphas] = interpolant(x,y)
dimension = size(x,1);
M = zeros(dimension,dimension);
for xElem = 1:dimension
    for a = 1:dimension
        M(xElem,a) = x(xElem).^(a-1);
    end
end
alphas = M\y;
end