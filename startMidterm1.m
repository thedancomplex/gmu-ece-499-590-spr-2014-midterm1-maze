function [ success ] = startMidterm1(q)
addpath("/usr/share/openrave-0.8/octave/") 

% Midterm
if (q == 1)
orEnvLoadScene('/home/student/projects/gmu-ece-499-590-spr-2014-midterm1-maze/mazeMidterm1m1.env.xml', 1);
elseif (q == 2)
orEnvLoadScene('/home/student/projects/gmu-ece-499-590-spr-2014-midterm1-maze/mazeMidterm1m2.env.xml', 1);
elseif (q == 3)
orEnvLoadScene('/home/student/projects/gmu-ece-499-590-spr-2014-midterm1-maze/mazeMidterm1m3.env.xml', 1);
else
  disp('invalid choice')
end

% pay attention to this line, I found different commands to switch on
% the physics engine but just 'physics ode' works fine
orEnvSetOptions('physics ode')
orEnvSetOptions('debug 0')
orEnvSetOptions('gravity 0 0 -9.8')
orEnvSetOptions('timestep 0.001')
orEnvSetOptions('simulation stop')
orEnvSetOptions('simulation start')

logid = orEnvCreateProblem('logging')
orProblemSendCommand('savescene filename myscene.env.xml',logid)

robots = orEnvGetRobots()
robotid=robots{1,1}.id

% switch on "all" sensors (at the moment we have just one)
sensor = orRobotGetAttachedSensors(robotid);
for i=0:length(sensor)
   orRobotSensorConfigure(robotid, i, 'poweron');
   orRobotSensorConfigure(robotid, i, 'renderdataon');
end

% we want to use the existing implementation of a differential
% driven robot (two wheels located on one axes)
success = orRobotControllerSet(robotid, 'odevelocity')
success = orRobotControllerSend(robotid, 'setvelocity 0 0')

% Midterm
if (q == 1)
  midterm1m1(robotid);
elseif (q == 2)
  midterm1m2(robotid);
elseif (q == 3)
  midterm1m3(robotid);
else
  disp('invalid choice')
end

% Turn robot off`
success = orRobotControllerSend(robotid,...
                               'setvelocity 0 0');

end
