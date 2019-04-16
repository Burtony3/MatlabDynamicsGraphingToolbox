function plotSetup(N,Name)
% PLOTSETUP sets initial conditions for plotting dynamics problems.
%    PLOTSETUP() sets current figure settings to 
%       * Clears current figure
%       * X & Y limits to [0 1]
%       * Removes box
%
%    PLOTSETUP(N,Name)
%       * Clears figure(N)
%       * Makes figure(N)'s header Name
%       * X & Y limits to [0 1]
%       * Removes box
%
%    See also PLOTGROUND, PLOTCIRCLE.

%{
TODO:
   * Change Case to Allow for Subplots
   * Add Case for larger bounds ie: plotSetup(N,Name,[0 10])
%}

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
        