%% Jenny Qiu Optimization Assignment 2
%% Problem 1
load ('a2p1','-mat')
n = 35; m =100; 
ub = 0.00001*ones(100,1);
ub(23)=9999;
[x fval] = linprog(c,[],[],a,b,zeros(100,1),ub);
display(x(23))
display(fval)


[x2 fval2] = linprog(c,[],[],a,b,zeros(100,1),ub);
display(x2)
display(fval2)
ub2=ub;
ub2(4)=ub2(23);
ub2(12)=ub2(23);
[x3 fval3] = linprog(c,[],[],a,b,zeros(100,1),ub2);
display(x3)
display(fval3)
%% Problem 2a - infinity norm
n = 35; m =100; 
aa = a'; bb = c';
Aeq = [aa -ones(m,1);-aa -ones(m,1)];
Beq = [bb;-bb];
A = [aa zeros(m,1)];
B = [b; zeros(m-n,1)];
f = [zeros(1,n), 1];
[xb fvalb]=linprog(f,Aeq,Beq,[],[]);

%% Problem 2b - l1  norm
aa = a'; bb = c';
Aeq = [aa -eye(m, m);-aa -eye(m,m)];
Beq = [bb;-bb];
A = [aa zeros(m)];
B = [b; zeros(m-n,1)];
f = [zeros(1,n), ones(1,m)];
[xb2 fvalb2]=linprog(f,Aeq,Beq,[],[])

%% Problem 2c - l2 norm
aa = a'; bb = c';
x_l2 = aa'*((aa*aa')\ bb);
fval = norm((aa*x_l2)-bb)

%% Problem 2d - sum norms
aa = a'; bb = c';
Aeq = [aa -eye(m) zeros(m,1);...
       -aa -eye(m) zeros(m,1);...
       zeros(m,n) eye(m) -ones(m,1)];
beq = [bb; -bb; zeros(m,1)];
f = [zeros(1,n), ones(1,m) 1];
[xsum, fsum] = linprog(f,Aeq,beq,[],[])

%% Problem 3 maxflow
Aeq = [1 0 -1 -1 0 0 0 0; 0 1 0 0 -1 -1 0 0; ...
    0 0 1 0 1 0 -1 0; 0 0 0 1 0 1 0 -1];
Beq = zeros(1,4);
A = eye(8);
B = [13;12; 5; 1; 7; 1; 6; 4];
f = [-1 -1 0 0 0 0 0 0];
[xmax, fvalmax] = linprog(f,A,B,Aeq,Beq,zeros(1,8),7*ones(1,8))
%% Problem 4 duality
Aeq = [1 0 -1 -1 0 0 0 0; 0 1 0 0 -1 -1 0 0; ...
    0 0 1 0 1 0 -1 0; 0 0 0 1 0 1 0 -1];
Beq = zeros(1,4);
c = f';


%% Problem 5  three sets
%constraint equality
a = [1 1 1 0 0 0 0 0 0];
b = [0 0 0 1 1 1 0 0 0];
c = [0 0 0 0 0 0 1 1 1];

gfun = @myfun;

f= @(x) norm(a-b,2).^2+norm(c-b,2).^2+norm(a-c,2)^2;
x0 = [-2 1 0 1 2 1 0 0 0];
[x,fval,exitflag,output] = fmincon(f,x0,[],[],[],[],[],[],gfun)
