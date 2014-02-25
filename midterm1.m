function [] = midterm1(robotid)

  wl = 0;
  wr = 0;
  disp('start')
  while(1)
    pause(0.05);
    velos = [wl,wr];
    [success, enc] = setwheel(robotid,velos)
    range = getrange(robotid);
    [x,y] = getxy(robotid)


  end

end
