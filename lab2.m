%bestäm optimalt h-värde på uppdelningen av a->b
import lab2_functions.*
close all
hold on

syms x
%f(x) = 0.5*x*cos(2*x); a = 0; b = 6;
%f(x) = 0.9*x^3-4*x+1; a = -3; b = 3;
%f(x) = -x; a = -5; b = 5;
f(x) = x^2-1; a = -2; b = 2;

integral = 0;
x = linspace(a,b);


zero = [];
zero = lab2_solutions(f, a, b);


extreme = lab2_localExtreme(zero, f, a, b);
zero = [a, zero, b];

for i = 2:length(zero)
   tic
   start = zero(i-1);
   stop = zero(i);
   extremeValue = extreme(i-1);
   integral = integral + lab2_integrate(f, start, stop, extremeValue);
   toc
end
    
integral

%http://se.mathworks.com/matlabcentral/answers/127169-how-can-i-get-the-degree-of-a-polynomial-defined-symbolically-in-matlab
%feval(symengine, 'degree', f)

%hold on
%grid on


%hitta nollpunkter automatiskt
