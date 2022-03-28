clearvars;clc;
displ={'-b','-k','-r','-g','-m','--b','--k','--r','--g','--m'};
% displ={'','-k','-r','-g','-m','','--k','--r','--g','--m'};
min{1}=load('5050 uvmin.txt');
min{2}=load('5050 ekf uvmin.txt');
min{3}=load('pro uvmin.txt');
min{4}=load('resin uvmin.txt');
min{5}=load('1 uvmin.txt');
min_vel{1}=load('5050 velmin.txt');
min_vel{2}=load('5050 ekf velmin.txt');
% min_vel{3}=load('pro velmin.txt');
min_vell=load('pro velmin.txt');
min_vel{3}(1:210,:)=min_vell(1:210,:);
min_vel{4}=load('resin velmin.txt');

ml{1}=load('5050 uvml.txt');
ml{2}=load('5050 ekf uvml.txt');
ml{3}=load('pro uvml.txt');
ml{4}=load('resin uvml.txt');
ml{5}=load('1 uvml.txt');
ml_vel{1}=load('5050 velml.txt');
ml_vel{2}=load('5050 ekf velml.txt');
ml_vel{3}=load('pro velml.txt');
ml_vel{4}=load('resin velml.txt');

min{5}(:,1)=min{5}(:,1)-min{5}(1,1);
ml{5}(:,1)=ml{5}(:,1)-ml{5}(1,1);
for i=1:length(min_vel)
    min{i}(:,1)=min{i}(:,1)-min{i}(1,1);
    min_vel{i}(:,1)=min_vel{i}(:,1)-min_vel{i}(1,1);
    ml{i}(:,1)=ml{i}(:,1)-ml{i}(1,1);
    ml_vel{i}(:,1)=ml_vel{i}(:,1)-ml_vel{i}(1,1);
end

%%
figure(1);hold on;
yyaxis right;
for i=2:length(min_vel)
    p{i}=plot(min{i}(:,1),min{i}(:,2)/760,displ{i});
end
p{i+1}=plot(min{5}(:,1),min{5}(:,2)/760,displ{5});
ylabel('C/C_{F}')
xlabel('Time (minutes)');
ylim([0 1.2])
yyaxis left;hold on
for i=2:length(min_vel)
    d{i}=plot(min_vel{i}(:,1),min_vel{i}(:,2),displ{i+5});
end
d{i+1}=plot(min{5}(:,1),ones(length(min{5}(:,1)),1),displ{10});
ylabel('Flow rate (ml/min)')

legend([p{2:2+3}],'w_1=0.5     w_2=0.5','w_1=0.75   w_2=0.25','w_1=0.25   w_2=0.75','R_t=1 ml/min');
title(['J(\Theta)=W_1*Pr+W_2*RU']);
legend boxoff 
box on
%%
figure(2);hold on;
yyaxis right;
for i=2:length(min_vel)
    p{i}=plot(ml{i}(:,1),ml{i}(:,2)/760,displ{i});
end
p{i+1}=plot(ml{5}(:,1),ml{5}(:,2)/760,displ{5});
ylabel('C/C_{F}')
xlabel('Volume (ml)');
ylim([0 1.2])
yyaxis left;hold on
for i=2:length(min_vel)
    d{i}=plot(ml_vel{i}(:,1),ml_vel{i}(:,2),displ{i+5});
end
ylabel('Flow rate (ml/min)')
d{i+1}=plot(ml{5}(:,1),ones(length(ml{5}(:,1)),1),displ{10});
legend([p{2:2+3}],'w_1=0.5     w_2=0.5','w_1=0.75   w_2=0.25','w_1=0.25   w_2=0.75','R_t=1 ml/min')
title(['J(\Theta)=W_1*Pr+W_2*RU']);
legend boxoff 
box on