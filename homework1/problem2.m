c=imread('basketball-court.ppm'); 
imshow(c); 
height=940; 
width=500; 
result = zeros(height,width,3,'uint8'); 


%point for the result img
a11 = [1 1];
a12 = [width 1];
a13 = [1 height];
a14 = [width height];

%point for the origin img
b21 = [249 53];
b22 = [404 75];
b23 = [25 195];
b24 = [281 280];
x = [a11; a12; a13; a14];
xt = [b21; b22; b23; b24];

%calling the direct linear transformation to generate the h
h=dlt(x,xt);


%using bilinear interpolation to decide the pixel
for i=1:height 
    for j=1:width 
        t = [(h(1,1)*j+h(1,2)*i+h(1,3))/(h(3,1)*j+h(3,2)*i+h(3,3)) (h(2,1)*j+h(2,2)*i+h(2,3))/(h(3,1)*j+h(3,2)*i+h(3,3))]; 
        a = t(1)-floor(t(1)); 
        b = t(2)-floor(t(2)); 
        ft1 =floor(t(1)); 
        ft2 = floor(t(2)); 
        result(i,j,:) = c(ft2,ft1,:)*(1-a)*(1-b)+c(ft2,ft1+1,:)*(a)*(1-b)+c(ft2+1,ft1,:)*b*(1-a)+c(ft2+1,ft1+1,:)*a*b; 
    end 
end 

%rectangle
a11 = [200 540]; 
a12 = [1 540]; 
a13 = [200 939]; 
a14 = [1 939]; 
%match rectangle 
b21 = [300 540]; 
b22 = [499 540]; 
b23 = [300 939]; 
b24 = [499 939]; 
x = [a11; a12; a13; a14]; 
xt = [b21; b22; b23; b24];

h =dlt(x,xt);
%using bilinear interpolation again
for i=540:939 
    for j=1:200 
        t = [(h(1,1)*j+h(1,2)*i+h(1,3))/(h(3,1)*j+h(3,2)*i+h(3,3)) (h(2,1)*j+h(2,2)*i+h(2,3))/(h(3,1)*j+h(3,2)*i+h(3,3))]; 
        a = t(1)-floor(t(1)); 
        b = t(2)-floor(t(2)); 
        ft1 =floor(t(1)); 
        ft2 = floor(t(2)); 
        result(i,j,:) = output(ft2,ft1,:)*(1-a)*(1-b)+output(ft2,ft1+1,:)*(a)*(1-b)+output(ft2+1,ft1,:)*b*(1-a)+output(ft2+1,ft1+1,:)*a*b; 
    end 
end 

figure,imshow(result); 
imwrite(result,'problem2.jpg') 
