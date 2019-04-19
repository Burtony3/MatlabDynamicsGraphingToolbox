function saveDynPlot(filename,index,delayTime,framesSkipped)
% SAVEDYNPLOT saves each frame into a gif.
%
%    filename: Name of saved file, must have the extension of '.gif'
%
%    index: 
%
%    delayTime: Time between frames in seconds
%
%    framesSkipped: Number of frames inbetween saved frames
%    
%    See also PLOTSETUP, PLOTGROUND, PLOTLINE, PLOTCIRCLE.

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