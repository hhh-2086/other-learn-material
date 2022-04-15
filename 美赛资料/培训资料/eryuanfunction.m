% %绘制二元函数 z=x*exp(-x.^2-y.^2)
% 
% x=-2:0.1:2;
% y=-2:0.1:2;
% [X,Y]=meshgrid(x,y);%生成平面网格
% 
% z=X.*exp(-X.^2-Y.^2);%计算网格点的值
% mesh(X,Y,z);%绘制二元函数
% colormap([0 0 0]);%指定颜色



%绘制二元函数 z=sin(pi*x)*exp(-pi^2*t)

x=0:0.05:4;
t=0:0.05:6;
[X,T]=meshgrid(x,t);%生成平面网格

z=sin(pi*X).*exp(-T.*pi^2);%计算网格点的值
meshc(T,X,z);%绘制二元函数
colormap([0.1 0.2 0.5]);%指定颜色
