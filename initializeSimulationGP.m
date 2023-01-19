% Mathematical modelling and virtual decomposition control of heavy-duty
% parallel-serial hydraulic manipulators

% https://www.sciencedirect.com/science/article/pii/S0094114X21004092
% Authors: Goran Petrovic and Jouni Mattila
% January 2023
% Tampere University / Tampereen Yliopisto

% Simulation initialization file

%%

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