function mdpSetup(N,Name)
% mdpSetup Creates figure window to be ready for plots
%    Variations:
%		mdpSetup
%       mdpSetup(N)
%       mdpSetup(N,Name)
%
%    Optional Inputs
%       N = Figure Number
%
%       Name = String containing name of figure window
%
%    Examples:
%       mdpSetup(3,'foo')
%
%    See also mdpSave, mdpLine, mdpSpring.

%% TODO
%   Change Case to Allow for Subplots
%   Add Case for larger bounds ie: plotSetup(N,Name,[0 10])

%% Cases
    switch nargin
        case 2
            fig(N) = figure(N);
            clf(fig(N))
            fig(N).Name = Name;
            fig(N).NumberTitle = 'off';
            xlim([0 1])
            ylim([0 1])
            axis off equal
            hold on
            
        case 1
            fig(N) = figure(N);
            clf(fig(N))
            xlim([0 1])
            ylim([0 1])
            axis off equal
            hold on
            
        case 0
            figure(gcf)
            clf(gcf)
            xlim([0 1])
            ylim([0 1])
            axis off equal
            hold on
    end
        