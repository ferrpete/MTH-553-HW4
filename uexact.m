function ue = uexact(x,t,a,type)

if type == "a"
    
    x = x + a*t;
    ue = exp(-100*((x - a*t) - 0.3).^2);
    idx = x <= 1;
    ue = [ue(~idx); ue(idx)];
    
else
    
    idx = x < a*t;
    ue(idx) = 1;
    ue(~idx) = 0;
    
end

end