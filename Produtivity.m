clearvars;clc;

min{1}=load('5050 ekf uvmin.txt');
min{2}=load('pro uvmin.txt');
min{3}=load('resin uvmin.txt');
min{4}=load('1 uvmin.txt');

ml{1}=load('5050 ekf uvml.txt');
ml{2}=load('pro uvml.txt');
ml{3}=load('resin uvml.txt');
ml{4}=load('1 uvml.txt');

min{4}(:,1)=min{4}(:,1)-min{4}(1,1);
ml{4}(:,1)=ml{4}(:,1)-ml{4}(1,1);
for i=1:length(min)
    min{i}(:,1)=min{i}(:,1)-min{i}(1,1);
    ml{i}(:,1)=ml{i}(:,1)-ml{i}(1,1);
end
%%%
C10=80;
for i=1:length(ml)
    [row_ml,~] = find(ml{i}(:,2)>C10 & ml{i}(:,2)<1.1*C10);
    V10(i)=ml{i}(row_ml(1),1);
    [row_t,~] = find(min{i}(:,2)>C10 & min{i}(:,2)<1.1*C10);
    t10(i)=min{i}(row_t(1),1);

    resin(i)=trapz(ml{i}(1:row_ml(1),1),1.4-ml{i}(1:row_ml(1),2)/530)/57;
%     sum=0;
%     for i=1:row_ml(1)
%         sum=sum+()
%     end
    Prod(i)=resin(i)/(t10(i)*(1-0.91));
    Prod_tot(i)=resin(i)/((t10(i)+4.2)*(1-0.91));
end
figure(1);
h=bar(Prod_tot);
% set(h, {'DisplayName'}, {'Jan','Feb','Mar'}')
set(gca,'XTickLabel',{'50/50','75/25','25/75','1 ml/min'});
title('Total Productivity')

figure(2);
h=bar(Prod);
set(gca,'XTickLabel',{'50/50','75/25','25/75','1 ml/min'});
title('Productivity')

figure(3);
h=bar(resin);
set(gca,'XTickLabel',{'50/50','75/25','25/75','1 ml/min'});
title('Resin Utilization')