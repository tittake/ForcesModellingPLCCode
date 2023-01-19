% commanded motion
% theta1 = theta1(0) + theta1A*sin(theta1f*t) [rad]
cmdMotion.theta1A = -25*pi/180;
cmdMotion.theta1B = 0;
cmdMotion.theta1f = 0.5*2*pi;
% theta2 = theta2(0) + theta2A*sin(theta2f*t) [rad]
cmdMotion.theta2A = 25*pi/180;
cmdMotion.theta2B = 0;
cmdMotion.theta2f = 0.25*2*pi;
% xt2 = xt2(0) + xt2A*sin(xt2f*t) [rad]
cmdMotion.xt2A = 0.4;
cmdMotion.xt2B = 0;
cmdMotion.xt2f = 1*2*pi;