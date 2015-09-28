close all;
clear all;
clc;
%%
%ncdisp('E:\data\sst.mnmean.nc');
lon = ncread('C:\exam\er_sst.mnmean.nc','lon');
lat = ncread('C:\exam\er_sst.mnmean.nc','lat');
time = ncread('C:\exam\er_sst.mnmean.nc','time');
sst = ncread('C:\exam\er_sst.mnmean.nc','sst');

tStart = 1273; %1960?��1??
tEnd = 1787; %2012?��5??
tSum = tEnd-tStart+1;   %????��??????��??????
sstSum = zeros(180,89,12);  %1960?��???��????SST?��??
sstMean = zeros(180,89,12); %1960?��???��????SST???��SSTA = zeros(180,89,12,tSum);
yearSum = zeros(1,12);      %???????????????????��??
SSTA = zeros(180,89,tSum);  %?????��???��????t=1 -->1960?��1??


for month = 1:12;
    for j = tStart-1 + month: 12: tEnd;
        sstSum(:,:,month) = sstSum(:,:,month) + sst(:,:,j);
        yearSum(1,month) = yearSum(1,month) + 1;
    end;
    sstMean(:,:,month) = sstSum(:,:,month) / yearSum(1,month);
end;

for month = 1:12
    for j = tStart-1 +month: 12: tEnd;
        SSTA(:,:,j-tStart+1) = sst(:,:,j) - sstMean(:,:,month);
    end
end

save sstMean;
ncid=netcdf.create('SSTC.nc','NC_NOCLOBBER');
dimidx=netcdf.defDim(ncid,'lon',180);
dimidy=netcdf.defDim(ncid,'lat',89);
dimidt=netcdf.defDim(ncid,'time',12);
varid=netcdf.defVar(ncid,'sstc','double',[dimidx dimidy dimidt]);
netcdf.endDef(ncid);
netcdf.putVar(ncid,varid,sstMean);
netcdf.close(ncid);
save SSTA;
ncid=netcdf.create('SSTA.nc','NC_NOCLOBBER');
dimidx=netcdf.defDim(ncid,'lon',180);
dimidy=netcdf.defDim(ncid,'lat',89);
dimidt=netcdf.defDim(ncid,'time',515);
varid=netcdf.defVar(ncid,'ssta','double',[dimidx dimidy dimidt]);
netcdf.endDef(ncid);
netcdf.putVar(ncid,varid,SSTA);
netcdf.close(ncid);
% close all;