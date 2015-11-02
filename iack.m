figure;
showackley;
hold;
figure

contour(x,y,z,29);
hold;
s=[0.5 0.5]
plot(s(1),s(2),'*');
for i=1:10000,
    s=s-0.01*gradackley(s,0.1);
    plot(s(1),s(2),'*');
    pause;
    i,s,
end