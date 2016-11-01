function c = find_template_1D(t,s)
    c=normxcorr2(t,s);

    
s=[-1 0 0 1 1 1 0 -1 -1 0 1 0 0 -1];
t=[1 1 0];
disp('signal:'),disp([1:size(s,2);s]);
disp('template:'),disp([1:size(t,2);t]);

disp('c:'),disp(c);