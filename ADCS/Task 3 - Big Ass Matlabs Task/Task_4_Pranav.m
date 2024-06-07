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
