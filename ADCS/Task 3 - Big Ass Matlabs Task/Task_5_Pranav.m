disp("Task 5 Starting")


q_13 = zeros(3,1);
q_4 = 0;

for i =1:1:3
    axisElement= input(['Enter elements in q_1:3 vector, now element', num2str(i), ': ']);
    q_13(i) = axisElement;
end

q_4 = input("Enter the constant to the quaternion:  ");

q = [q_13;q_4];

disp("The cross matrix for the quaternion")
cross = quaternion_cross(q)
disp("The dot matrix for the quaternion")
dot = quaternion_dot(q)


disp("Task 5 Ending")
clear

function mat = cross_matrix(vector)
    mat = [
    0, -vector(3), vector(2);
    vector(3), 0, -vector(1);
    -vector(2), vector(1), 0
    ];
end

function mat = quaternion_cross(q)
    q_13 = [q(1);q(2);q(3)];
    q_4 = q(4);
    mat = [
        q_4*eye(3)-cross_matrix(q_13), q_13;
        -transpose(q_13), q_4
        ];
end

function mat = quaternion_dot(q)
    q_13 = [q(1);q(2);q(3)];
    q_4 = q(4);
    mat = [
        q(4)*eye(3)+cross_matrix(q_13), q_13;
        -transpose(q_13), q_4];
end
