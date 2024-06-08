disp("Beginning Task 9")
%I'm going to assume that we're doing a 1-2-3 rotation, which means rotate
%about 1 axis, the next, then the final different one. This results in our
%matrix:
%{
[
    cos(psi) * cos(theta) , sin(psi)*cos(phi) - cos(psi)*sin(theta)*cos(phi) , sin(psi)*sin(theta) - cos(psi)* sin(theta)*cos(phi) ;
    -sin(psi)* cos(theta) , cos(psi)*cos(phi) - sin(psi)*sin(theta)*sin(phi) , cos(psi)*sin(phi) + sin(psi)*sin(theta)*cos(phi) ;
    sin(theta)            ,    -cos(theta)*sin(phi)     , cos(theta)*cos(phi);
]
%}

disp("For a 1-2-3 rotation, please provide the following")
theta = input('Please enter the value of theta: ');
phi = input('Please enter the value of phi: ');
psi = input('Please enter the value of psi: ');

A = [
    cos(psi) * cos(theta) , sin(psi)*cos(phi) - cos(psi)*sin(theta)*cos(phi) , sin(psi)*sin(theta) - cos(psi)* sin(theta)*cos(phi) ;
    -sin(psi)* cos(theta) , cos(psi)*cos(phi) - sin(psi)*sin(theta)*sin(phi) , cos(psi)*sin(phi) + sin(psi)*sin(theta)*cos(phi) ;
    sin(theta)            ,    -cos(theta)*sin(phi)     , cos(theta)*cos(phi);
]

[e,v] = attMatrixExtraction(A);
q = [e*sin(v/2);cos(v)]

clear;
disp("Task 9 ended")

function [e,v] = attMatrixExtraction(A)
    tr = trace(A);
    v = acos((tr-1)/2);

    %now using the explicit form of the attitude matrix
    c = cos(v);

    e_1 = (sqrt((A(1,1)-c)/(1-c)));
    e_2 = (sqrt((A(2,2)-c)/(1-c)));
    e_3 = (sqrt((A(3,3)-c)/(1-c)));

    e = [e_1; e_2; e_3];
end