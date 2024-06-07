disp("Beginning Task 4")

%Let the axis of rotation e = e1 + e2 + e3, we'll first take the input
vector = zeros(3,1);

for i =1:1:3
    axisElement= input(['Enter element of attitude matrix ', num2str(i), ': ']);
    vector(i) = axisElement;
end

%now get the angle of rotation
rotAngle = input("Enter rotation angle: ");

%Getting our quaternion form
q = [vector*sin(rotAngle/2);cos(rotAngle)]

%Now setting attitude matrix
q_13 = [q(1);q(2);q(3)];
A = (q(4)-abs(norm(q_13)))*eye(3) - 2*q(4)*cross_matrix(q_13) + 2*q_13*transpose(q_13)


function mat = cross_matrix(vector)
    mat = [
    0, -vector(3), vector(2);
    vector(3), 0, -vector(1);
    -vector(2), vector(1), 0
    ];
end

