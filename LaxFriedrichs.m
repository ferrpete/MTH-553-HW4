function [unew, ue] = LaxFriedrichs(dx, dt, a, type)

nu = (a*dt)/dx;

%% set up initial data
t = [0:dt:0.5]';
if type == "a"
    x=(0:dx:1)';
else
    x=(-0.5:dx:1)';
end

uprev = uinit(x, type); unew = 0*uprev;
%%
% plot(x,uprev);title(sprintf('Initial condition at t=%g',t));pause(0.01);
for i = 2:length(t)
    unew(2:end-1) = 0.5*(uprev(3:end)+uprev(1:end-2)) - 0.5*nu*(uprev(3:end)-uprev(1:end-2));
    unew(end) = uprev(end) - nu*(uprev(end)-uprev(end-1));
    if type == "a"
        unew(1) = uprev(end);
    else
        unew(1) = 1;
    end
    %% plot, compare with true solution ...?
%     plot(x,unew);
%     title(sprintf('Numerical solution at t=%g',t));
%     axis([-inf,inf,-0.1,1.2]);
%     pause(0.01);
    %% calculate error
    uprev = unew;
end

ue = uexact(x,t(end),a,type);

end