function [thetaXr] = initInertiaUpdate(m, r, I)

    % Forms vector theta as in Appendix A of Zhu, Wen-Hong. Virtual 
    % decomposition control: toward hyper degrees of freedom robots. 
    % Vol. 60. Springer Science & Business Media, 2010
    rx = r(1); ry = r(2); rz = r(3);
    
    Ixx = I(1,1); Iyy = I(2,2); Izz = I(3,3);
    Iyz = I(2,3); Ixz = I(1,3); Ixy = I(1,2);
    
    t1 = rx*rx;
    t2 = ry*ry;
    t3 = rz*rz;
    t4 = rx*m;
    
    thetaXr = [m; rx*m; ry*m; rz*m; t1*m; t2*m; t3*m;...
                 t4*ry - Ixy; t4*rz - Ixz; m*ry*rz - Iyz; Ixx; Iyy; Izz];
    
end