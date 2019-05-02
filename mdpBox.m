function edgePos = mdpBox(centerPos,width,height,varargin)
% mdpBox plots a box at a point & outputs useful points on box.
%    mdpBox(centerPos,width,height,angle) adds a box with center at
%    centerPos with width and height at specified angle.
%
%    Required Inputs:
%       centerPos = [x y] position vector of center
%
%       width = scalar specifying width
%
%       height = scalar specifying height
%
%    Optional Inputs:
%       angle = scalar in degrees of the angle of the box measured from
%               horizontal
%
%    Outputs:
%       edgePos = [x y] of the center of each edge of box for use of
%                 connecting other pieces to
%
%    Examples:
%       edgePos = mdpBox([1 3], 4 , 6)
%
%    See also mdpSetup, mdpLine, mdpCircle.

    switch nargin
%% Box without angle Case
        case 3
            x0 = centerPos(1);
            y0 = centerPos(2);
            w = 0.5*width;
            h = 0.5*height;
            xBox = [(x0 - w),(x0 + w),(x0 + w),(x0 - w),(x0 - w)];
            yBox = [(y0 + h),(y0 + h),(y0 - h),(y0 - h),(y0 + h)];
            plot(xBox,yBox,'-k','LineWidth',1.25)
            fill(xBox,yBox,'w')
            edgePos = [(x0 + w) , y0;
                       x0 , (y0 + h);
                       (x0 - w) , y0;
                       x0 , (y0 - h)];
    end
end