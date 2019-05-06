%% Example 1 (Simple Pendulum with Damping)

clear variables
clc

%{
EOM of the System:
    thetaDotDot = -(g/L)*sin(theta) - c*thetaDot
%}

%Constants
    g = 9.81; %Gravity Constant
    c = 0.05; %Damping Ratio
    L = 0.47; %Length of the Pendulum Rod
    tf = 30;
    numPoints = 300;
    tspan = linspace(0,tf,300); %Time Span of Integration
    IC = [-30 10]; %Initial Angle (Relative to 270 degrees) and Velocity
    options = odeset('RelTol',1e-6,'AbsTol',1e-6); %Integration Tolerances
    filename = 'Examples\Ex1.gif';
    
%Plot Line Options
    lineOptions.LineWidth = 1;
    
%Equation of Motion using State Space
    ex1EOM = @(t,x) [x(2);                       % xDotDot = d/dt(xDot)
                    (-g/L)*sind(x(1)) - c*x(2)]; % xDotDot = EOM
    
%Integrating
    [t,angle] = ode45(ex1EOM, tspan, IC, options);
    tDelay = tf/numPoints;
    
%Plotting using DynamicsGraphingToolbox    
    for i = 1:length(t)
        mdpSetup(1,'Example 1: Pendulum')
        mdpGround(0.9,'down')
        endPoint(i,1:2) = mdpLine([0.5 0.9],L,angle(i,1)-90);
        mdpTrail(endPoint,i,20,lineOptions)
        mdpCircle(endPoint(i,:),0.03);
        mdpSave(filename,i,tDelay,2)
        hold off
    end
    
%% Example 2 (Simple Pendulum with Damping [Phase Space])

clear variables
clc

%{
EOM of the System:
    thetaDotDot = -(g/L)*sin(theta) - c*thetaDot
%}

%Constants
    g = 9.81; %Gravity Constant
    L = 0.47; %Length of the Pendulum Rod
    c = [0:0.01:1 , 1:-0.01:0];
    tspan = [0 30]; %Time Span of Integration
    IC = [-30 10]; %Initial Angle (Relative to 270 degrees) and Velocity
    options = odeset('RelTol',1e-6,'AbsTol',1e-6); %Integration Tolerances
    filename = 'Examples\Ex2.gif';

    
%Plotting using DynamicsGraphingToolbox    
    for i = 1:length(c)
        %Equation of Motion using State Space
            ex1EOM = @(t,x) [x(2);                       % xDotDot = d/dt(xDot)
                            (-g/L)*sind(x(1)) - c(i)*x(2)]; % xDotDot = EOM
        
        %Integrating
            [t,angle] = ode45(ex1EOM, tspan, IC, options);

        %Plotting
            figure(1)
%             set(gcf,'Position',[271,451,1324,382]);
            plot(angle(:,1),angle(:,2),'LineWidth',1.5)
            axis equal
            title('Phase Space of Example 1 with Large Angular Velocity IC as Damping Ratio Changes')
            xlabel('Angular Position (Degrees)')
%             xlim([-50 720])
            ylabel('Angular Velocity (Degrees per Second)')
%             ylim([-75 150])
            legChar = 'Damping Ratio = '+string(c(i));
            legend(legChar)
            grid on
        
        %Capturing Image for Gif
            frame = getframe(gcf);
            im = frame2im(frame);
            [imind,cm] = rgb2ind(im,256);

        %Writing Gif to File
            if i == 1 %Creates Gif
                imwrite(imind,cm,filename,'gif','Loopcount',inf,...
                        'DelayTime',0.001,'BackgroundColor',0);
            else %Adds new frames onto Gif
                imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0.001);
            end
    end
    
%% Example 3 (System of 5 Boxes Connected with Springs)

%Givens
    m = [52000 52000 25000 25000 16000]; %Mass of each cart (in kg)
    k = [55 55 29 29]*1000; %Stiffness of each spring (in kN/m)
    alpha = 0; %First Coefficient of Rayleigh's Damping Model
    beta = 0.02; %Second Coefficient of Rayleight's Damping Model
    F = 100*1000;
    
%Solutions
    %Mass matrix
        M = [m(1)  0    0    0    0;
              0   m(2)  0    0    0;
              0    0   m(3)  0    0;
              0    0    0   m(4)  0;
              0    0    0    0   m(5)];
     
    %Stiffness Matrix
        K = [ k(1)   -k(1)       0         0       0;
             -k(1) k(1)+k(2)   -k(2)       0       0;
               0     -k(2)   k(2)+k(3)   -k(3)     0;
               0       0       -k(3)   k(3)+k(4) -k(4);
               0       0         0       -k(4)    k(4)];
     
    %Damping Matrix (Using Rayleigh's Damping Model)
        C = alpha*M + beta*K;
        
    %Force Matrix
        F = [1000;
             0;
             0;
             0;
             0];
    
    %Solving for Natural Frequencies     
        [U,~] = eig(inv(M)*K);
        
    %Dividing C & K by M

    %Creating Tilde Matricies
        K = inv(M)*K;
        C = inv(M)*C;
        F = inv(M)*F;
        
    %ODE45 Function
        %Equations of Motion of 5 Degree of Freedom System
        f = @(t,x) [x(2);
                    -C(1,1)*x(2) - C(1,2)*x(4) - K(1,1)*x(1) - K(1,2)*x(3) + F(1);
                    x(4);
                    -C(2,1)*x(2) - C(2,2)*x(4) - C(2,3)*x(6) - K(2,1)*x(1) - K(2,2)*x(3) - K(2,3)*x(5) + F(2);
                    x(6);
                    -C(3,2)*x(4) - C(3,3)*x(6) - C(3,4)*x(8) - K(3,2)*x(3) - K(3,3)*x(5) - K(3,4)*x(7) + F(3);
                    x(8);
                    -C(4,3)*x(6) - C(4,4)*x(8) - C(4,5)*x(10) - K(4,3)*x(5) - K(4,4)*x(7) - K(4,5)*x(9) + F(4);
                    x(10);
                    -C(5,4)*x(8) - C(5,5)*x(10) - K(5,4)*x(7) - K(5,5)*x(9) + F(5)];
                
        options = odeset('AbsTol',1e-6,'RelTol',1e-6);
        numPoints = 360;
        tMax = 20;
        tSpan = linspace(0,tMax,numPoints);
        IC = [0 0;
              0 0;
              0 0;
              0 0;
              0 0];
        [t,x] = ode45(f,tSpan,IC,options);
        
        clear IC options U alpha beta k m 
        
    %Plotting
        filename = 'Examples\Ex3.gif';
        tDelay = tMax/numPoints;
        for i = 1:length(x)
            fig1 = figure(1);
            set(gcf,'Position',[66 342 981 420])
            clf(gcf)
            fig1.Name = 'Example 3';
            xlim([0 2]) %Custom Bounds were Required so plotSetup did not apply
            ylim([0 0.5])
            axis off equal
            hold on
            mdpGround([0 0.1],[2 0.1])
            box1 = mdpBox([(0.65+x(i,1)) 0.15],0.05,0.05); %Far Left Box
            box2 = mdpBox([(0.50+x(i,3)) 0.15],0.05,0.05); %Second from Left
            box3 = mdpBox([(0.35+x(i,5)) 0.15],0.05,0.05); %Middle Box
            box4 = mdpBox([(0.20+x(i,7)) 0.15],0.05,0.05); %Second from Right
            box5 = mdpBox([(0.05+x(i,9)) 0.15],0.05,0.05); %Last Box
            mdpSpring(box2(1,:),box1(3,:),3,0.1) %Spring between Box1 & Box2
            mdpSpring(box3(1,:),box2(3,:),3,0.1) %Spring between Box2 & Box3
            mdpSpring(box4(1,:),box3(3,:),3,0.1) %Spring between Box3 & Box4
            mdpSpring(box5(1,:),box4(3,:),3,0.1) %Spring between Box4 & Box5
            stringBox = sprintf('Time = %0.3f Seconds',tSpan(i));
            annotation(gcf,'textbox',...
                [0.15 0.25 0.55 0.10],...
                'VerticalAlignment','bottom',...
                'String',stringBox,...
                'LineStyle','none',...
                'FitBoxToText','off');
            mdpSave(filename,i,tDelay,1)
        end
        
%% Example 4 (2 Pendulums Connected with a Spring)

%Givens
    m = 0.5;
    l = [0.55 0.5];
    k = 0.5;
    g = 9.81;
    alpha = 0.0761;
    
%Matricies
    M = [m*l(1)^2     0;
             0    m*l(2)^2];
    K = [(k*l(1)^2 +m*g*l(1))     (-k*l(1)*l(2));
            (-k*l(1)*l(2))    (k*l(2)^2 + m*g*l(2))]; %Derived from EoMs
    C = alpha*M;
     
%Eigenvectors/Eigenvalues
    [u,lambda] = eig(inv(M)*K,'vector');
    wn = sqrt(lambda);
     
%EoM Functions
    K = inv(M)*K;
    f = @(t,x) [x(2);
                -C(1,1)*x(2) - C(1,2)*x(4) - K(1,1)*x(1) - K(1,2)*x(3);
                x(4);
                -C(2,1)*x(2) - C(2,2)*x(4) - K(2,1)*x(1) - K(2,2)*x(3)];
            
%ODE45
    tMax = 20;
    numPoints = 800;
    tSpan = linspace(0,tMax,numPoints);
    options = odeset('AbsTol',1e-6,'RelTol',1e-6);
    IC = [-10 0;
          0 0];
    [t,x] = ode45(f,tSpan,IC,options);
    
%Plotting
    filename = 'Examples\Ex4.gif';
    framesSkipped = 3;
    tDelay = ((tMax*1.2)/numPoints)*framesSkipped;
    for i = 1:length(x)
        fig1 = figure(1);
        clf(gcf)
        set(gcf,'Position',[345,333,1180,500]);
        subplot(1,2,1)
            fig1.Name = 'Example 4';
            xlim([-0.25 1.25]) %Custom Bounds were Required so plotSetup did not apply
            ylim([0 1])
            axis off equal
            hold on
            mdpGround([0.3 0.75],[0.4 0.75],'down')
            mdpGround([0.6 0.70],[0.7 0.70],'down')
            endPen1 = mdpLine([0.35 0.75],l(1),x(i,1) - 90);
            endPen2 = mdpLine([0.65 0.70],l(2),x(i,3) - 90);
            circ1Pos = mdpCircle(endPen1,0.03,x(i,1));
            circ2Pos = mdpCircle(endPen2,0.03,x(i,3));
            mdpSpring(circ1Pos(1,:),circ2Pos(3,:),3,0.27)
        subplot(1,2,2)
            mdpPhasePlot(x,t,i,1)
            legend('Pendulum 1','Pendulum 2')
            xlabel('Angular Position (in Degrees)')
            ylabel('Angular Velocity (in Degrees per Second)')
        mdpSave(filename,i,tDelay,framesSkipped)
    end

    
%% Example 5 (2 Pendulums Connected with a Spring)

%Givens
    m = 0.5;
    l = [0.55 0.5];
    k = 0.5;
    g = 9.81;
    F = [8 ; 0];
    alpha = 0.2436;
    
%Matricies
    M = [m*l(1)^2     0;
             0    m*l(2)^2];
    K = [(k*l(1)^2 +m*g*l(1))     (-k*l(1)*l(2));
            (-k*l(1)*l(2))    (k*l(2)^2 + m*g*l(2))]; %Derived from EoMs
    C = alpha*M;
     
%Eigenvectors/Eigenvalues
    [u,lambda] = eig(M\K,'vector');
    wn = sqrt(lambda);
     
%EoM Functions
    K = M\K;
    C = M\C;
    F = M\F;
    f = @(t,x) [x(2);
                -C(1,1)*x(2) - C(1,2)*x(4) - K(1,1)*x(1) - K(1,2)*x(3) + F(1)*cos(wn(1)*t);
                x(4);
                -C(2,1)*x(2) - C(2,2)*x(4) - K(2,1)*x(1) - K(2,2)*x(3) + F(2)*cos(wn(1)*t)];
            
%ODE45
    tMax = 20;
    numPoints = 800;
    tSpan = linspace(0,tMax,numPoints);
    options = odeset('AbsTol',1e-6,'RelTol',1e-6);
    IC = [0 0;
          0 0];
    [t,x] = ode45(f,tSpan,IC,options);
    
%Plotting
    filename = 'Examples\Ex4.gif';
    framesSkipped = 1;
    tDelay = (tMax/numPoints)*framesSkipped*3;
    Force = F(1).*cos(wn(1).*t);
    for i = 1:length(x)
        fig1 = figure(1);
        clf(gcf)
        fig1.Name = 'Example 4';
        xlim([-0.5 1.5]) %Custom Bounds were Required so plotSetup did not apply
        ylim([-0.25 1.25])
        axis off
        hold on
        mdpGround([0.3 0.75],[0.4 0.75],'down')
        mdpGround([0.6 0.70],[0.7 0.70],'down')
        endPen1 = mdpLine([0.35 0.75],l(1),x(i,1) - 90);
        endPen2 = mdpLine([0.65 0.70],l(2),x(i,3) - 90);
        circ1Pos = mdpCircle(endPen1,0.03,x(i,1));
        circ2Pos = mdpCircle(endPen2,0.03,x(i,3));
        mdpSpring(circ1Pos(1,:),circ2Pos(3,:),3,0.27)
        mdpForce(endPen1,x(i,1),0.2,Force,i)
%         mdpSave(filename,i,tDelay,framesSkipped)
    end