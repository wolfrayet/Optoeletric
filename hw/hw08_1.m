% Huygens' Principle: 
% every single points can be treated as a new wave point source
% Parameters set up
size=401;       % the simulation point
lambda=500e-9;  % wavelength of the incident wave
d=200e-6;        % distance from slits to the screen

k=2*pi/lambda;  % wave number
x1=linspace(-20e-6,20e-6,size); % position of screen
x2=linspace(-8e-6,-4e-6,size);  % slit with width 4um
x3=linspace(0,8e-6,size);       % slit with width 8um
E=zeros(size,1);
% Calculate the interference and diffraction of double slits
for jj=1:size
    for ii=1:size
        r=sqrt((x1(jj)-x2(ii))^2+d^2); 
        E(jj)=E(jj) + exp(1i*k*r)./r;
    end
    for ii=1:size
        r=sqrt((x1(jj)-x3(ii))^2+d^2);
        E(jj)=E(jj) + exp(1i*k*r)./r;
    end
end
% plot the intensity distribution
plot(x1,abs(E).^2);
title(['Intensity Distribution of Double Slits, d=',num2str(d)]);
xlabel('Position on screen (m)');
ylabel('Intensity (V/m)');
