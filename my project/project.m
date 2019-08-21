
clc;
clear;
Time_H=[0 2 4 5 7 9 12 15 20 22 24];
PH=[7.6 7.2 7 6.5 7.5 7.2 8.9 9.1 8.9 7.9 7];
siqmacos=sum(cos((2*pi/24).*Time_H));
siqmacos2=sum(cos((2*pi/24).*Time_H).^2);
siqmayicos=sum(PH.*cos((2*pi/24).*Time_H));
siqmayisin=sum(sin((2*pi/24).*Time_H).*PH);
siqmasin2=sum(sin((2*pi/24).*Time_H).^2);
siqmasin=sum(sin((2*pi/24).*Time_H));
siqmasincos=sum(sin((2*pi/24).*Time_H).*cos((2*pi/24).*Time_H));
siqmayi=sum(PH);
Determinal=det([length(Time_H) siqmacos siqmasin
                  siqmacos siqmacos2 siqmasincos
                   siqmasin siqmasincos siqmasin2]);
a1=det([siqmayi siqmacos siqmasin
      siqmayicos siqmacos2 siqmasincos
      siqmayisin siqmasincos siqmasin2])/Determinal;

b1=det([length(Time_H) siqmayi siqmasin
       siqmacos siqmayicos siqmasincos
      siqmasin siqmayisin siqmasin2])/Determinal;

c1=det([length(Time_H) siqmacos siqmayi
       siqmacos siqmacos2 siqmayicos
       siqmasin siqmasincos siqmayisin])/Determinal;
S1=a1+b1*cos((2*pi/24).*Time_H)+c1*sin((2*pi/24).*Time_H);
e1=sum((S1-PH).^2);
siqmat1=sum(Time_H);
siqmat2=sum(Time_H.^2);
siqmat3=sum(Time_H.^3);
siqmat4=sum(Time_H.^4);
siqmat5=sum(Time_H.^5);
siqmat6=sum(Time_H.^6);
siqmayi=sum(PH);
siqmayit1=sum(PH.*Time_H);
siqmayit2=sum(PH.*(Time_H.^2));
siqmayit3=sum(PH.*(Time_H.^3));
Determinal=det([siqmat6 siqmat5 siqmat4 siqmat3
    siqmat5 siqmat4 siqmat3 siqmat2
    siqmat4 siqmat3 siqmat2 siqmat1
    siqmat3 siqmat2 siqmat1 length(Time_H)]);
a2=det([siqmayit3 siqmat5 siqmat4 siqmat3
    siqmayit2 siqmat4 siqmat3 siqmat2
    siqmayit1 siqmat3 siqmat2 siqmat1
    siqmayi siqmat2 siqmat1 length(Time_H)])/Determinal;
b2=det([siqmat6 siqmayit3 siqmat4 siqmat3
    siqmat5 siqmayit2 siqmat3 siqmat2
    siqmat4 siqmayit1 siqmat2 siqmat1
    siqmat3 siqmayi siqmat1 length(Time_H)])/Determinal;
c2=det([siqmat6 siqmat5 siqmayit3 siqmat3
    siqmat5 siqmat4 siqmayit2 siqmat2
    siqmat4 siqmat3 siqmayit1 siqmat1
    siqmat3 siqmat2 siqmayi length(Time_H)])/Determinal;
d2=det([siqmat6 siqmat5 siqmat4 siqmayit3
    siqmat5 siqmat4 siqmat3 siqmayit2
    siqmat4 siqmat3 siqmat2 siqmayit1
    siqmat3 siqmat2 siqmat1 siqmayi])/Determinal;
S2=a2*Time_H.^3+b2*Time_H.^2+c2.*Time_H+d2;
e2=sum((S2-PH).^2);
format long e;
disp 'Error exp1';
disp(e1);
disp 'Error exp2';
disp(e2);
plot(Time_H,PH,'.');
axis([0 30 5 12]);
hold on;
if e2>e1
     disp 'Exp 1 is better';
    x=0:0.01:30;
    y=a1+b1*cos((2*pi/24).*x)+c1*sin((2*pi/24).*x);
    plot(x,y,'c');
else
    disp 'Exp 2 is better';
    x=0:0.01:30;
    y=a2*x.^3+b2*x.^2+c2.*x+d2;
    plot(x,y,'c');  
end