% Generate fake data for prototyping statistical analysis

P = 10; % Number of participants
N = 2;  % Number of questions in first block
M = 2;  % Number of questions in second block

% For each question, define the fields and the distribution
q(1).name = 'SelfReactionTime';
q(1).type = 'float';
q(1).mean = [1.0,1.0];
q(1).stddev = [1.0,1.0];


q(2).name = 'SelfAnswer';
q(2).type = 'int';
q(2).mean = [1.0,1.0];
q(2).stddev = [1.0,1.0];


% Open data file
fid = fopen('fake_data.csv','w');

% Generate headers
NN  = [N,M];
for hh = 1:length(NN)
    for ii = 1:NN(hh)
        for jj = 1:length(q)
            fprintf(fid,'B%d:Q%d:%s[%s],',hh,ii,q(jj).name,q(jj).type);
        end
    end
end
fprintf(fid,'\n');

% Write data
for gg = 1:P
    for hh =1:length(NN)
        for ii = 1:NN(hh)
            for jj = 1:length(q)
                val = normrnd(q(jj).mean(hh),q(jj).stddev(hh));
                val = max(val,0.0);  % make positive
                if (strcmp(q(jj).type,'float'))
                    fprintf(fid,'%.2f,',val);
                elseif (strcmp(q(jj).type,'int'))
                    fprintf(fid,'%d,',round(val));
                elseif (strcmp(q(jj).type,'bool')) 
                    val = min(val,1.0);
                    fprintf(fid,'%d,',round(val));
                else
                    printf('ERROR with question type!\n');
                end
            end
        end
    end
    fprintf(fid,'\n');
end


