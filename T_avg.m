data = csvread('Take 2021-03-23 09.48.52 PM-trans_matri_Euler.csv',7,1);

for i = 2:13
    A = data(:,i);
    A(A == 0) = nan;

    x = data(:,2);
    F = fillmissing(A,'movmean',12);
    data(:,i) = F;
end

Relative_pose = zeros(length(data),6);

for i = 1:length(data)
    T2 = trans(data(i,2:7));
    T1 = trans(data(i,8:13));
    Tx = inv(T2)*T1;
    fi = atand(-Tx(2,3)/Tx(3,3));
    theta = asind(Tx(1,3));
    phi = acosd(Tx(1,1)/cosd(theta));
    x = Tx(1,4);
    y = Tx(2,4);
    z = Tx(3,4);
    relative_pose = [fi theta phi x y z];
    Relative_pose(i,:) = relative_pose;
end

pose_avg = mean(Relative_pose)
T_avg = trans(pose_avg)

writematrix(T_avg, 'test.txt')