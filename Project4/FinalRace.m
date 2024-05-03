% Simulate model for 60 minutes
genTrack;
P4init;
simout = sim("P4_car.slx", "StopTime", "3600");
carX = simout.X.Data;
carY = simout.Y.Data;
tout = simout.tout;

% Race Statitics
race = raceStat(carX, carY, tout, path, simout);
disp(race)