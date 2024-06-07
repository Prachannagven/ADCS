disp("Task 1 Starting")

%We know that when we input a vector x = x_1 + x_2 + x_3 (for i, j k), we can get a matrix out

vector = zeros(1,3);

%check command window to enter inputs
for i =1:1:3
    element_str = input(['Enter element ', num2str(i), ': ']);
    vector(i) = element_str;
end

disp("Printing cross product matrix")
cross_matrix = [
    0, -vector(3), vector(2);
    vector(3), 0, -vector(1);
    -vector(2), vector(1), 0
    ]
disp("Task 1 Done")
clear