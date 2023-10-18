import matlab.engine

# Start the MATLAB Engine
eng = matlab.engine.start_matlab()

# Define the relative path from Python script to MATLAB script
relative_path = '/home/titta/Documents/rpw/ForcesModellingPLCCode/initializeSimulationGP.m'

# Call the MATLAB script using the relative path
eng.eval(f"run('{relative_path}')", nargout=0)

# Close the MATLAB Engine
eng.quit()
