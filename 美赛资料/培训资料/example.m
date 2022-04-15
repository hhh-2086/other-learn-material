% The example comes from Physica D 226(2007)197-208.

clear
clc
close
hold on
maxdelay=5.15;%时滞
step=0.1;%步长
for qw=1:1%没什么用
TT=[];%记录时间1*n矩阵
UU=[];%UU中存放最终所有计算的结果是一个2*n矩阵
u0=[];%存放初值2*1矩阵
lamda=1000; d=0.1; beta=0.002; a=5; p=0.05;c=0.2; b=0.3;
r1=[1000];r2=[10];r3=[10];
for t0=-maxdelay:step:0
    u0=[r1(qw);r2(qw);r3(qw)];%初值
    TT=[TT t0];
    UU=[UU u0];
end


u1=u0;%u1中暂存每一步计算的结果是一个2*1矩阵
T=5000;
for t=0:step:T
  
    delay=maxdelay;
   
    
    k1=[lamda-d*u1(1)-beta*u1(1)*u1(2);...
        beta*u1(1)*u1(2)-a*u1(2)-p*u1(2)*u1(3);...
        c*UU(2,fix((maxdelay+t-delay)/step+1))-b*u1(3)];
    k2=[lamda-d*(u1(1)+step/2*k1(1))-beta*(u1(1)+step/2*k1(1))*(u1(2)+step/2*k1(2));...
        beta*(u1(1)+step/2*k1(1))*(u1(2)+step/2*k1(2))-a*(u1(2)+step/2*k1(2))-p*(u1(2)+step/2*k1(2))*(u1(3)+step/2*k1(3));...
       c*(UU(2,fix((maxdelay+t-delay)/step+1))+step/2*k1(3))-b*(u1(3)+step/2*k1(3))];
    k3=[lamda-d*(u1(1)+step/2*k2(1))-beta*(u1(1)+step/2*k2(1))*(u1(2)+step/2*k2(2));...
        beta*(u1(1)+step/2*k2(1))*(u1(2)+step/2*k2(2))-a*(u1(2)+step/2*k2(2))-p*(u1(2)+step/2*k2(2))*(u1(3)+step/2*k2(3));...
       c*(UU(2,fix((maxdelay+t-delay)/step+1))+step/2*k2(3))-b*(u1(3)+step/2*k2(3))];
    k4=[lamda-d*(u1(1)+step*k3(1))-beta*(u1(1)+step*k3(1))*(u1(2)+step*k3(2));...
        beta*(u1(1)+step*k3(1))*(u1(2)+step*k3(2))-a*(u1(2)+step*k3(2))-p*(u1(2)+step*k3(2))*(u1(3)+step*k3(3));...
        c*(UU(2,fix((maxdelay+t-delay)/step+1))+step*k3(3))-b*(u1(3)+step*k3(3))];
    u1=u1+step/6*(k1+2*k2+2*k3+k4);
    
 
    TT=[TT t];
    UU=[UU u1];
    
end
figure(1)
plot3(UU(1,:),UU(2,:),UU(3,:));hold on;
xlabel('x','fontsize',19); ylabel('y','fontsize',19);zlabel('z','fontsize',19)

figure(2)
plot(TT(1,:),UU(1,:),TT(1,:),UU(2,:),TT(1,:),UU(3,:));hold on
legend('x','y','z')
 end

