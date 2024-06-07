disp("Beginning Task 2")

%Let the axis of rotation e = e1 + e2 + e3, we'll first take the input
vector = zeros(1,3);

for i =1:1:3
    axisElement= input(['Enter element of attitude matrix ', num2str(i), ': ']);
    vector(i) = axisElement;
end

%We'll convert the vector into the cross matrix for use in the next formula
cross_matrix = [
    0, -vector(3), vector(2);
    vector(3), 0, -vector(1);
    -vector(2), vector(1), 0
    ];

%now get the angle of rotation
rotAngle = input("Enter rotation angle: ");

%Rather than using the explicit form, we'll use the A(e,v) = cos(v)*I3 -
%sin(v) e_cross_matrix .... thingamajig 

A = cos(rotAngle)*eye(3) + sin(rotAngle)*cross_matrix + (1-cos(rotAngle))*(cross_matrix)^2

disp("Task 2 Complete")
clear

