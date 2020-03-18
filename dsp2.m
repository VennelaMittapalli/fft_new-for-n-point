%N POINT DFT
clc;
clear all;
close all;
x=input("Enter the sequence");
N=input("Enter the no of dft points");
st=log2(N);
l=(1:N);
v=bitrevorder(l);
n=1;
for i=1:N/2
    f(n)=x(v(n))+x(v(n+1));
    n=n+1;
    f(n)=x(v(n-1))-x(v(n));
    n=n+1;
end
for s=1:st-1
    l=2^s;
    n=0:l-1;
    if length(n)<N
        for k=1:(st-1)
            n=[n,n];
        end
    end
    z=[];
    for i=1:N
        l=n(i);
        u=2^(s+1);
        z(i)=exp(-1i*2*pi*l/u);
    end
    b=2^s;
    l=2^(st-s-1);
    ni=1;
    h=[];
    o=0
    for i=1:l
        for j=1:2^(s)
            h(ni)=f(ni)+z(ni)*f(ni+b);
            h(ni+b)=f(ni)-z(ni+b)*f(ni+b);
            ni=ni+1;
        end
        o=o+1;
        ni=2*o*b+1;
    end
    f=h;
end  
disp(f);
            
        