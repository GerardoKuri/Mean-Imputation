clear all;
close all;
clc;
datosCrudos=transpose(xlsread('2020PM10.xls'));
%Datos faltantes=0
datosCrudos(datosCrudos==-99)=0;

%Imputación de datos por medio de media de clases
PEDPro=imputMedClas(datosCrudos(19,:));
SFEPro=imputMedClas(datosCrudos(22,:));
INNPro=imputMedClas(datosCrudos(14,:));
ATIPro=imputMedClas(datosCrudos(4,:));

%Normalización min max
PEDPro=minMax(PEDPro);
SFEPro=minMax(SFEPro);
INNPro=minMax(INNPro);
ATIPro=minMax(ATIPro);

figure(1)
subplot(411)
%SFE
lastVal = ceil(max(datosCrudos(22,:)));
plot(datosCrudos(22,:));
ylim([0 lastVal]);
title('SFE crudos');
xlabel('Tiempo(h)');
ylabel('Concentración(microg/m^3)');
subplot(412)
plot(SFEPro);
%ylim([0 200]);
title('SFE procesados');
xlabel('Tiempo(h)');
ylabel('Concentración(microg/m^3)');
subplot(413)
%INN
plot(datosCrudos(14,:));
lastVal = ceil(max(datosCrudos(14,:)));
ylim([0 lastVal]);
title('INN');
xlabel('Tiempo(h)');
ylabel('Concentración(microg/m^3)');
subplot(414)
plot(INNPro);
%ylim([0 200]);
title('INN procesados');
xlabel('Tiempo(h)');
ylabel('Concentración(microg/m^3)');

figure(2)
%PED
subplot(411)
lastVal = ceil(max(datosCrudos(19,:)));
plot(datosCrudos(19,:));
ylim([0 lastVal]);
title('PED');
xlabel('Tiempo(h)');
ylabel('Concentración(microg/m^3)');
subplot(412)
plot(PEDPro);
%ylim([0 200]);
title('PED procesados');
xlabel('Tiempo(h)');
ylabel('Concentración(microg/m^3)');
subplot(413)
%ATI
lastVal = ceil(max(datosCrudos(4,:)));
plot(datosCrudos(4,:));
ylim([0 lastVal]);
title('ATI');
xlabel('Tiempo(h)');
ylabel('Concentración(microg/m^3)');
subplot(414)
plot(ATIPro);
%ylim([0 200]);
title('ATI procesados');
xlabel('Tiempo(h)');
ylabel('Concentración(microg/m^3)');



SFE=datosCrudos(22,:);
SFE(SFE==0)=[];
INN=datosCrudos(14,:);
INN(INN==0)=[];
PED=datosCrudos(19,:);
PED(PED==0)=[];
ATI=datosCrudos(4,:);
ATI(ATI==0)=[];

binWidth = 2;
binWidthNorm=.01; 

figure(3)
subplot(221)
lastVal = ceil(max(SFE));
binWidth = lastVal/100;
binEdges = 0:binWidth:lastVal+1;
h = histogram(SFE,binEdges,'Normalization','pdf','FaceColor',[.9 .9 .9]);
%xlim([0 200]);
%ylim([0 0.05]);
title('SFE Crudo');
pd = fitdist(transpose(SFE),'Kernel');
xgrid = linspace(0,lastVal,1000)'; 
pdfEst = pdf(pd,xgrid);
line(xgrid,pdfEst,'Color','k','LineWidth',2);
subplot(222)
lastVal = ceil(max(SFEPro)); 
binWidth = lastVal/200;
binEdges = 0:binWidth:lastVal+.001;
h = histogram(SFEPro,binEdges,'Normalization','pdf','FaceColor',[.9 .9 .9]);
xlim([0 1.2]);
%ylim([0 0.05]);
title('SFE Procesados');
pd = fitdist(transpose(SFEPro),'Kernel');
xgrid = linspace(0,lastVal,1000)'; 
pdfEst = pdf(pd,xgrid);
line(xgrid,pdfEst,'Color','k','LineWidth',2);
subplot(223)
lastVal = ceil(max(INN)); 
binWidth = lastVal/100;
binEdges = 0:binWidth:lastVal+1;
h = histogram(INN,binEdges,'Normalization','pdf','FaceColor',[.9 .9 .9]);
title('INN crudo');
%xlim([0 200]);
%ylim([0 0.06]);
pd = fitdist((transpose(INN)),'Kernel');
xgrid = linspace(0,lastVal,1000)'; 
pdfEst = pdf(pd,xgrid);
line(xgrid,pdfEst,'Color','k','LineWidth',2);
subplot(224)
lastVal = ceil(max(INNPro)); 
binWidth = lastVal/200;
binEdges = 0:binWidth:lastVal+.001;
h = histogram(INNPro,binEdges,'Normalization','pdf','FaceColor',[.9 .9 .9]);
xlim([0 1.2]);
% %ylim([0 0.025]);
title('INN Procesados');
pd = fitdist(transpose(INNPro),'Kernel');
xgrid = linspace(0,lastVal,1000)'; 
pdfEst = pdf(pd,xgrid);
line(xgrid,pdfEst,'Color','k','LineWidth',2);

figure(4)
subplot(223)
lastVal = ceil(max(ATI)); 
binWidth = lastVal/100;
binEdges = 0:binWidth:lastVal+1;
h = histogram(ATI,binEdges,'Normalization','pdf','FaceColor',[.9 .9 .9]);
title('ATI crudo');
%xlim([0 200]);
%ylim([0 0.06]);
pd = fitdist(transpose(ATI),'Kernel');
xgrid = linspace(0,lastVal,1000)'; 
pdfEst = pdf(pd,xgrid);
line(xgrid,pdfEst,'Color','k','LineWidth',2);
subplot(224)
lastVal = ceil(max(ATIPro)); 
binWidth = lastVal/200;
binEdges = 0:binWidth:lastVal+.001;
h = histogram(ATIPro,binEdges,'Normalization','pdf','FaceColor',[.9 .9 .9]);
xlim([0 1.2]);
%ylim([0 0.025]);
title('ATI Procesados');
pd = fitdist(transpose(ATIPro),'Kernel');
xgrid = linspace(0,lastVal,1000)'; 
pdfEst = pdf(pd,xgrid);
line(xgrid,pdfEst,'Color','k','LineWidth',2);
subplot(221)
lastVal = ceil(max(PED)); 
binWidth = lastVal/100;
binEdges = 0:binWidth:lastVal+1;
h = histogram(PED,binEdges,'Normalization','pdf','FaceColor',[.9 .9 .9]);
title('PED crudo');
%xlim([0 200]);
%ylim([0 0.06]);
pd = fitdist(transpose(PED),'Kernel');
xgrid = linspace(0,lastVal,1000)'; 
pdfEst = pdf(pd,xgrid);
line(xgrid,pdfEst,'Color','k','LineWidth',2);
subplot(222)
lastVal = ceil(max(PEDPro)); 
binWidth = lastVal/200;
binEdges = 0:binWidth:lastVal+.001;
h = histogram(PEDPro,binEdges,'Normalization','pdf','FaceColor',[.9 .9 .9]);
xlim([0 1.2]);
%ylim([0 0.025]);
title('PED Procesados');
pd = fitdist(transpose(PEDPro),'Kernel');
xgrid = linspace(0,lastVal,100000)'; 
pdfEst = pdf(pd,xgrid);
line(xgrid,pdfEst,'Color','k','LineWidth',2);



