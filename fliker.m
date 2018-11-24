function nbr=fliker(nb)
    nbr = nb;
    S=imread('Emily frames/frame1.jpg');
    [m,n,can] = size(S);
    
    for i=1:10 %les image à traiter
            the_sum = 0;% uint16(zeros(m,n));
            A=imread(strcat(strcat('Emily frames/frame',num2str(i)),'.jpg'));
            figure; plot(imhist(A));
            title(strcat(strcat('frame',num2str(i)),'.jpg'));
            for j=1:10
             B=imread(strcat(strcat('Emily frames/frame',num2str(j)),'.jpg'));
             the_sum = the_sum + 1./cumsum(imhist(B));
            end
            
        H = 10./the_sum;
        frame_res = histeq(A,H);
        figure; plot(imhist(frame_res));
        title(strcat(strcat('H ',num2str(i)),'.jpg'));
        filename = strcat('Emily frames_res/frame_res',num2str(i),'.jpg');
        R=frame_res;
        %R=imadjust(frame_res,[0.3 0.7],[]);
        imwrite(R,filename); % to print em on folder.
    end
    
    for i=11:nb-10
        the_sum = 0;
        I=imread(strcat(strcat('Emily frames/frame',num2str(i)),'.jpg'));
        for j=i-10:i+10
            J=imread(strcat(strcat('Emily frames/frame',num2str(j)),'.jpg'));
            %figure; imshow(J);
            %figure; plot(cumsum(imhist(J)));
            the_sum = the_sum + 1./cumsum(imhist(J));
        end
        H = 21/the_sum; %moyen harmonique
        frame_res = histeq(I,H);  
        filename = strcat('Emily frames_res/frame_res',num2str(i),'.jpg');
        R=frame_res;
        %R=imadjust(frame_res,[0.3 0.7],[]);
        imwrite(R,filename); % to print em on folder.
        %figure; imshow(frame_res);
        %figure; plot(cumsum(imhist(frame_res)));
    end

    for i=nb-9:nb
        the_sum = 0;
        C=imread(strcat(strcat('Emily frames/frame',num2str(i)),'.jpg'));
        for j=nb-9:nb
            D=imread(strcat(strcat('Emily frames/frame',num2str(j)),'.jpg'));
            the_sum = the_sum + 1./cumsum(imhist(D));
        end
        H= the_sum/10;
        frame_res = histeq(C,H);
        filename = strcat('Emily frames_res/frame_res',num2str(i),'.jpg');
        R=frame_res;
        %R=imadjust(frame_res,[0.3 0.7],[]);
        imwrite(R,filename); % to print em on folder.
    end
    
end

