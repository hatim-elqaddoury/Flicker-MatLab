    close all
    clear all
    clc
  
    I1=imread('Emily frames/frame3.jpg');
    I2=imread('Emily frames/frame4.jpg');
    [m,n,can]=size(I1);
    figure;imshow(I1);title('frame3');    
    figure;imshow(I2);title('frame4');

    figure;
    subplot(2,2,1);
    H_I1= imhist(I1);
    plot(H_I1);title('histo frame3');
    subplot(2,2,2)
    H_I2= imhist(I2);
    plot(H_I2);title('histo frame4');
    subplot(2,2,3);
    Cum_I1 = cumsum(H_I1);
    plot(Cum_I1);title('histo cumulé frame3');
    subplot(2,2,4);
    Cum_I2 = cumsum(H_I2);
    plot(Cum_I2);title('histo cumulé frame4');
    
    
    
    
    the_mean_of_I = uint16(zeros(m,n));
    use_I = uint16(zeros(m*n,2));
    
   for i=1:m
        for j=1:n
            use_I(1,i+j)=I1(i,j);
            use_I(2,i+j)=I2(i,j);
        end
   end
  %use_I
  H = harmmean(use_I);
    counter=1;
  for i=1:m
     for j=1:n
         the_mean_of_I(i,j)=H(counter);
         counter=counter+1;
     end
  end
 
    figure; imshow(the_mean_of_I);
    figure; plot(imhist(the_mean_of_I));
    figure; plot(cumsum(imhist(the_mean_of_I)));