x = [-5:0.1:5]; y =x;
for i = 1:101, for j = 1:101, z(i,j) = ackley([x(i) y(j)]); end; end
mesh(x,y,z)
