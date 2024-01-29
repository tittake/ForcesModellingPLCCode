import java.net.ServerSocket
import java.net.Socket
import java.io.*

initializeSimulationGP

if ~bdIsLoaded('SimForces2022a')
    open_system('SimForces2022a');
end

port = 12345

% Create a server socket
serverSocket = ServerSocket(port);
disp('Waiting for connection...');

try
    % Accept a connection
    clientSocket = serverSocket.accept;
    disp('Client connected successfully');

    % Get input stream
    inputStream = clientSocket.getInputStream;
    dataInputStream = DataInputStream(inputStream);

    % Iterating through the number of samples expected (100 in this case)
    for iteration = 1:100
        % Check if enough data is available
        while inputStream.available() < 24 % Waiting for 24 bytes (3 doubles)
            pause(0.01); % Avoid tight loop
        end

        % Read data
        j1 = dataInputStream.readDouble();
        j2 = dataInputStream.readDouble();
        j3 = dataInputStream.readDouble();

        % Create a time-value matrix for each joint value
        currentTime = iteration * 0.1;
        j1_matrix = [currentTime, j1];
        j2_matrix = [currentTime, j2];
        j3_matrix = [currentTime, j3];

        % Assign the matrix to the base workspace
        assignin('base', 'theta1_ts', j1_matrix);
        assignin('base', 'theta2_ts', j2_matrix);
        assignin('base', 'xt2_ts', j3_matrix);

        % Run the simulation for this iteration
        % Set StopTime to the current time
        sim('SimForces2022a', 'StopTime', num2str(currentTime));

        % Optional: Pause for a specific duration
        pause(0.1);

        initVals.theta10 = j1;
        initVals.theta20 = j2;
        initVals.xt20 = j3;
    end

    disp('Data transfer complete');
catch exception
    disp(['Error: ' exception.message]);
end

% Close the streams and sockets
dataInputStream.close();
inputStream.close();
clientSocket.close();
serverSocket.close();


