function N = selectXlsxFile(Snum) 
% Snum is the serial number of the aimed sheet
[filename, pathname] = uigetfile({'*.xlsx';'*.xls';'*.*'},'File Selector');

[~,sheet] = xlsfinfo(fullfile(pathname, filename));

[N, ~] = xlsread(fullfile(pathname, filename),sheet{Snum});