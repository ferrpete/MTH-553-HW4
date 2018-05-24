function Error(uh, ue, dx, type)

if type == "a"
    
    E2 = zeros(length(dx),1);
    EInf = zeros(length(dx),1);
    
    for i = 1:length(dx)
        
        E2(i) = sqrt(dx(i))*norm(uh{i}-ue{i},2);
        EInf(i) = norm(uh{i}-ue{i},inf);
        
    end
    
    figure
    loglog(dx,dx,'k-',dx,EInf,'r--',dx,E2,'b-.')
    xlabel('Mesh Size, h')
    ylabel('Error')
    legend('Linear','Infinity Norm','2-Norm')
    legend('location','southeast')
    
else
    
    E2 = zeros(length(dx),1);
    E1 = zeros(length(dx),1);
    
    for i = 1:length(dx)
        
        E2(i) = sqrt(dx(i))*norm(uh{i}-ue{i},2);
        E1(i) = dx(i)*norm(uh{i}-ue{i},1);
        
    end
    
    figure
    loglog(dx,dx,'k-',dx,E1,'r--',dx,E2,'b-.')
    xlabel('Mesh Size, h')
    ylabel('Error')
    legend('Linear','1-Norm','2-Norm')
    legend('location','southeast')
    
end

end