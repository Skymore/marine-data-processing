close all;
clear all;
clc;
x = ncread('levitus_climatology.cdf','XAXLEVITR');
y = ncread('levitus_climatology.cdf','YAXLEVITR');
z = ncread('levitus_climatology.cdf','ZAXLEVITR');
sst = ncread('levitus_climatology.cdf','TEMP');
figure(1)
contourf(x,y,sst(:,:,1)','showText','on');
colorbar;
name = 'SST';
title(name);
saveas(gcf,name,'fig');
figure(2)
sstChidao = (sst(:,89,:) + sst(:,90,:)) / 2.0;
sstChidao2 = squeeze(sstChidao);
contourf(x,-z,sstChidao2','showText','off');
hold on;
contour(x,-z,sstChidao2','LevelList',[28.0],'LineWidth',2,'color' , 'green');
colorbar;
name = 'Chidao';
title(name);
saveas(gcf,name,'fig');

clear all;
close all;