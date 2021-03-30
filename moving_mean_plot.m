clear
clc

% x: data(:,3)
% y: data(:,4)
% z: data(:,5)

% addpath('/Users/caiqianqian/项目-归档/2020 Journal Hemispherical Marker Rigid Body/Results_Accuracy_MissingPercentage/')

%%
file = dir('*.csv');
    y_label = {['Rotation (deg)'],['Position (mm)']};
    figure_title = {['Rotation along x-axis'],['Rotation along y-axis'],['Rotation along z-axis'],['Position along x-axis'],['Position along y-axis'],['Position along z-axis']};

    LOST = [];
for m = 1:length(file)
    data = csvread(file(m).name,7,0);
    n = length(data);
    index_lost = find(data(:,3)==0);
    lost = length(index_lost)/n*100;        % unit: %
    LOST = [LOST;lost];
    
    figure(m)
    for i = 3%:8
        A = data(:,i);
        A(A == 0) = nan;

        x = data(:,2);
        F = fillmissing(A,'movmean',12); 

        subplot(1,1,i-2)
        plot(x,F,'r.-',x,A,'b.-') 
        lgd = legend('Filled Missing Data','Original Data');
        lgd.FontSize = 20;
        set(gca,'FontSize',20);
        title(figure_title(i-2),'FontSize',22)
        xlabel('Time (s)','FontSize',22)
        ylabel(y_label(ceil((i-2)/3)),'FontSize',22)
    end
    h = suptitle({['Filling Missing Spatial Information'];['(',num2str(lost),'% of the data was missing)']});
    set(h,'FontSize',22,'FontWeight','normal')
    set(h,'Fontname','times new Roman');
    set(gca,'Fontname','times new Roman');
    
    fig = gcf;
    fig.PaperUnits = 'inches';
    fig.PaperPosition = [0 0 16 14];
    print(['Fig_',num2str(m)],'-dpng')
end