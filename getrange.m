function [range] = getrange(robotid)

  data = orRobotSensorGetData(robotid,0);
  % check the completeness of a laser measurement 
  if min(size(data.laserrange))~=0
     % calculate the range from distance in all dimensions 
     range=sqrt(data.laserrange(1,:).^2+...
                data.laserrange(2,:).^2+...
                data.laserrange(3,:).^2);
     % filtering "0" values (No idea were they come from)
     range(range==0)=NaN;
     
     k = 0.1;
     for i=1:length(range)
	range(i) = range(i)*k*rand(1);
     end

end
