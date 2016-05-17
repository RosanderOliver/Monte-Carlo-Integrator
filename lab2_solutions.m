function [retVector] = lab2_solutions(f, a, b)
format long
    h = (b-a) / 17;
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
                while xB-xA > (eps+20*10^-16)
                    m = (xA+xB)/2;
                    if f(xA)*f(m) < 0
                        xB = m;
                    elseif f(xB)*f(m) < 0
                        xA = m;
                    elseif f(xA)*f(m) <= eps || f(xB)*f(m) <= eps
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