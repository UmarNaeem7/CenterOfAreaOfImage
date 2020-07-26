function [r_center,c_center] = centerOfArea(image)
%Function to find center of Area of an image
%   Detailed explanation goes here
a = image;
area = areaOfImage(a);

[p,q,r] = size(a);

if r==3
    A = rgb2gray(a);
else
    A = a;
end

b = imbinarize(A,graythresh(A));

r_center = 0;
c_center = 0;

sum = 0;

for i=1:p
    for j=1:q
        if b(i,j) == 1
            sum = sum + 1;
        end
    end
    r_center = r_center + i*sum;
    sum = 0;
end

r_center = round(r_center/area);

for i=1:q
    for j=1:p
        if b(j,i) == 1
            sum = sum + 1;
        end
    end
    c_center = c_center + i*sum;
    sum = 0;
end

c_center = round(c_center/area);

end

