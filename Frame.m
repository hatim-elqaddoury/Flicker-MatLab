function length = Frame(filename)
    a=VideoReader(filename);    
    length = a.NumberOfFrames;
    %framerate=a.FrameRate;
    %[audio,fs]=audioread(filename);
    %figure;
    %for img = 1:length
        %filename=strcat('frame',num2str(img),'.jpg');
        %b = read(a, img);
        %imshow(b);
        %imwrite(b,filename); % to print em on folder.
    %end
    fprintf('Video splitting: done successfully, nb = %d',length);
end