clear
clc
xlsfile = dir('*.csv');

for i = 1%:length(xlsfile)
   data = csvread('Take 2021-03-23 09.48.52 PM_RB110FUS1.csv',7,1);
end

num_frame = 1400;

pose = zeros(num_frame,7);

for m = 22:4:5692
    avg_pose = mean(data(m:m+3,2:8));
    pose((m-18)/4,:) = avg_pose;
    clear avg_pose
end

padding = zeros(length(pose),2);
format longE
Pose = [padding pose(:,5:7) pose(:,1:4)];
writematrix(Pose, 'pos.txt','Delimiter',' ')