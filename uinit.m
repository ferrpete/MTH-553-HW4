function ui = uinit(x,type)

if type == "a"
    
    ui = exp(-100*(x - 0.3).^2);
    
else
    
    idx = x < 0;
    ui(idx) = 1;
    ui(~idx) = 0;
    
end

end