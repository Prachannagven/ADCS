disp("Task 6 Starting")


q_13 = zeros(3,1);
q_4 = 0;

for i =1:1:3
    axisElement= input(['Enter elements in q_1:3 vector, now element', num2str(i), ': ']);
    q_13(i) = axisElement;
end

q_4 = input("Enter the constant to the quaternion:  ");

q = [q_13;q_4]
q_conj = [-q_13;q_4];

q_inv = (1/abs(norm(q)))*q_conj

clear
disp("Task 6 Done")