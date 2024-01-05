run("initializeSimulationGP.m");

enabled_joints = [true true false];

model = "SimForces2022a";
load_system(model);

set_param(model, "StopTime", "10");

for i = 1:1000

  path = "SimForces2022a/sbHydraulicManipulatorSimscape/"

  blockPaths = {strcat(path, "sbBase/Sine Wave"), ...
                strcat(path, "sbLiftLink/Sine Wave"), ...
                strcat(path, "sbPrismaticJointCylinderAndPiston/Sine Wave")};

  for blockIndex = 1 : 3

    if enabled_joints(blockIndex) == true

      set_param(blockPaths{blockIndex}, "Amplitude", ...
                num2str(-1 + 2 * rand));

      set_param(blockPaths{blockIndex}, "Frequency", ...
                num2str(0.1 * rand));

      set_param(blockPaths{blockIndex}, "Phase", ...
                num2str(-pi + (2 * pi) * rand));

      set_param(blockPaths{blockIndex}, "Bias", ...
                num2str(0));

    else

      set_param(blockPaths{blockIndex}, "Amplitude", num2str(0));
      set_param(blockPaths{blockIndex}, "Frequency", num2str(0));
      set_param(blockPaths{blockIndex}, "Phase", num2str(0));
      set_param(blockPaths{blockIndex}, "Bias", num2str(0));

    end

  end

  save_system(model);
  load_system(model);
  simIn = Simulink.SimulationInput(model);
  plotThisData = @(simulationOutput) plotData(simulationOutput, i);
  simIn = simIn.setPostSimFcn(plotThisData);
  parsim(simIn, "RunInBackground", "on");

end


function simulationOutput = plotData(simulationOutput, i);

  % disp(simulationOutput.ErrorMessage);
  disp(simulationOutput);

  data = struct();

  data.time = simulationOutput.boom_x.time;

  for field = string({'x', 'y', 'z', ...
                      'angle', ...
                      'x_velocity', ...
                      'y_velocity', ...
                      'z_velocity', ...
                      'x_acceleration', ...
                      'y_acceleration', ...
                      'z_acceleration'})
    data.(strcat('boom_', field)) = ...
      squeeze(simulationOutput.(strcat('boom_', field)).signals.values);
  end

  for field = string({'theta1', 'theta2', 'xt2' ...
                      'theta1dot', 'theta2dot', 'xt2dot'})
    data.(field) = squeeze(simulationOutput.(field).signals.values);
  end

  for field = string({'fc1', 'fc2', 'fct2'})
    data.(field) = squeeze(simulationOutput.torques.(field).Data);
  end

  line_color = [60 100 175] / 25;

  disp(data)

  subplot(3, 1, 1)
  plot(data.time, data.boom_x, 'color', 'blue')
  title("boom x position")

  subplot(3, 1, 2)
  plot(data.time, data.boom_y, 'color', 'red')
  title("boom y position")

  subplot(3, 1, 3)
  plot(data.time, data.boom_angle, 'color', 'green')
  title("boom angle")

  table = struct2table(data);

  if ~exist('trajectories') mkdir('trajectories'); end

  disp(num2str(i));

  writetable(table, strcat("trajectories/trajectory", num2str(i), ".csv"));

end
