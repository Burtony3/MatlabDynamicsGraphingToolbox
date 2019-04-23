pos0 = [0.25 0.25];
posf = [0.75 0.25;
        0.65 0.275;
        0.55 0.30;
        0.45 0.325;
        0.35 0.35];
L0 = sqrt((posf(1,1) - pos0(1))^2 + (posf(1,2) - pos0(2))^2);
clc
for i = [1:5 4:-1:1]
   plotSetup(1,'Test Plot')
   plotGround([0.25 0.25],[0.2 0.3],'down')
   plotSpring(pos0,posf(i,:),4,L0)
   pause(0.11)
end