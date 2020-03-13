lambda=500e-9;
k=2*pi/lambda;
F=0.1;
p=5e-6;
a=1e-3;
x0=1.6;
size=501;
x=linspace(-0.5,0.5,size);
xt=linspace(-0.5,0.5,size);
delta=1/(size-1);
E=zeros(size,1);
U=zeros(size,1);
% for t1------------------------------------------
%t=linspace(-0.5,0.5,size); 
%y1=tripuls(t,p/4);
% for t3------------------------------------------
%t=linspace(-0.5,0.5,size);                         %                                          %
%y3=rectpuls(t,p/2);
%--------------------------------------------------
for jj=1:size
    E(jj)=0;
    for ii=1:size
        %t=y1(ii);
        t=1+exp(1i*k*x(ii)/p)/2+exp(-1i*k*x(ii)/p)/2; %t2
        %t=y3(ii); %t3
        local=t*exp(1i*k*x(ii)*xt(jj)/F);
        E(jj)=E(jj)+local*delta;
    end
end
for jj=1:size
    U(jj)=0;
    for ii=1:size
        if x(ii)>=0
            t=E(ii).*exp(1i*k*x(ii)*xt(jj)/F); % tc
            %t=exp(1i*pi)*E(ii).*exp(1i*k*x(ii)*xt(jj)/F); %td
            U(jj)=U(jj)+t*delta;
        end
        %if abs(x(ii)-x0)<a/2 & abs(x(ii)+x0)<a/2
        %   t=E(ii).*exp(1i*k*x(ii)*xt(jj)/F); %tb
        %   U(jj)=U(jj)+t*delta;
        %end
    end
end
plot(xt,abs(U).^2);