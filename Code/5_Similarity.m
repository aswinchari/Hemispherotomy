%% Measure similarties between the different cuts
% To be run after cutdifferences.mat

load('PegahJuly2021.mat');
cuts = fields(groupav);

for a = 1:20
    Q = groupav.(cuts{a});
    Q(isnan(Q)) = 0;
    groupav.(cuts{a}) = Q;
    clear Q;
end

for a = 1:8
    left(a).name = cuts(2*a-1)
    left(a).connectome = groupav.(cuts{2*a-1})
    right(a).name = cuts(2*a)
    right(a).connectome = groupav.(cuts{2*a})
end

%% Measure similarity between each of the cuts

for a = 1:8
    for b = 1:8
        leftsim(a,b) = corr2(left(a).connectome, left(b).connectome);
        rightsim(a,b) = corr2(right(a).connectome, right(b).connectome);
    end
end


 %% Calculate Overlap
 
 ov = 0.5;
 
 for a = 1:8
     for b = 1:8
         leftoverlap{a,b} = and(left(a).connectome>ov,left(b).connectome>ov);
         leftov(a,b) = sum(sum(leftoverlap{a,b}));
         rightoverlap{a,b} = and(right(a).connectome>ov,right(b).connectome>ov);
         rightov(a,b) = sum(sum(rightoverlap{a,b}));
     end
 end
 
rightov = rightov - diag(diag(rightov));
leftov = leftov - diag(diag(leftov));

rightovperc = rightov/(253*253-253)
leftovperc = leftov/(253*253-253)

%% Make a plot

cutlab = {'Frontobasal', 'Amygdalectomy', 'Corpus Callosotomy', 'Hippocampectomy','Hippocampal Disconnection','Insular Disconnection','Suprasylvian Disconnection','Temporal Disconnection'};

subplot(2,2,1)
imagesc(leftsim)
xticklabels(cutlab)
yticklabels(cutlab)
xticks(1:8)
yticks(1:8)
xtickangle(90)
caxis([0 1])
colorbar
set(gca,'FontSize',12)
title('Left Steps Correlation','FontSize',15)


subplot(2,2,2)
imagesc(rightsim)
xticklabels(cutlab)
yticklabels(cutlab)
xticks(1:8)
yticks(1:8)
xtickangle(90)
caxis([0 1])
colorbar
set(gca,'FontSize',12)
title('Right Steps Correlation','FontSize',15)


subplot(2,2,3)
imagesc(leftovperc*100)
xticklabels(cutlab)
yticklabels(cutlab)
xticks(1:8)
yticks(1:8)
xtickangle(90)
caxis([0 1])
colorbar
set(gca,'FontSize',12)
title('Left Steps % Overlap','FontSize',15)


subplot(2,2,4)
imagesc(rightovperc*100)
xticklabels(cutlab)
yticklabels(cutlab)
xticks(1:8)
yticks(1:8)
xtickangle(90)
caxis([0 1])
colorbar
set(gca,'FontSize',12)
title('Right Steps % Overlap','FontSize',15)


 %% Save Figure
 
 saveas(gcf,'Manuscript/Similarities+Overlap.png')
 
     