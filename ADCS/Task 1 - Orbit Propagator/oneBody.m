function [dx] = oneBody(t,x,C);

%{
We're going to define what each of the values in the function mean
x(1) = x
x(2) = y
x(3) = z
x(4) = x'
x(5) = y'
x(6) = z'

C(1) = Mass of earth (M_e)
C(2) = Gravitatinonal constants (G)
%}

r_magnitude = sqrt((x(1))^2 + (x(2))^2 + (x(3))^2);

r_x = x(1)/r_magnitude;
r_y = x(2)/r_magnitude;
r_z = x(3)/r_magnitude;

F = -C(2)*C(1)/(r_magnitude^2);

dx = [
    x(4);
    x(5);
    x(6);
    F*r_x;
    F*r_y;
    F*r_z;
];