%n = 2^10;                 % size of mask
%M = zeros(n);
%I = 1:n; 
%x = I-n/2;                % mask x-coordinates 
%y = n/2-I;                % mask y-coordinates
%[X,Y] = meshgrid(x,y);    % create 2-D mask grid
%R = 10;
%A = ((X).^2 + Y.^2 <= R^2); % circular aperture of radius R
%M(A) = 1;                 % set mask elements inside aperture to 1
%imagesc(M)                % plot mask
%axis image
%DP = fftshift(fft2(M));
%imagesc(abs(DP))
%axis image
clc
close all
clear all

%------------------------------------------------------------------------

lambda=630e-9; k=(2*pi)/lambda; % wavelength of light in vaccuum
a=100e-6;  % radius of diffracting circular aperture
d=500e-6;
Io=100.0; % relative intensity
R=50e-3; % distance of screen from aperture
Y=(-0.25e-2:1e-5:0.25e-2); Z=Y ; % coordinates of the screen
I(1:length(Y),1:length(Z))=0;

 % calculating diffracted intensity

for i=1:length(Y)
    for j=1:length(Z)
        q=((Y(i)-d/2).^2+Z(j).^2).^0.5;
        beta=k*a*q/R;
        %u=exp(-1i*k*(y.^2)./2/R;
        I(i,j)=Io.*((besselj(1,beta)/beta).^2);
    end
    for j=1:length(Z)
        q=((Y(i)+d/2).^2+Z(j).^2).^0.5;
        beta=k*a*q/R;
        I(i,j)=I(i,j)+Io.*((besselj(1,beta)/beta).^2);
    end
end

%------------------------------------------------------------------------
   
 figure(1)
 imshow(I)
 title('Fraunhofer Diffraction of circular aperture','fontsize',14)
 fh = figure(1);
 set(fh, 'color', 'white'); 