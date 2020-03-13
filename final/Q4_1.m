y=@(t) 4.*t.*exp(-t.^4);
x=@(t) 4.*t.*exp(-t.^4);
delta=0.0001;
tx=-10:delta:10; 
ty=-10:delta:10; 
%c=conv(y(ty),x(tx))*delta; %convolution
c=xcorr(x(tx))*delta; %autocorrelation
tc=(tx(1)+ty(1)):delta:(tx(end)+ty(end));
figure()
subplot(2,1,1)
plot(tx,x(tx));
xlabel('time'); title('f(t)'); ylim([min(x(tx))-1,max(x(tx))+1]); grid on
subplot(2,1,2)
plot(tc,c);
%convolution
%xlabel('time'); title('f(t)*f(t)');ylim([min(c)-1,max(c)+1]); grid on
%autocorrelation
xlabel('time'); title('f(t)•f(t)');ylim([min(c)-1,max(c)+1]); grid on