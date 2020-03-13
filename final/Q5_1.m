size=501;
Sample=zeros(size,1);
Sample((size+1)/2-(size-1)/20:(size+1)/2+(size-1)/20)=1;
lambda=630e-9;
k=2*pi/lambda;
a=100e-6;
d=500e-6;
z=50e-3;
x=linspace(d/2-a/2,d/2+a/2,size);
y=linspace(-d/2-a/2,-d/2+a/2,size);
x_=linspace(-10e-3,10e-3,size);
Efield=zeros(size,1);
for jj=1:size
    for ii=1:size
      r=sqrt((x(ii)-x_(jj))^2+z^2);
      u=exp(-1i*k.*(x(ii)^2)/2/z).*exp(1i*k*r)./r;
      Efield(jj)= Efield(jj)+ Sample(ii).*u;
    end
    for ii=1:size
      r=sqrt((y(ii)-x_(jj))^2+z^2);
      u=exp(-1i*k.*(y(ii)^2)/2/z).*exp(1i*k*r)./r;
      Efield(jj)= Efield(jj)+ Sample(ii).*u;
    end
end
plot(x_,abs(Efield).^2);