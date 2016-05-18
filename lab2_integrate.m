function [retValue] = lab2_integrate(f, a, b, c)
    negative = 0;
    less = 0;
    numberOfDots = 1000;
    xRandVector = (b-a).*rand(numberOfDots,1) + a;
    yRandVector = c.*rand(numberOfDots,1);
    
    
    if c < 0
        negative = 1;
    end
    for i=1:numberOfDots
        if negative == 0 && f(xRandVector(i)) >= yRandVector(i)
            less = less + 1;
        elseif negative == 1 && f(xRandVector(i)) <= yRandVector(i)
            less = less + 1;
        end
    end
    area = (b-a)*c*less / numberOfDots;
    retValue = double(area);
end

