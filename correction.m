function res = correction(I,J)

    histo_I=imhist(I);    
    histo_J=imhist(J);
    histo_cum_I=cumsum(histo_I);
    histo_cum_J=cumsum(histo_J);

    img_res=histeq(J,histo_I);
    histo_img_res=imhist(img_res);
    histo_cum_img_res=cumsum(histo_img_res);
    
    res=img_res;
end



% specification d'histogramme
% affichage
% figure;
% subplot(4,2,1)
% imshow(I)
% subplot(4,2,2)
% imshow(J)
% subplot(4,2,3)
% imhist(I);
% subplot(4,2,4)
% imhist(J);
% subplot(4,2,5)
% plot(histo_cum_I)
% subplot(4,2,6)
% plot(histo_cum_J)
% subplot(4,2,7)
% imshow(img_res);
% subplot(4,2,8)
% plot(histo_img_res)
