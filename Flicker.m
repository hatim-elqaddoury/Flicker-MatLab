%function nbr=Flicker(nb)
    close all
    clear all   
    clc
    nb=25;
    [m,n,can] = size(imread('Emily frames/frame1.jpg'));%to get the size.
    nbr=nb;
    %the_ones = uint16(ones(m,n));        
    the_mean_of_J = uint16(zeros(m,n));
    use_B = uint16(zeros(m*n,10));
    the_mean_of_B = uint16(zeros(m,n));

     for i=1:10
         the_sum = uint16(zeros(m,n));
         A=imread(strcat(strcat('Emily frames/frame',num2str(i)),'.jpg'));       
         % mns(i) = mean2(A);                           
         % frame_res = A * (mns(1) / mns(i));
         p=1;

         for j=1:10
             B=imread(strcat(strcat('Emily frames/frame',num2str(j)),'.jpg'));

             for l=1:m*n
                %fetch the current image in a new matrix m*n x 21.
                for x=1:m
                    for y=1:n
                        use_B(l,p)=B(m,n);
                    end
                end
            end   
            p=p+1; 
         end

         H = harmmean(use_B); % return an array of size m*n

        % Fetch H on a matrix inv_J.
        counter=1;
        for t=1:n
            for q=1:m
                the_mean_of_B(q,t) = H(counter);
                counter=counter+1; 
            end
        end

         frame_res = histeq(A,imhist(the_mean_of_B));%,imhist(res));
         filename = strcat('Emily frames_res/frame_res',num2str(i),'.jpg');
         R=frame_res;
         %R=imadjust(frame_res,[0.3 0.5],[]);
         imwrite(R,filename); % to print em on folder.
     end
     
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    for i=11:nb-10	
        the_sum = uint16(zeros(m,n));
        the_mean_of_J = uint16(zeros(m,n));
        use_J = uint16(zeros(m*n,21));
        
        I=imread(strcat(strcat('Emily frames/frame',num2str(i)),'.jpg'));
        p=1;

        for j=i-10:i+10	            
            J=imread(strcat(strcat('Emily frames/frame',num2str(j)),'.jpg'));
            for l=1:m*n
                %fetch the current image in a new matrix m*n x 21.
                for x=1:m
                    for y=1:n
                        use_J(l,p)=J(m,n);
                    end
                end
            end   
            p=p+1;  
        end

        H = harmmean(cumsum(imhist(use_J))); % return an array of size m*n

        % Fetch H on a matrix inv_J.
        counter=1;
        for t=1:n
            for q=1:m
                the_mean_of_J(q,t) = H(counter);
                counter=counter+1; 
            end
        end

        frame_res = histeq(I,imhist(the_mean_of_J));  
        filename = strcat('Emily frames_res/frame_res',num2str(i),'.jpg');
        imwrite(R,filename); % to print em on folder.

    end
		    
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
     for i=nb-9:nb
         the_sum = uint16(zeros(m,n));
         C=imread(strcat(strcat('Emily frames/frame',num2str(i)),'.jpg'));
         for j=nb-9:nb
             D=imread(strcat(strcat('Emily frames/frame',num2str(j)),'.jpg'));
             the_sum = the_sum + uint16(D);                  
             % theones * inv(D) would be a soulution but that's pretty 
             % impossible because non square matrix don't have an inverse,
             % the solution as i see is to loop m and n manualy, to calculate it.
         end
         res= uint8(10/the_sum);
         frame_res = histeq(res,imhist(C));
         filename = strcat('Emily frames_res/frame_res',num2str(i),'.jpg');
         R=frame_res;
         %R=imadjust(frame_res,[0.3 0.5],[]);
         imwrite(R,filename); % to print em on folder.
     end
     
    fprintf('Flicker removing: Done successfully.\n');
    %end

