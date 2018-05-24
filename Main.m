% Main.m

% Upwind

dx = [0.1, 0.01, 0.001, 0.0001];
dt = [0.1, 0.01, 0.001, 0.0001];
a = 1;

uh = cell(length(dx),1);
ue = cell(length(dx),1);

for j=1:2
    
    for i=1:length(dx)
        
        [uh{i}, ue{i}] = Upwind(dx(i),dt(i)/j,a,"a");

    end
    
    Error(uh,ue,dx,"a");
    
end

for j=1:2
    
    for i=1:length(dx)
        
        [uh{i}, ue{i}] = Upwind(dx(i),dt(i)/j,a,"b");

    end
    
    Error(uh,ue,dx,"b");
    
end

for j=1:2
    
    for i=1:length(dx)

        [uh{i}, ue{i}] = LaxFriedrichs(dx(i),dt(i)/j,a,"a");

    end
    
    Error(uh,ue,dx,"a");
    
end

for j=1:2
    
    for i=1:length(dx)
        
        [uh{i}, ue{i}] = LaxFriedrichs(dx(i),dt(i)/j,a,"b");

    end
    
    Error(uh,ue,dx,"b");
    
end

for j=1:2
    
    for i=1:length(dx)

        [uh{i}, ue{i}] = LaxWendroff(dx(i),dt(i)/j,a,"a");

    end
    
    Error(uh,ue,dx,"a");
    
end

for j=1:2
    
    for i=1:length(dx)
        
        [uh{i}, ue{i}] = LaxWendroff(dx(i),dt(i)/j,a,"b");

    end
    
    Error(uh,ue,dx,"b");
    
end