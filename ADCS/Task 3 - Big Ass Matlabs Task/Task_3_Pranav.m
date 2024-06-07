disp("Task 3 Starting")

%We use the fact that the trace of a rotation matrix is 1+2cos(theta)
%[https://math.stackexchange.com/questions/3510272/why-should-the-trace-of-a-3d-rotation-matrix-have-these-properties]

A = zeros(3,3);
for i = 1:1:3
    for j = 1:1:3
        A(i,j) = input(['Enter matrix value for', num2str(i), num2str(j)]);
    end
end

[e,v] = attMatrixExtraction(A)

clear

disp("Task 3 Ending")

function [e,v] = attMatrixExtraction(A)
    tr = trace(A);
    v = acos((tr-1)/2);

    %now using the explicit form of the attitude matrix
    c = cos(v);

    e_1 = sqrt((A(1,1)-c)/(1-c));
    e_2 = sqrt((A(2,2)-c)/(1-c));
    e_3 = sqrt((A(3,3)-c)/(1-c));

    e = [e_1, e_2, e_3];
end
