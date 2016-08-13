function [retVector] = lab2_solutions(f, a, b, numberOfIntervals, precision)
format long
    h = (b-a) / numberOfIntervals;
    subIntervalA = a;
    subIntervalB = a + h;
    retVector = [];
    
    while(subIntervalB <= b)
        yA = f(subIntervalA);
        yB = f(subIntervalB);

        res = yB * yA;
        if(res < 0)
            xA = subIntervalA;
            xB = subIntervalB;
            if xB-xA > eps
                while xB-xA > precision
                    m = (xA+xB)/2;
                    if f(xA)*f(m) < 0
                        xB = m;
                    elseif f(xB)*f(m) < 0
                        xA = m;
                    elseif f(xA)*f(m) <= 0 || f(xB)*f(m) <= 0
                        xA = m;
                        xB = m;
                    end
                end
                retVector = [retVector, m];
            end
        end
        subIntervalA = subIntervalB;
        subIntervalB = subIntervalB + h;
    end    
    retVector = unique(retVector);
end
