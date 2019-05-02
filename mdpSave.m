function mdpSave(filename,index,delayTime,framesSkipped)
% mdpSave Saves current figure window and outputs it as .gif
%    Variations:
%		mdpSave(filename,index,delayTime,framesSkipped)
%    
%    Required Inputs:
%       filename = outputted file name ending with .gif
%
%       index = current index for which to save the frame to
%
%       delayTime = Time between frames in seconds
%
%       framesSkipped = Number of frames/index between saving to gif
%
%    Examples:
%       mdpSave('foo.gif',25,0.001,3)
%
%    See also plot, mdpPhasePlot, mdpSetup.

%% Setup

    modDiv = framesSkipped+1;

%% Saving GIF

    %Capturing Image for Gif
        frame = getframe(gcf);
        im = frame2im(frame);
        [imind,cm] = rgb2ind(im,256);

    %Writing Gif to File
        if index == 1 %Creates Gif
            imwrite(imind,cm,filename,'gif','Loopcount',inf,...
                    'DelayTime',delayTime,'BackgroundColor',0);
        elseif mod(index,modDiv) == 1 %Adds new frames onto Gif
            imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',delayTime);
        end

end