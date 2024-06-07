disp("Task 8 Starting")
attMatrix = zeros(3,3);
for i = 1:1:3
    for j = 1:1:3
            attMatrix(i,j) = input(['Enter matrix value for ', num2str(i), '-', num2str(j), ': ']);
    end
end

%We'll just get the angle and rotation axis and then reconvert that to the quaternion
[e,v] = attMatrixExtraction(attMatrix)

q = [(e)*sin(v/2);cos(v/2)]


clear
disp("Task 8 Ending")

function [e,v] = attMatrixExtraction(A)
    tr = trace(A);
    v = acos((tr-1)/2);

    %now using the explicit form of the attitude matrix
    c = cos(v);

    e_1 = realify(sqrt((A(1,1)-c)/(1-c)));
    e_2 = realify(sqrt((A(2,2)-c)/(1-c)));
    e_3 = realify(sqrt((A(3,3)-c)/(1-c)));

    e = [e_1, e_2, e_3];
end

function q_real = realify(q)
    for i = 1:1:3
        q_real(i) = real(q(i));
    end
end