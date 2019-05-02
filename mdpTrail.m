function mdpTrail(originPoint,index,varargin)
% mdpTrail plots ghost trail that follows a certain vector at any time
%    Variations:
%		mdpTrail(originPoint,index)
%       mdpTrail(originPoint,index,length)
%       mdpTrail(originPoint,index,length,lineOptions)
%    
%    Required Inputs:
%       originPoint = nx2 vectory specifying the x & y positions at each
%                     index
%
%       index = Current point in time for which to reference position
%
%    Optional Inputs
%       length = specifies index length for which to plot line
%
%       lineOptions = structure for which to save plot options to
%
%    Examples:
%       lineOptions.LineWidth = 1.5;
%       lineOptions.Color = 'g';
%       mdpTrail(posMatrix,i,25,lineOptions)
%
%    See also mdpSave, mdpGround, mdpSpring.

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

