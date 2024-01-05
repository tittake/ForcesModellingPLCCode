% Mathematical modelling and virtual decomposition control of heavy-duty
% parallel-serial hydraulic manipulators

% https://www.sciencedirect.com/science/article/pii/S0094114X21004092
% Authors: Goran Petrovic and Jouni Mattila
% January 2023
% Tampere University / Tampereen Yliopisto

% Simulation initialization file

%%gravity

%theta1, amp: cmdMotion.theta1A, bias: initVals.theta10, freq: cmdMotion.theta1f
%theta2: amp: cmdMotion.theta2A, bias: initVals.theta20, freq:
%cmdMotion.theta2f

clear
clc
close all

initializeHydraulicCylindersData
initializeConstantGeometricData
initializeConstantPositionVectors
initializeConstantRotationMatrices
initializeInertiaProperties
initializeAuxiliaryQuantities
initializeInitialValuesInSimulation
initializeCommandedMotionData
initializeLowPassFilters
initializeInertiaAdaptationVectors
%
encoder.noisePower = 1e-9;
% boundary conditions
D22F = [0;0;0;0;0;0];
Bc1_V = [0;0;0;0;0;0];
% gravity vector
gravity.Wg = [0; 9.8066; 0];

%ry = py.test.send_string()