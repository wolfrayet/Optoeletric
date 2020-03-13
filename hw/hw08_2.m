lambda=500e-9;  % wavelength
n=1.4;          % refractive index
f=0.1;          % focal length (m)
x0=2e-6;        % spatial period (m)
k0=2*pi/lambda;  % spatial frequency
size=21;
x1=linspace(-20e-6,20e-6,size);

%y=abs((1-exp(-1i*k0*(2*x1./f-n)))./(1i*k0*(2*x1./f-n))).^2;
y=abs((-1 + exp(1i*8*pi/5)/2)*sinc(x1.*(k0*x0/(4*f))) + sinc(x1.*(k0*x0/(2*f)))).^2
plot(x1,y,'o');
title(['Intensity Distribution of Double Slits, period=',num2str(x0)]);
xlabel('Position on screen (m)');
ylabel('Intensity (V/m)');
