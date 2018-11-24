function Reconstruct(nb)
    % reconstruction de la video
    video = VideoWriter('video_res.avi'); %create the video object.
    open(video); %open the file for writing
    for ii=1:nb %where N is the number of images
    %I=imread(file);
    I=imread(strcat(strcat('Emily frames_res/frame_res',num2str(ii)),'.jpg'));
    writeVideo(video,I); %write the image to file
    end
    close(video); %close the file
    fprintf('recontructing the result video: Done successfully.\n');
end
