function plotTrail(originPoint,index,varargin)
% PLOTTRAIL plots a ghost trail from a point to illustrate motion.
%  
%   Inputs:
%    * originPoint: The array that the trail will follow in the form of a two
%      column matrix, Column 1 being the 'x' position & Column 2 being the 'y'
%
%    * index: The current index in the loop, or the index at which the trail
%      starts from in the originPoint array
%
%    * length: The length, of the indexes in the matrix that are taken into
%      account.
%    
%    * lineOptions: A structure with all line options chosen, in the same
%      for as any other plot()
%
%   Example:
%      lineOptions.LineWidth = 1.5;
%      lineOptions.Color = 'g';
%      plotTrail(matrix,i,25,lineOptions)
%
%    See also PLOTSETUP, PLOTGROUND, PLOTLINE, PLOTCIRCLE.

    switch nargin
%% Finite Length with Color Case
        case 4
            startIndex = index - varargin{1};
            endIndex = index;
            if startIndex < 1
                plot(originPoint(1:endIndex,1),...
                     originPoint(1:endIndex,2),...
                     varargin{2})
            else
                plot(originPoint(startIndex:endIndex,1),...
                     originPoint(startIndex:endIndex,2),...
                     varargin{2})
            end
        
%% Finite Length Case
        case 3
            if isscalar(varargin{1})
                startIndex = index - varargin{1};
                endIndex = index;
                if startIndex < 1
                    plot(originPoint(1:endIndex,1),...
                         originPoint(1:endIndex,2),...
                         'LineWidth',1)
                else
                    plot(originPoint(startIndex:endIndex,1),...
                         originPoint(startIndex:endIndex,2),...
                         'LineWidth',1)
                end
            elseif isstruct(varargin{1})
                plot(originPoint(1:index,1),...
                 originPoint(1:index,2),...
                 varargin{1})                
            end
            
%% Endless Case
        case 2
            plot(originPoint(1:index,1),...
                 originPoint(1:index,2),...
                 'LineWidth',1)
    end
end

