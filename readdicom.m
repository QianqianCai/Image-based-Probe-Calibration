clear
clc
cinefile = dir('*.dcm');
for i = 1:length(cinefile)
    cinedata = dicomread(cinefile(i).name);
    cineloopsize = size(cinedata);
    frames = cineloopsize(end);
    parfor n = 1:frames
        img = cinedata(:,:,:,n);
        image(img)
        truesize(gcf)
        filename = ['FUS',num2str(i),'_',num2str(n),'.jpg'];
        imwrite(img,filename)
    end
%         zip(['imageintensity',num2str(i)],'*.jpg')
%         delete *.jpg
end
