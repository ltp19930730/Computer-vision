function H = dlt( x, xt )
a=zeros(8,9);
for i = 1:4
    a(2*i-1,1:9)=[0 0 0 -x(i,1) -x(i,2) -1 xt(i,2)*x(i,1) xt(i,2)*x(i,2) xt(i,2)];
    a(2*i,1:9)=[x(i,1) x(i,2) 1 0 0 0 -xt(i,1)*x(i,1) -xt(i,1)*x(i,2) -xt(i,1)];
end
a(9,9)=1;

J= zeros(9,1);
J(9,1)= 1;
H=a^-1*J;
H=reshape(H,[3,3])';