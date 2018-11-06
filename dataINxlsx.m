
%%
prompt1 = 'Please input the number of sheet to be processed: \n';
numberOFsheet = input(prompt1);

%%
sheet = selectXlsxFile(numberOFsheet);

%%
prompt2 = 'Please input the number of Independent variable: \n';
Xnum = input(prompt2);

prompt3 = 'Please input the number of Dependent variable: \n';
Ynum = input(prompt3);

%%
X = sheet(:, Xnum);
Y = sheet(:, Ynum);

%%
Yfit = dataFit(Y);
% % The following Comments could be used in speeding up the calculation.
% for n = 1:4
%     Y(:, n) = dataFit(sheet(:, n+1));
% end

%%
scatter(X, Y);
hold on
plot(X, Yfit);

%%
n = 4;
sheet = selectXlsxFile(n);
X = sheet(:, 1);
Y = sheet(:, (2:end));

col = size(Y, 2); % 2 returns the num of col
for n = 1:col
    Yfit(:, n) = dataFit(Y(:, n));
end

for n = 1:col
%     plot(X, Y(:, n)); % get raw lines
    plot(X, Yfit(:, n)); % get fitted lines
    hold on
end


% h=plot(a,b,'k-o','Markersize',7,'Markerface','white','linewidth',1.0);
xlabel('Frames','fontsize',10)
ylabel('ΔIntensity','fontsize',10)
% Legend('a','b',0)
% hh = findobj('tag','legend');   %|
% set(hh,'fontsize',10)         %| 设置legend字号大小
set(findobj(get(gca, 'Children'), 'LineWidth',0.5), 'LineWidth', 2);        %| 设置图形线宽
set(gca, 'linewidth', 1.5)      %| 设置图形外边框的线宽1.5
% set(gca,'box','off')          %| 去图形外筐
% %| 设置坐标轴字号12 ，斜体，正
% set(gca,'fontsize',12,'fontweight','normal','fontangle','italic')
% %| 设置x轴labal字体为斜体,黑体，字号12
% set(get(gca,'xlabel'),'fontangle','italic','fontweight','bold', 'fontsize',12)
% %| 设置y轴labal字体为斜体，非黑体，字号12
% set(get(gca,'ylabel'),'fontangle','italic','fontweight','normal', 'fontsize',12)