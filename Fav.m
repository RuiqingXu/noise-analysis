A=zeros(121,3);
i=1;
for P=0:0.1:1;
for Pa=0:0.1:1;
    F=@(theta,b) 1./2.*(cos(theta).^4.*(1+sqrt(1-P))+2.*cos(theta).^2.*sin(theta).^2.*exp(1i.*2.*b).*sqrt(1-P).*sqrt(1-Pa)...
           +2.*cos(theta).^2.*sin(theta).^2.*sqrt(1-P).*sqrt(1-Pa)+sin(theta).^4.*exp(1i.*2.*b).*(1+sqrt(1-P))).*sin(theta).*(1./(4.*pi));
    r=integral2(F,0,pi,0,2*pi);
    A(i,1)=P;
    A(i,2)=Pa;
    A(i,3)=r;
    i=i+1;
end
end
%% 绘制图像
x=A(:,1);y=A(:,2);z=A(:,3); 
[X,Y,Z]=griddata(x,y,z,linspace(min(x),max(x))',linspace(min(y),max(y)),'v4');%插值 
figure;pcolor(X,Y,abs(Z));shading interp %伪彩色图 
figure,contourf(X,Y,abs(Z)) %等高线图
figure,mesh(X,Y,abs(Z))%三维曲面
xlim([0,1]);
ylim([0,1]);
zlim([0,1]);