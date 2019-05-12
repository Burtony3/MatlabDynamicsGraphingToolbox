function mdpPhasePlot(ode45PosOutput,ode45TimeOutput,index,figNum)
% mdpPhasePlot Outputs phase diagram from ode45 results
%    Variations:
%		mdpPhasePlot(ode45PosOutput,ode45TimeOutput,index)
%    
%    Required Inputs:
%       ode45PosOutput = Full output position/velocity vector from ode45
%
%       ode45TimeOutput = Time vector ouputed from ode45
%
%       index = Current index in position/time ode45 arrays to measure
%
%    Examples:
%       mdpPhasePlot(x,t,10)
%
%    See also mdpSetup, mdpSave, ode45.

%% Collected Inputs
    x = ode45PosOutput;
    t = ode45TimeOutput;
    DoF = size(x,2);
    
%% Setting Axis Limits
    horz = x(:,1:2:DoF);
    vert = x(:,2:2:DoF);
    xLim = [-max(horz(horz>0)) max(horz(horz>0))];
    yLim = [-max(vert(vert>0)) max(vert(vert>0))];
    
%% Plotting
        axis equal
        plot(horz(1:index,:),vert(1:index,:),'LineWidth',1)
        hold on
        plot(horz(index,:),vert(index,:),'ok','LineWidth',1.25)
        grid on
        xlim(xLim)
        ylim(yLim)
end