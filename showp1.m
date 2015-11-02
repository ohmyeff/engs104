clear
x = [-5:0.1:5]; y = x;
n = length(x);
for i = 1:n, for j = 1:n, z(i,j) = problemone([x(i) y(j)]); end; end
mesh(x,y,z)
figure
contour(x,y,z,100);
hold;
s=[1 2]
plot(s(1),s(2),'*');
for i=1:1000,
    s=s-0.0001*gradone(s,0.1);
    plot(s(1),s(2),'*');
    pause;
    i,s,
end

%%
s=[1 1]
plot(s(1),s(2),'*');
for i=1:1000,    
    s=s-0.01*(pinv(HessAckley(s,0.01))*gradone(s,0.01)')';
    plot(s(1),s(2),'*');
    pause;
    i,s,
end