% clear
% clc
% close
step=0.01;%步长
TT=[];
UU=[];
T=20;
u=[1;2;3;2;1];
a=10;b=8/3;c=28;
k=0;kk=1;alpha=-3;   gain1=-1.1;gain2=-1.1;
for t=0:step:T  
    k1=[a*(u(2)-u(1));c*u(1)-u(2)-u(1)*u(3);u(1)*u(2)-b*u(3);a*(u(5)-u(4));c*u(4)-u(5)-u(4)*u(3)];
    k2=[a*(u(2)-u(1)+step/2*k1(2)-step/2*k1(1));c*(u(1)+step/2*k1(1))-u(2)-step/2*k1(2)-(u(1)+step/2*k1(1))*(u(3)+step/2*k1(3));(u(1)+step/2*k1(1))*(u(2)+step/2*k1(2))-b*(u(3)+step/2*k1(3));
    a*(u(5)-u(4)+step/2*k1(5)-step/2*k1(4));c*(u(4)+step/2*k1(4))-u(5)-step/2*k1(5)-(u(4)+step/2*k1(4))*(u(3)+step/2*k1(3))];
    k3=[a*(u(2)-u(1)+step/2*k2(2)-step/2*k2(1));c*(u(1)+step/2*k2(1))-u(2)-step/2*k2(2)-(u(1)+step/2*k2(1))*(u(3)+step/2*k2(3));(u(1)+step/2*k2(1))*(u(2)+step/2*k2(2))-b*(u(3)+step/2*k2(3));
    a*(u(5)-u(4)+step/2*k2(5)-step/2*k2(4));c*(u(4)+step/2*k2(4))-u(5)-step/2*k2(5)-(u(4)+step/2*k2(4))*(u(3)+step/2*k2(3))];
    k4=[a*(u(2)-u(1)+step*k3(2)-step*k3(1));c*(u(1)+step*k3(1))-u(2)-step*k3(2)-(u(1)+step*k3(1))*(u(3)+step*k3(3));(u(1)+step*k3(1))*(u(2)+step*k3(2))-b*(u(3)+step*k3(3));
    a*(u(5)-u(4)+step*k3(5)-step*k3(4));c*(u(4)+step*k3(4))-u(5)-step*k3(5)-(u(4)+step*k3(4))*(u(3)+step*k3(3))];    
  
    u=u+step/6*(k1+2*k2+2*k3+k4);
 
    if k==kk*15 %调节大dela
        u(1)=u(1);u(2)=u(2);u(3)=u(3);
        u(4)=u(4)+gain1*(u(4)-alpha*u(1));
        u(5)=u(5)+gain2*(u(5)-alpha*u(2));
        kk=kk+1;
    end
    k=k+1;
    TT=[TT t];
    UU=[UU u];
end


e1=UU(4,:)-alpha*UU(1,:);
e2=UU(5,:)-alpha*UU(2,:);

figure(1)
 plot(TT(1,:),e1,TT(1,:),e2,'r-.');
axis([0 1 -20 50])
 xlabel('Time'); ylabel('Projective synchronization Errors')
 legend('e_1','e_2')
 hold on 
 
  figure(2)
 plot(TT(1,:),UU(4,:)./UU(1,:),TT(1,:),UU(5,:)./UU(2,:),'r-.');
 axis([0 1 -4 2])
  xlabel('Time'); ylabel('Scaling factor')
   legend('\alpha_1','\alpha_2')
 hold on 

