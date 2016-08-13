function [retVector] = lab2_localExtreme(inVector, f, a, b, numberOfIntervals, precision)
    %Add a and b to have the complete intervalls
    m = 5;
    inVector = [a, inVector];
    inVector = [inVector, b];
    yValues = [];
    %loop over intervals
    for i=2:length(inVector)
        dfValues = [];
        xValues = [];
        I = [inVector(i-1)];
        I = [I, inVector(i)];
        
        %split intervall
        h = (I(2)-I(1)) / (m+1);
        next = I(1) + h;
        %calculate df
        while (next < I(2))
           temp = (-f(next+2*h) + 8*f(next+h) - 8*f(next-h) + f(next+2*h)) / (12*h)
           dfValues = [dfValues, temp];
           xValues = [xValues, next];
           next = next + h;
        end
        Vx = vander(xValues);
        grid on
        hold on
        coefficents = double(Vx \ dfValues');
        derivativeF = @(x) polyval(coefficents, x);
        x = linspace(I(1), I(2));
        plot(x, [derivativeF(x); f(x)])
        
        solution = lab2_solutions(derivativeF, I(1), I(2), numberOfIntervals, precision);
        if ((isempty(solution) && i == 2) && abs(f(I(1))) > abs(f(I(2))))
            solution = I(1);
        elseif (isempty(solution))
            solution = I(2);
        end
        yValues = [yValues, f(solution)];
    end
    retVector = yValues
end

