function Lorenzeplot
x0=[-8 8 27];
tspan=[0,20];
[t,x]=ode45(@lorenz,tspan,x0)
figure(1)
plot3(x(:,3),x(:,1),x(:,2));
figure(2)
plot(x(:,1),x(:,3));
figure(3)
subplot(3,1,1)
plot(t,x(:,1))
subplot(3,1,2)
plot(t,x(:,2))
subplot(3,1,3)
plot(t,x(:,3))
end

function xprime=lorenz(t,x);
%LORENZ: Computes the derivatives involved in solving the
%Lorenz equations.
sig=10;
beta=8/3;
rho=28;
xprime=[-sig*x(1) + sig*x(2); rho*x(1) - x(2) - x(1)*x(3); -beta*x(3) + x(1)*x(2)];
end