disp("Start")

%%Constants
R_e = 6.6371e6;
M_e = 5.972e24;
G = 6.6741e-11;
alt = 5e6;

%Setup
dt = 1;
tStart = 0;
tStop = 24000;
tSpan = tStart:dt:tStop;

%Initial Conditions
x0 = [
    5200;
    R_e + alt;
    0;
    sqrt(G*M_e/(R_e+alt)); %centripetal force
    2500;
    5500/;
];

C = [
    M_e;
    G;
];


%solving ODE
options = odeset('RelTol', 1e-10, 'AbsTol', 1e-10*(ones(1,6)));
[t, x] = ode45(@(t,x)oneBody(t,x,C), tSpan, x0, options);

%Visualization
figure;
comet3(x(:, 1), x(:, 2), x(:,3))



disp("Stop")