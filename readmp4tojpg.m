% Open an mp4.
[filename,pathname]=uigetfile('*','open');

% whether you open an mp4.
if isequal(filename,0) 
    disp('User selected Cancel.') 
else
    disp(['User selected ', fullfile(pathname, filename), '.'])
end

full_file = fullfile(pathname,filename);

vid=VideoReader(full_file); 

numFrames = vid.NumberOfFrames;

n=numFrames;

for i = 1:n
    frames = read(vid,i);
    imwrite(frames,['Image' int2str(i), '.jpg']);
    im(i)=image(frames);
end