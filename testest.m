clc
m=5; n=4;
the_mean_of_I = zeros(m,n);
H=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];

counter=1;
  for i=1:m
     for j=1:n
         the_mean_of_I(i,j)=H(counter);
         counter=counter+1;
     end
  end
 
  %the_mean_of_I