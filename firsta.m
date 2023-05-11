%% пункт a
x=[2,5,7,1,6,2,5,3,0,1];
m=0;
for k=1:10
    m=m+ x(k);
end
m=m/10;% среднее значение
M=m*ones(1,10);
S= (x-M).^2;
b=0;
for k=1:10
    b=b+ S(k);
end
b= (b/(10-1))^0.5;% стандартное оклонение
%% пункт b
Y=rand(110);
i=0;
for k=1:110
    i=i+Y(k,k);
end
ii=0;
for k=1:110
    ii=ii+Y(k,111-k);
end
y=Y;
for k=1:110
    y(k,k)=Y(k,111-k);
end
v=zeros(11,11);
for k=1:10:109
    for p=1:10:109
        A=Y(k:k+9,p:p+9);
        v(fix(k/10)+1,fix(p/10)+1)=det(A);
    end
end
v
vdet = det(v);
ydet = det(Y);
%% пункт c
a=zeros(1,20);
a(1,1)=0;
a(1,2)=1;
for i=3:20
    a(1,i)=a(1,i-1)+a(1,i-2);
end
fprintf('%d\n',a);
%% пункт d
x=-pi/2:0.003:pi/2;
f = @(x)(((sin(0.1.*x)./x).*(sin(20*x)./sin(x))).^2);
y= f(x);
figure;
grid on;
hold on;
plot(x,y);
%% пункт e
[x, y] = meshgrid(-5:0.1:5,-5:0.1:5);

r = sqrt(x.^2+y.^2);
z = (besselj(1,0.5*r).^2)./(r.^2);

surf(x, y, z);
colorbar;
%% пункт f
z = 0:0.21:400;
t = sqrt(z);
t = [-t, t];
t = sort(t);
x = fresnelc(t);
y = fresnels(t);

figure; 
hold on; 
grid on; 
plot(x, y);
%% f'
t=-10*pi:0.02:10*pi;
plot(fresnelc(t),fresnels(t),'r','linewidth',2);
hold on;
plot(-fresnelc(t),-fresnels(t),'r','linewidth',2);
axis([-1 1 -1 1]);
axis square;
title('Спираль Корню');
xlabel('Fresnel C(x)');
ylabel('Fresnel S(x)');
grid on;
