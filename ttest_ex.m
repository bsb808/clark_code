% t-test Example


% Read data
fname = 'fake_data.csv';
M = csvread(fname,1,0);

% t-test to determine if the mean reaction time 'Before' is 
% different than the mean reaction time 'After'

% Put all reaction times for Block 1 into a single vector
rt_before = [M(:,1);M(:,3)];
% Same for Block 2
rt_after = [M(:,5);M(:,7)];

[h,p,ci,stats] = ttest2(rt_before,rt_after)