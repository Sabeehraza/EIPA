
clear all;
close all;
 
set(0,'DefaultFigureWindowStyle','docked')
nx=50;
ny=50;
G=sparse(nx*ny,nx*ny);
 
% sparse G matrix (ELEC 4506 code used here a little )
 
for i=1:nx
for j=1:ny
x=j+(i-1)*ny;
if i==1 || j==1 || i==nx || j==ny
G(x,:)=0;
G(x,x)=1;
else
G(x,x)=-4;
G(x,x+1)=1;
G(x,x-1)=1;
G(x,x+ny)=1;
G(x,x-ny)=1;
end
end
end
 
figure('name', 'Spy(G)');
spy(G)
 


V=zeros(nx,ny);
value=9;
[E,D] = eigs(G,9,'SM');
figure('name','EV');
plot(diag(D),'o');
 
figure('name','Values');
for q = 1:value
M=E(:,q);
for i=1:nx
for j=1:ny
x=j+(i-1)*ny;
V(i,j)=M(x);
end
subplot(3,3,q);
surf(V);
title(['EV = ' num2str(D(q,q))])
end
end