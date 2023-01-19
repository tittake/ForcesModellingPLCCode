% Any total force here is calculated using the parametrization from 
% the Appendix A of Zhu, Wen-Hong. Virtual decomposition control: toward 
% hyper degrees of freedom robots. Vol. 60. Springer Science & Business 
% Media, 2010 where the required velocities equal the measured ones. 
% Writing out expression like this is required by parameter adaptation 
% mechanisms in a control task.
%% thetaBc1r
[update.thetaBc1rNominal] = ...
initInertiaUpdate(inertiaProp.mBc1, inertiaProp.Bc1_r_Bc1C, inertiaProp.Bc1cI);
%% thetaB11r
[update.thetaB11rNominal] = ...
initInertiaUpdate(inertiaProp.mB11, inertiaProp.B11_r_B11C, inertiaProp.B11cI);
%% thetaB31r
[update.thetaB31rNominal] = ...
initInertiaUpdate(inertiaProp.mB31, inertiaProp.B31_r_B31C, inertiaProp.B31cI);
%% thetaB41r
[update.thetaB41rNominal] = ...
initInertiaUpdate(inertiaProp.mB41, inertiaProp.B41_r_B41C, inertiaProp.B41cI);
%% thetaBc2r
[update.thetaBc2rNominal] = ...
initInertiaUpdate(inertiaProp.mBc2, inertiaProp.Bc2_r_Bc2C, inertiaProp.Bc2cI);
%% thetaB12r
[update.thetaB12rNominal] = ...
initInertiaUpdate(inertiaProp.mB12, inertiaProp.B12_r_B12C, inertiaProp.B12cI);
%% thetaB32r
[update.thetaB32rNominal] = ...
initInertiaUpdate(inertiaProp.mB32, inertiaProp.B32_r_B32C, inertiaProp.B32cI);
%% thetaB42r
[update.thetaB42rNominal] = ...
initInertiaUpdate(inertiaProp.mB42, inertiaProp.B42_r_B42C, inertiaProp.B42cI);   
%% thetaP22r
[update.thetaP22rNominal] = ...
initInertiaUpdate(inertiaProp.mP22, inertiaProp.P22_r_P22C, inertiaProp.P22cI); 
%% thetaB52r
[update.thetaB52rNominal] = ...
initInertiaUpdate(inertiaProp.mB52, inertiaProp.B52_r_B52C, inertiaProp.B52cI); 
%% thetaP32r
[update.thetaP32rNominal] = ...
initInertiaUpdate(inertiaProp.mP32, inertiaProp.P32_r_P32C, inertiaProp.P32cI);