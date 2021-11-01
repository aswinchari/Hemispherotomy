%% Extract connectomes and add them to hemisepherotomy.mat struct

clc
clear all
cd('/Users/aswinchari/Desktop/HemispherotomyData/');

%% Load each cut

filelist = dir('Output/sub*');
load('hemispherotomy.mat');

for a = 1:length(filelist)
    
    hemispherotomy(a).name2 = filelist(a).name;
    filelist2 = dir(strcat('Output/',filelist(a).name,'/*.csv'));

    for b = 1:length(filelist2)
        conmat = load(strcat(filelist2(b).folder,'/',filelist2(b).name), '-ascii');
        conmat = conmat - diag(diag(conmat));   % set diagonal to zero
        hemispherotomy(a).(filelist2(b).name(1:length(filelist2(b).name)-4)) = conmat;
        
        clear conmat
        
    end
    
    clear filelist2
end

%% End

save('hemispherotomy.mat','hemispherotomy');
