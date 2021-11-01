%% Measure similarties between the different cuts
clc
clear all
cd('/Users/aswinchari/Desktop/HemispherotomyData/');
load('labels.mat');
load('groupav.mat');

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

%% Isolate only perc files for display

cuts = fields(groupav);
idx = find(contains(cuts,'perc'));
cuts = cuts(idx);

for a = 1:10
    groupavdisplay.(cuts{2*a-1}) = groupav.(cuts{2*a-1}).*left;
    groupavdisplay.(cuts{2*a}) = groupav.(cuts{2*a}).*right;
end


%% Calculate the edges that overlap

% Generate construct to do this

for a = 1:8
    leftcorr(a).name = cuts(2*a-1);
    leftcorr(a).connectome = groupavdisplay.(cuts{2*a-1});
    rightcorr(a).name = cuts(2*a);
    rightcorr(a).connectome = groupavdisplay.(cuts{2*a});
end
 
 for a = 1:8
     for b = 1:8
         leftoverlap{a,b} = and(leftcorr(a).connectome>0.8,leftcorr(b).connectome>0.8);
         leftov(a,b) = sum(sum(leftoverlap{a,b}));
         rightoverlap{a,b} = and(rightcorr(a).connectome>0.8,rightcorr(b).connectome>0.8);
         rightov(a,b) = sum(sum(rightoverlap{a,b}));
     end
 end
 
rightov = rightov - diag(diag(rightov));
leftov = leftov - diag(diag(leftov));

% remove hippocampotomy

rightov = rightov([1:4 6:8],[1:4 6:8]);
leftov = leftov([1:4 6:8],[1:4 6:8]);

rightoverlap = rightoverlap([1:4 6:8],[1:4 6:8]);
leftoverlap = leftoverlap([1:4 6:8],[1:4 6:8]);

%rightovperc = rightov/(253*253-253)
%leftovperc = leftov/(253*253-253)

%% Make a plot (Figure 4a)

cutlab = {'Frontobasal', 'Amygdalectomy', 'Corpus Callosotomy', 'Hippocampectomy','Insular Disconnection','Suprasylvian Disconnection','Temporal Disconnection'};

subplot(1,2,1)
imagesc(leftov)
xticklabels(cutlab)
yticklabels(cutlab)
xticks(1:7)
yticks(1:7)
xtickangle(90)
caxis([0 210])
colorbar
set(gca,'FontSize',12)
title('Number of Overlapping Edges Disconnected in Left PIH','FontSize',15)


subplot(1,2,2)
imagesc(rightov)
xticklabels(cutlab)
yticklabels(cutlab)
xticks(1:7)
yticks(1:7)
xtickangle(90)
caxis([0 210])
colorbar
set(gca,'FontSize',12)
title('Number of Overlapping Edges Disconnected in Right PIH','FontSize',15)


 %% Save Figure
 
 saveas(gcf,'Manuscript/Overlap.png')
 
 %% Generate structure for network visualisation of overlaps (Figure 4b)
 
 overlap.rightccins = rightoverlap{3,5};
 overlap.rightccss = rightoverlap{3,6};
 overlap.rightinstp = rightoverlap{5,7};
 overlap.rightinsss = rightoverlap{5,6};
 
 overlaps = fields(overlap);
 
 for a = 1:length(overlaps)
     conmat = double(overlap.(overlaps{a}));
     save(strcat('SurfIceNetworkImages/Overlap',string(overlaps{a}),'.txt'),'conmat','-ascii');
     clear conmat
 end
 
 %% Difference between PIH-hippocampectomy vs PIH-hippocampotomy

 
PIHdiffleft = double(groupavdisplay.hemispherotomy_hippocampectomy_left_perc>0.8) - double(groupavdisplay.hemispherotomy_hipp_discon_left_perc>0.8);
PIHdiffright = double(groupavdisplay.hemispherotomy_hippocampectomy_right_perc>0.8) - double(groupavdisplay.hemispherotomy_hipp_discon_right_perc>0.8);

save('SurfIceNetworkImages/PIHdiffleft.txt','PIHdiffleft','-ascii');
save('SurfIceNetworkImages/PIHdiffright.txt','PIHdiffright','-ascii');