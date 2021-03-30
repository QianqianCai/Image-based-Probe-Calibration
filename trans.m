function T_M2C = trans(location)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
Phi = location(1);
theta = location(2);
phi = location(3);
x = location(4);
y = location(5);
z = location(6);

Rx = [1 0 0; ...
      0 cosd(Phi) -sind(Phi); ...
      0 sind(Phi) cosd(Phi)];
Ry = [cosd(theta) 0 sind(theta); ...
      0 1 0; ...
      -sind(theta) 0 cosd(theta)];
Rz = [cosd(phi) -sind(phi) 0; ...
      sind(phi) cosd(phi) 0; ...
      0 0 1];
R = Rx*Ry*Rz;
T = [x;y;z];

T_M2C = [R T; ...
         0 0 0 1];
end

