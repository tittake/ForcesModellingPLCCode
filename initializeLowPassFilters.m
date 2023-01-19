% controller sample time
controller.dT = 0.001;
filtEnc = init2ndOrderLowPassFilter(35*2*pi,1,controller.dT);
filtDV = init2ndOrderLowPassFilter(35*2*pi,1,controller.dT);