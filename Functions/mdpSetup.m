function mdpSetup(N,xLIM,yLIM,windowHeight,i)
% mdpSetup Creates figure window to be ready for plots
%    Variations:
%		mdpSetup(N,plotSpace,windowHeight,
%
%    Required Inputs:
%       N = Figure Number
%
%       xLIM/yLIM = Same use case as in commands xlim or ylim
%
%       windowHeight = Height of figure window in pixels
%
%       i = index (Used to prevent flashing cuased by movegui())
%
%    Examples:
%       mdpSetup(3,[0 1],[0 2],1080,i)
%
%    See also mdpSave, mdpLine, mdpSpring.

%% TODO
%   Change Case to Allow for Subplots
%   Add Case for larger bounds ie: plotSetup(N,Name,[0 10])
%%
    %Computations
        figAR = diff(xLIM)/diff(yLIM);

    fig(N) = figure(N);
    clf(fig(N))
    xlim(xLIM)
    ylim(yLIM)
    axis off equal
    if i == 1
        figPos = get(fig(N),'Position');
        set(fig(N),'Position',[figPos(1:2) figAR*windowHeight windowHeight])
        movegui(fig(N),'center')
        pause(0.05)
    end
    hold on
    