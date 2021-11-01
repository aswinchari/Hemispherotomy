%% Takes connectomes from simulated hemispherotomy cuts and processes the data

clc
clear all
cd('/Users/aswinchari/Desktop/HemispherotomyData/');
load('hemispherotomy.mat');
load('labels.mat');

%% Make connectivity matrices for what is disconnected

for a = 1:length(hemispherotomy);
    
    % FB
    
    hemispherotomy(a).fb_left = hemispherotomy(a).newconnectome - hemispherotomy(a).fb_disconnection_left;
    hemispherotomy(a).fb_left(hemispherotomy(a).fb_left<0) = 0;
    group.fb_left{a} = hemispherotomy(a).fb_left;
    group.fb_left_perc{a} = hemispherotomy(a).fb_left ./ hemispherotomy(a).newconnectome;
    
    hemispherotomy(a).fb_right = hemispherotomy(a).newconnectome - hemispherotomy(a).fb_disconnection_right;
    hemispherotomy(a).fb_right(hemispherotomy(a).fb_right<0) = 0;
    group.fb_right{a} = hemispherotomy(a).fb_right;
    group.fb_right_perc{a} = hemispherotomy(a).fb_right ./ hemispherotomy(a).newconnectome;

    % Amygdala
    
    hemispherotomy(a).amy_left = hemispherotomy(a).newconnectome - hemispherotomy(a).amy_disconnection_left;
    hemispherotomy(a).amy_left(hemispherotomy(a).amy_left<0) = 0;
    group.amy_left{a} = hemispherotomy(a).amy_left;
    group.amy_left_perc{a} = hemispherotomy(a).amy_left ./ hemispherotomy(a).newconnectome;
    
    hemispherotomy(a).amy_right = hemispherotomy(a).newconnectome - hemispherotomy(a).amy_disconnection_right;
    hemispherotomy(a).amy_right(hemispherotomy(a).amy_right<0) = 0;
    group.amy_right{a} = hemispherotomy(a).amy_right
    group.amy_right_perc{a} = hemispherotomy(a).amy_right ./ hemispherotomy(a).newconnectome;

    % Corpus Callosum
    
    hemispherotomy(a).cc_left = hemispherotomy(a).newconnectome - hemispherotomy(a).cc_disconnection_left;
    hemispherotomy(a).cc_left(hemispherotomy(a).cc_left<0) = 0;
    group.cc_left{a} = hemispherotomy(a).cc_left;
    group.cc_left_perc{a} = hemispherotomy(a).cc_left ./ hemispherotomy(a).newconnectome;
    
    hemispherotomy(a).cc_right = hemispherotomy(a).newconnectome - hemispherotomy(a).cc_disconnection_right;
    hemispherotomy(a).cc_right(hemispherotomy(a).cc_right<0) = 0;
    group.cc_right{a} = hemispherotomy(a).cc_right;
    group.cc_right_perc{a} = hemispherotomy(a).cc_right ./ hemispherotomy(a).newconnectome;

    % Hippocampectomy
    
    hemispherotomy(a).hippocampectomy_cut_left = hemispherotomy(a).newconnectome - hemispherotomy(a).hippocampectomy_left;
    hemispherotomy(a).hippocampectomy_cut_left(hemispherotomy(a).hippocampectomy_cut_left<0) = 0;
    group.hippocampectomy_left{a} = hemispherotomy(a).hippocampectomy_cut_left;
    group.hippocampectomy_left_perc{a} = hemispherotomy(a).hippocampectomy_cut_left ./ hemispherotomy(a).newconnectome;
    
    hemispherotomy(a).hippocampectomy_cut_right = hemispherotomy(a).newconnectome - hemispherotomy(a).hippocampectomy_right;
    hemispherotomy(a).hippocampectomy_cut_right(hemispherotomy(a).hippocampectomy_cut_right<0) = 0;
    group.hippocampectomy_right{a} = hemispherotomy(a).hippocampectomy_cut_right;
    group.hippocampectomy_right_perc{a} = hemispherotomy(a).hippocampectomy_cut_right ./ hemispherotomy(a).newconnectome;
    
    % Hippocampotomy
    
    hemispherotomy(a).hippocampotomy_left = hemispherotomy(a).newconnectome - hemispherotomy(a).hippocampotomy_disconnection_left;
    hemispherotomy(a).hippocampotomy_left(hemispherotomy(a).hippocampotomy_left<0) = 0;
    group.hippocampotome_left{a} = hemispherotomy(a).hippocampotomy_left;
    group.hippocampotomy_left_perc{a} = hemispherotomy(a).hippocampotomy_left ./ hemispherotomy(a).newconnectome;
    
    hemispherotomy(a).hippocampotomy_right = hemispherotomy(a).newconnectome - hemispherotomy(a).hippocampotomy_disconnection_right;
    hemispherotomy(a).hippocampotomy_right(hemispherotomy(a).hippocampotomy_right<0) = 0;
    group.hippocampotomy_right{a} = hemispherotomy(a).hippocampotomy_right;
    group.hippocampotomy_right_perc{a} = hemispherotomy(a).hippocampotomy_right ./ hemispherotomy(a).newconnectome;

    % Insula
    
    hemispherotomy(a).ins_left = hemispherotomy(a).newconnectome - hemispherotomy(a).ins_disconnection_left;
    hemispherotomy(a).ins_left(hemispherotomy(a).ins_left<0) = 0;
    group.ins_left{a} = hemispherotomy(a).ins_left;
    group.ins_left_perc{a} = hemispherotomy(a).ins_left ./ hemispherotomy(a).newconnectome;
    
    hemispherotomy(a).ins_right = hemispherotomy(a).newconnectome - hemispherotomy(a).ins_disconnection_right;
    hemispherotomy(a).ins_right(hemispherotomy(a).ins_right<0) = 0;
    group.ins_right{a} = hemispherotomy(a).ins_right;
    group.ins_right_perc{a} = hemispherotomy(a).ins_right ./ hemispherotomy(a).newconnectome;
    
    % Suprasylvian
    
    hemispherotomy(a).ss_left = hemispherotomy(a).newconnectome - hemispherotomy(a).ss_disconnection_left;
    hemispherotomy(a).ss_left(hemispherotomy(a).ss_left<0) = 0;
    group.ss_left{a} = hemispherotomy(a).ss_left;
    group.ss_left_perc{a} = hemispherotomy(a).ss_left ./ hemispherotomy(a).newconnectome;
    
    hemispherotomy(a).ss_right = hemispherotomy(a).newconnectome - hemispherotomy(a).ss_disconnection_right;
    hemispherotomy(a).ss_right(hemispherotomy(a).ss_right<0) = 0;
    group.ss_right{a} = hemispherotomy(a).ss_right;
    group.ss_right_perc{a} = hemispherotomy(a).ss_right ./ hemispherotomy(a).newconnectome;
    
    % Temporopolar
    
    hemispherotomy(a).tp_left = hemispherotomy(a).newconnectome - hemispherotomy(a).tp_disconnection_left;
    hemispherotomy(a).tp_left(hemispherotomy(a).tp_left<0) = 0;
    group.tp_left{a} = hemispherotomy(a).tp_left;
    group.tp_left_perc{a} = hemispherotomy(a).tp_left ./ hemispherotomy(a).newconnectome;
    
    hemispherotomy(a).tp_right = hemispherotomy(a).newconnectome - hemispherotomy(a).tp_disconnection_right;
    hemispherotomy(a).tp_right(hemispherotomy(a).tp_right<0) = 0;
    group.tp_right{a} = hemispherotomy(a).tp_right;
    group.tp_right_perc{a} = hemispherotomy(a).tp_right ./ hemispherotomy(a).newconnectome;

    % Hemispherotomy: Hippocampectomy
    
    hemispherotomy(a).fullhemispherotomy_hippocampectomy_left = hemispherotomy(a).newconnectome - hemispherotomy(a).hemispherotomy_hippocampectomy_left;
    hemispherotomy(a).fullhemispherotomy_hippocampectomy_left(hemispherotomy(a).fullhemispherotomy_hippocampectomy_left<0) = 0;
    group.hemispherotomy_hippocampectomy_left{a} = hemispherotomy(a).fullhemispherotomy_hippocampectomy_left;
    group.hemispherotomy_hippocampectomy_left_perc{a} = hemispherotomy(a).fullhemispherotomy_hippocampectomy_left ./ hemispherotomy(a).newconnectome;
    
    hemispherotomy(a).fullhemispherotomy_hippocampectomy_right = hemispherotomy(a).newconnectome - hemispherotomy(a).hemispherotomy_hippocampectomy_right;
    hemispherotomy(a).fullhemispherotomy_hippocampectomy_right(hemispherotomy(a).fullhemispherotomy_hippocampectomy_right<0) = 0;
    group.hemispherotomy_hippocampectomy_right{a} = hemispherotomy(a).fullhemispherotomy_hippocampectomy_right;
    group.hemispherotomy_hippocampectomy_right_perc{a} = hemispherotomy(a).fullhemispherotomy_hippocampectomy_right ./ hemispherotomy(a).newconnectome;
    
    % Hemispherotomy: Hippocampotomy
    
    hemispherotomy(a).fullhemispherotomy_hipp_discon_left = hemispherotomy(a).newconnectome - hemispherotomy(a).hemispherotomy_hipp_discon_left;
    hemispherotomy(a).fullhemispherotomy_hipp_discon_left(hemispherotomy(a).fullhemispherotomy_hipp_discon_left<0) = 0;
    group.hemispherotomy_hipp_discon_left{a} = hemispherotomy(a).fullhemispherotomy_hipp_discon_left;
    group.hemispherotomy_hipp_discon_left_perc{a} = hemispherotomy(a).fullhemispherotomy_hipp_discon_left ./ hemispherotomy(a).newconnectome;
    
    hemispherotomy(a).fullhemispherotomy_hipp_discon_right = hemispherotomy(a).newconnectome - hemispherotomy(a).hemispherotomy_hipp_discon_right;
    hemispherotomy(a).fullhemispherotomy_hipp_discon_right(hemispherotomy(a).fullhemispherotomy_hipp_discon_right<0) = 0;
    group.hemispherotomy_hipp_discon_right{a} = hemispherotomy(a).fullhemispherotomy_hipp_discon_right;
    group.hemispherotomy_hipp_discon_right_perc{a} = hemispherotomy(a).fullhemispherotomy_hipp_discon_right ./ hemispherotomy(a).newconnectome;
    
    % New Connectome
    
    group.newconnectome{a} = hemispherotomy(a).newconnectome;
    
end

%% Calculate group averages

names = fieldnames(group);

for a = 1:length(names)
    z = group.(names{a});
    groups.(names{a}) = cat(3,z{:});
    groupav.(names{a}) = mean(groups.(names{a}),3);
    groupstd.(names{a})= std(groups.(names{a}),0,3);
end

%% Generate connectivity matrices for what we want to disconnect with each side PIH

right = false(253,253);
right(1:108,122:249) = 1;
right(1:108,109:119) = 1;
right(120:121,122:249) = 1;
right(109:119,120:121) = 1;
right = triu(right,-1)' + right;

left = false(253,253);
left(124:234,1:123) = 1;
left(235:245,124:234) = 1;
left(248:249,124:234) = 1;
left(246:247,1:123) = 1;
left(246:247,235:245) = 1;
left(248:249,246:247) = 1;
left = tril(left,-1)' + left;

%% Genearate figure for number of streamlines disconnected by each step

for a = 1:length(hemispherotomy)
    count(a).baselineright = sum(sum(hemispherotomy(a).newconnectome.*right))
    count(a).baselineleft = sum(sum(hemispherotomy(a).newconnectome.*left))
    
    count(a).fb_right = sum(sum(hemispherotomy(a).fb_right.*right))/count(a).baselineright
    count(a).fb_left = sum(sum(hemispherotomy(a).fb_left.*left))/count(a).baselineleft
    
    count(a).amy_right = sum(sum(hemispherotomy(a).amy_right.*right))/count(a).baselineright
    count(a).amy_left = sum(sum(hemispherotomy(a).amy_left.*left))/count(a).baselineleft
    
    count(a).cc_right = sum(sum(hemispherotomy(a).cc_right.*right))/count(a).baselineright
    count(a).cc_left = sum(sum(hemispherotomy(a).cc_left.*left))/count(a).baselineleft
    
    count(a).hippocampectomy_cut_right = sum(sum(hemispherotomy(a).hippocampectomy_cut_right.*right))/count(a).baselineright
    count(a).hippocampectomy_cut_left = sum(sum(hemispherotomy(a).hippocampectomy_cut_left.*left))/count(a).baselineleft
    
    count(a).hippocampotomy_right = sum(sum(hemispherotomy(a).hippocampotomy_right.*right))/count(a).baselineright
    count(a).hippocampotomy_left = sum(sum(hemispherotomy(a).hippocampotomy_left.*left))/count(a).baselineleft
    
    count(a).ins_right = sum(sum(hemispherotomy(a).ins_right.*right))/count(a).baselineright
    count(a).ins_left = sum(sum(hemispherotomy(a).ins_left.*left))/count(a).baselineleft
    
    count(a).ss_right = sum(sum(hemispherotomy(a).ss_right.*right))/count(a).baselineright
    count(a).ss_left = sum(sum(hemispherotomy(a).ss_left.*left))/count(a).baselineleft
    
    count(a).tp_right = sum(sum(hemispherotomy(a).tp_right.*right))/count(a).baselineright
    count(a).tp_left = sum(sum(hemispherotomy(a).tp_left.*left))/count(a).baselineleft
    
    count(a).fullhemispherotomy_hippocampectomy_right = sum(sum(hemispherotomy(a).fullhemispherotomy_hippocampectomy_right.*right))/count(a).baselineright
    count(a).fullhemispherotomy_hippocampectomy_left = sum(sum(hemispherotomy(a).fullhemispherotomy_hippocampectomy_left.*left))/count(a).baselineleft
    
    count(a).fullhemispherotomy_hipp_discon_right = sum(sum(hemispherotomy(a).fullhemispherotomy_hipp_discon_right.*right))/count(a).baselineright
    count(a).fullhemispherotomy_hipp_discon_left = sum(sum(hemispherotomy(a).fullhemispherotomy_hipp_discon_left.*left))/count(a).baselineleft
    
 
end
    

%% Plot this figure (Figure 2b)

% Set up
jit = (rand(16,1)-0.5)/4; 
faces = repmat([0 0.992 0.506;1 0.992 0],8,1);

violins{1} = [count.ss_left];
violins{2} = [count.ss_right];
violins{3} = [count.cc_left];
violins{4} = [count.cc_right];
violins{5} = [count.ins_left];
violins{6} = [count.ins_right];
violins{7} = [count.tp_left];
violins{8} = [count.tp_right];
violins{9} = [count.amy_left];
violins{10} = [count.amy_right];
violins{11} = [count.hippocampectomy_cut_left];
violins{12} = [count.hippocampectomy_cut_right];
violins{13} = [count.fb_left];
violins{14} = [count.fb_right];

violin(violins,'mc',[],'medc',[],'facecolor',faces)
ylim([0 0.6])
ylabel('Proportion of streamlines interrupted')
xticklabels([])
xticks([])
box off
set(gca,'FontSize',15)
set(gca,'Xcolor','none')
title({'Proportion of streamlines from ipsilateral cortex to subcortical', 'structures & contralateral hemisphere interrupted by each step of the PIH'})
set(gcf,'position',[0 0 1000 600]);

%% Save


saveas(gcf,'Manuscript/proportionsteps.png')

%% Generate visualisation files for each step, right side only (Figure 3)

rightsteps = fields(groupav);
idx = find(contains(rightsteps,'right_perc'));
rightsteps = rightsteps(idx);

for a = 1:length(rightsteps)
    rightstepsmatrix.(rightsteps{a}) = groupav.(rightsteps{a}).*right;
    conmat = rightstepsmatrix.(rightsteps{a});
    conmat(isnan(conmat))=0;
    save(strcat('SurfIceNetworkImages/',string(rightsteps{a}),'.txt'),'conmat','-ascii');
    clear conmat
end


%% Percentage of intended streamlines disconnected for each PIH

for a = 1:length(hemispherotomy)
    hemispherotomy(a).baselineright = sum(sum(hemispherotomy(a).newconnectome.*right));
    hemispherotomy(a).baselineleft = sum(sum(hemispherotomy(a).newconnectome.*left));
    
    hemispherotomy(a).PIHleft = sum(sum(hemispherotomy(a).hemispherotomy_hippocampectomy_left.*left));
    hemispherotomy(a).PIHright = sum(sum(hemispherotomy(a).hemispherotomy_hippocampectomy_right.*right));
    
    hemispherotomy(a).percleft = 1 - (hemispherotomy(a).PIHleft/hemispherotomy(a).baselineleft);
    hemispherotomy(a).percright = 1 - (hemispherotomy(a).PIHright/hemispherotomy(a).baselineright);
end

perc = [[hemispherotomy.percleft] [hemispherotomy.percright]]; % calculate mean and range of perc

%% Percentage of each intended parcel disconnected for each PIH

%which parcels to light up
rightpih = zeros(1,253);
rightpih(1:108) = 1;
rightpih(120:121) = 1;

leftpih = zeros(1,253);
leftpih(124:234) = 1;
leftpih(246:247) = 1;


for a = 1:length(hemispherotomy)
    hemispherotomy(a).baselinerightparcels = sum(hemispherotomy(a).newconnectome.*right);
    hemispherotomy(a).baselineleftparcels = sum(hemispherotomy(a).newconnectome.*left);
    
    hemispherotomy(a).PIHleftparcels = sum(hemispherotomy(a).hemispherotomy_hippocampectomy_left.*left);
    hemispherotomy(a).PIHrightparcels = sum(hemispherotomy(a).hemispherotomy_hippocampectomy_right.*right);
    
    hemispherotomy(a).percleftparcels = (hemispherotomy(a).baselineleftparcels-hemispherotomy(a).PIHleftparcels)./hemispherotomy(a).baselineleftparcels.*leftpih;
    hemispherotomy(a).percrightparcels = (hemispherotomy(a).baselinerightparcels-hemispherotomy(a).PIHrightparcels)./hemispherotomy(a).baselinerightparcels.*rightpih;
end

fullhemispherotomy_right = mean(vertcat(hemispherotomy.percrightparcels));
fullhemispherotomy_left = mean(vertcat(hemispherotomy.percleftparcels));

% AtlasStatMap('SurfIceNetworkImages/merge.mz3','SurfIceNetworkImages/right_hippocampectomy_pih.mz3',[],fullhemispherotomy_right);
% AtlasStatMap('SurfIceNetworkImages/merge.mz3','SurfIceNetworkImages/left_hippocampectomy_pih.mz3',[],fullhemispherotomy_left);


%% Calculate Graph theory metrics for each

cuts = fieldnames(hemispherotomy);

for a = 1:length(hemispherotomy)
    
    disp(hemispherotomy(a).name)
    
    for b = 2:22
    
    [modules(a).(cuts{b}), modularity(a).(cuts{b})] = modularity_und(hemispherotomy(a).(cuts{b}));
    gefficiency(a).(cuts{b}) = efficiency_wei(hemispherotomy(a).(cuts{b}));
    eigencent(a).(cuts{b}) = eigenvector_centrality_und(hemispherotomy(a).(cuts{b}));
    partcoef(a).(cuts{b}) = participation_coef(hemispherotomy(a).(cuts{b}),modules(a).(cuts{b}));
    
    end 
end



%%

save('gtmetrics.mat','modularity','gefficiency','eigencent','partcoef','modules','partcoef')
save('groupav.mat','groupav');


