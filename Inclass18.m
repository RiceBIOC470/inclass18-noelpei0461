% In class 18

% Problem 1. In this directory, you will find the same image of yeast cells as you used
% in homework 5. First preprocess the image any way you like - smoothing, edge detection, etc. 
% Then, try to find as many of the cells as you can using the
% imfindcircles routine with appropriate parameters. 
% Display the image with the circles drawn on it.  
I=imread('yeast.tif');
smoothbackground(I);
autobinary('imsmbg.tif');
img=imread('BW.tif');
[centers,radii]=imfindcircles(img,[15 25],'Sensitivity',0.96);
figure;imshow(img,[]);hold on;
for ii=1:length(centers)
    drawcircle(centers(ii,:),radii(ii),'m');
end


% Problem 2. (A) Draw two sets of 10 random numbers - one from the integers
% between 1 and 9 and the second from the integers between 1 and 10. Run a
% ttest to see if these are significantly different. (B) Repeat this a few
% times with different sets of random numbers to see if you get the same
% result. (C) Repeat (A) and (B) but this time use 100 numbers in each set
% and then 1000 numbers in each set. Comment on the results. 
%A
a=randi(9,[1,10]);
b=randi(10,[1,10]);
[is_seg,pval]=ttest2(a,b);

%is_seg=0,pval=0.8293. That means the two sets are no significantly
%related.
%B
a=randi(9,[1,10]);
b=randi(10,[1,10]);
[is_seg,pval]=ttest2(a,b);

a=randi(9,[1,10]);
b=randi(10,[1,10]);
[is_seg,pval]=ttest2(a,b);

a=randi(9,[1,10]);
b=randi(10,[1,10]);
[is_seg,pval]=ttest2(a,b);
%Although the p-value changes everytime, the seg=0 for all 3 runs, meaning
%there is no significant relationship between the two sets of numbers.

%C.
%100 numbers:
a=randi(9,[1,100]);
b=randi(10,[1,100]);
[is_seg,pval]=ttest2(a,b);
%is_seg=0, pval=0.1597
%is_seg=0, pval=0.1525
%is_seg=0, pval=0.5701
%1000 numbers:
a=randi(9,[1,1000]);
b=randi(10,[1,1000]);
[is_seg,pval]=ttest2(a,b);
%is_seg=1, pval=4.05e-5
%is_seg=1, pval=0.0014
%is_seg=1, pval=5.29e-7
%Increased total number of numbers in the two sets will increase the
%relationship between the two sets.
%When the number becomes 1000, it is hardly to see is-seg=0. The p value also 
%decreases as the total number increases.