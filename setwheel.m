function [success, enc] = setwheel(robotid,velos)

  wl = velos(1);
  wr = velos(2);

  velocities=2*rand(1,orRobotGetActiveDOF(robotid));
  velocities=[wl,wr];

  success = orRobotControllerSend(robotid, ...
                                  ['setvelocity ', num2str(velocities)]);
  enc = orRobotGetDOFValues(robotid);
end
