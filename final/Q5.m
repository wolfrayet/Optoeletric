% some parameters
size=2001;
lambda=630e-9;
F=50e-3;
a=100e-6;
d=500e-6;
k=2*pi/lambda;
delta=0.01;

u0=@(x) exp(-1i*k*(x.^2)/2./F);
u1=@(x,x1) exp(1i*k.*sqrt((x-x1).^2+F^2))/sqrt((x-x1).^2+F^2);
dx=d/2-a/2:delta:d/2+a/2;
dy=-d/2-a/2:delta:-d/2+a/2;
dx1=-10:delta:10;

E=zeros(size,1);

for dx1=1:size
    E(dx1)=0;
    for dx=1:size
        local=u0(d/2-a/2+dx*delta).*u1(d/2-a/2+dx*delta,-10+dx1*delta)*delta;
        E(dx1)=E(dx1)+local;
    end
end
figure();
plot(dx1,abs(E).^2);
