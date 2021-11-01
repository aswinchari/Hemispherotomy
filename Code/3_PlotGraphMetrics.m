%% Plot Differences in GT Metrics

clc
clear all
cd('/Users/aswinchari/Desktop/HemispherotomyData/');
load('labels.mat');
load('gtmetrics.mat');


%% Fluff for first plot

cols = cbrewer('qual', 'Paired', 6);     % color scheme 
Np  = 16;                % Number of patients
jit = (rand(Np,1)-0.5)/4;              % jitter for dot plots

%% Structures to plot GT Metrics

% Gefficiency

plotgefficiency{1} = [gefficiency.newconnectome];
plotgefficiency{2} = [gefficiency.hemispherotomy_hippocampectomy_left];
plotgefficiency{3} = [gefficiency.hemispherotomy_hippocampectomy_right];
plotgefficiency{4} = [gefficiency.hemispherotomy_hipp_discon_left];
plotgefficiency{5} = [gefficiency.hemispherotomy_hipp_discon_right];

% Modularity

plotmodularity{1} = [modularity.newconnectome];
plotmodularity{2} = [modularity.hemispherotomy_hippocampectomy_left];
plotmodularity{3} = [modularity.hemispherotomy_hippocampectomy_right];
plotmodularity{4} = [modularity.hemispherotomy_hipp_discon_left];
plotmodularity{5} = [modularity.hemispherotomy_hipp_discon_right];

% Eigenvector Centrality

temp = horzcat(eigencent.newconnectome)';

for a = 1:7
    eigencentnewconnectome{a} = temp(:,a+234); % left thalamus
    eigencentnewconnectome{a+7} = temp(:,a+108); % right thalamus
end

temp = horzcat(eigencent.hemispherotomy_hippocampectomy_left)';

for a = 1:7
    eigencentPIHHippocampectomyLeft{a} = temp(:,a+234); % left thalamus
    eigencentPIHHippocampectomyLeft{a+7} = temp(:,a+108); % right thalamus
end

temp = horzcat(eigencent.hemispherotomy_hippocampectomy_right)';

for a = 1:7
    eigencentPIHHippocampectomyRight{a} = temp(:,a+234); % left thalamus
    eigencentPIHHippocampectomyRight{a+7} = temp(:,a+108); % right thalamus
end

temp = horzcat(eigencent.hemispherotomy_hipp_discon_left)';

for a = 1:7
    eigencentPIHHippDisconLeft{a} = temp(:,a+234); % left thalamus
    eigencentPIHHippDisconLeft{a+7} = temp(:,a+108); % right thalamus
end

temp = horzcat(eigencent.hemispherotomy_hipp_discon_right)';

for a = 1:7
    eigencentPIHHippDisconRight{a} = temp(:,a+234); % left thalamus
    eigencentPIHHippDisconRight{a+7} = temp(:,a+108); % right thalamus
end


% Part Coef

temp = horzcat(partcoef.newconnectome)';

for a = 1:7
    partcoefnewconnectome{a} = temp(:,a+234); % left thalamus
    partcoefnewconnectome{a+7} = temp(:,a+108); % right thalamus
end

temp = horzcat(partcoef.hemispherotomy_hippocampectomy_left)';

for a = 1:7
    partcoefPIHHippocampectomyLeft{a} = temp(:,a+234); % left thalamus
    partcoefPIHHippocampectomyLeft{a+7} = temp(:,a+108); % right thalamus
end

temp = horzcat(partcoef.hemispherotomy_hippocampectomy_right)';

for a = 1:7
    partcoefPIHHippocampectomyRight{a} = temp(:,a+234); % left thalamus
    partcoefPIHHippocampectomyRight{a+7} = temp(:,a+108); % right thalamus
end

temp = horzcat(partcoef.hemispherotomy_hipp_discon_left)';

for a = 1:7
    partcoefPIHHippDisconLeft{a} = temp(:,a+234); % left thalamus
    partcoefPIHHippDisconLeft{a+7} = temp(:,a+108); % right thalamus
end

temp = horzcat(partcoef.hemispherotomy_hipp_discon_right)';

for a = 1:7
    partcoefPIHHippDisconRight{a} = temp(:,a+234); % left thalamus
    partcoefPIHHippDisconRight{a+7} = temp(:,a+108); % right thalamus
end

%% Plot them

%gefficiency
subplot(6,4,[1 2 5 6])
violin(plotgefficiency,'mc',[],'medc',[],'facecolor',cols([2:6],:),'edgecolor',[]);
title('Global Efficiency')
xticks([])
box('off')
set(gca,'FontSize',12);

%modularity
subplot(6,4,[3 4 7 8])
violin(plotmodularity,'mc',[],'medc',[],'facecolor',cols([2:6],:),'edgecolor',[]);
title('Modularity')
xticks([])
box('off')
set(gca,'FontSize',12);

%eigencent
subplot(6,4,[9 10])
violin(eigencentnewconnectome, 'mc',[],'medc',[],'facecolor',cols(2,:),'edgecolor',[]);
xticks([1:14])
xticklabels({'Left Pul', 'Left Ant', 'Left MD', 'Left VLD', 'Left CLLPMP', 'Left VA', 'Left VLV','Right Pul', 'Right Ant', 'Right MD', 'Right VLD', 'Right CLLPMP', 'Right VA', 'Right VLV'})
xtickangle(60)
title('Thalamic Eigenvector Centrality at Baseline')
ylim([0 0.2])
box('off')
set(gca,'FontSize',12);

subplot(6,4,17)
violin(eigencentPIHHippocampectomyLeft, 'mc',[],'medc',[],'facecolor',cols(3,:),'edgecolor',[]);
title({'Left PIH', 'Hippocampectomy'})
ylim([0 0.2])
box('off')
set(gca,'FontSize',10);
xticks([])

subplot(6,4,18)
violin(eigencentPIHHippocampectomyRight, 'mc',[],'medc',[],'facecolor',cols(4,:),'edgecolor',[]);
title({'Right PIH', 'Hippocampectomy'})
ylim([0 0.2])
box('off')
set(gca,'FontSize',10);
xticks([])

subplot(6,4,21)
violin(eigencentPIHHippDisconLeft, 'mc',[],'medc',[],'facecolor',cols(5,:),'edgecolor',[]);
title({'Left PIH', 'Hipp Discon'})
ylim([0 0.2])
box('off')
set(gca,'FontSize',10);
xticks([])

subplot(6,4,22)
violin(eigencentPIHHippDisconRight, 'mc',[],'medc',[],'facecolor',cols(6,:),'edgecolor',[]);
title({'Right PIH', 'Hipp Discon'})
ylim([0 0.2])
box('off')
set(gca,'FontSize',10);
xticks([])

%partcoef
subplot(6,4,[11 12])
violin(partcoefnewconnectome, 'mc',[],'medc',[],'facecolor',cols(2,:),'edgecolor',[]);
xticks([1:14])
xticklabels({'Left Pul', 'Left Ant', 'Left MD', 'Left VLD', 'Left CLLPMP', 'Left VA', 'Left VLV','Right Pul', 'Right Ant', 'Right MD', 'Right VLD', 'Right CLLPMP', 'Right VA', 'Right VLV'})
xtickangle(60)
title('Thalamic Participation Coefficient at Baseline')
ylim([0 1])
box('off')
set(gca,'FontSize',12);

subplot(6,4,19)
violin(partcoefPIHHippocampectomyLeft, 'mc',[],'medc',[],'facecolor',cols(3,:),'edgecolor',[]);
title({'Left PIH', 'Hippocampectomy'})
ylim([0 1])
box('off')
set(gca,'FontSize',10);
xticks([])

subplot(6,4,20)
violin(partcoefPIHHippocampectomyRight, 'mc',[],'medc',[],'facecolor',cols(4,:),'edgecolor',[]);
title({'Right PIH', 'Hippocampectomy'})
ylim([0 1])
box('off')
set(gca,'FontSize',10);
xticks([])

subplot(6,4,23)
violin(partcoefPIHHippDisconLeft, 'mc',[],'medc',[],'facecolor',cols(5,:),'edgecolor',[]);
title({'Left PIH', 'Hipp Discon'})
ylim([0 1])
box('off')
set(gca,'FontSize',10);
xticks([])

subplot(6,4,24)
violin(partcoefPIHHippDisconRight, 'mc',[],'medc',[],'facecolor',cols(6,:),'edgecolor',[]);
title({'Right PIH', 'Hipp Discon'})
ylim([0 1])
box('off')
set(gca,'FontSize',10);
xticks([])
%%
 saveas(gcf,'Manuscript/GraphMetrics.png')

%% T-tests

% gefficiency
[~,test.gefficiencyleft] = ttest(plotgefficiency{2},plotgefficiency{4});
[~,test.gefficiencyright] = ttest(plotgefficiency{3},plotgefficiency{5});

%modularity
[~,test.modularityleft] = ttest(plotmodularity{2},plotmodularity{4});
[~,test.modularityright] = ttest(plotmodularity{3},plotmodularity{5});

% thalamic ones
for a = 1:14
    [~,eigencenttestleft(1,a)] = ttest(eigencentPIHHippDisconLeft{a},eigencentPIHHippocampectomyLeft{a});
    [~,eigencenttestright(1,a)] = ttest(eigencentPIHHippDisconRight{a},eigencentPIHHippocampectomyRight{a});
    [~,partcoeftestleft(1,a)] = ttest(partcoefPIHHippDisconLeft{a},partcoefPIHHippocampectomyLeft{a});
    [~,partcoeftestright(1,a)] = ttest(partcoefPIHHippDisconRight{a},partcoefPIHHippocampectomyRight{a});
end

eigencenttestleft(2,:) = fdr_BH(eigencenttestleft(1,:),0.05);
eigencenttestright(2,:) = fdr_BH(eigencenttestright(1,:),0.05);

partcoeftestleft(2,:) = fdr_BH(partcoeftestleft(1,:),0.05);
partcoeftestright(2,:) = fdr_BH(partcoeftestright(1,:),0.05);
