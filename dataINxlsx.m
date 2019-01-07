
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

%% -- simplified version
n = 4;
sheet = selectXlsxFile(n);
X = sheet(:, 1);
Y = sheet(:, (2:end));

col = size(Y, 2); % 2 returns the num of col
for n = 1:col
%     Yfit(:, n) = log(abs(Y(:, n)));
    Yfit(:, n) = dataFit(Y(:, n));
end

figure('color','w');
for n = 1:col
%         plot(X, Y(:, n)); % get raw lines
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

%%
for n = 1:4
    figure('color','w');
    plot(X(2:end), diffY(:, n));
    hold on
    plot(X(2:end), f_dY(:, n));
    xlabel('Frames','fontsize',10)
    ylabel('ΔIntensity','fontsize',10)
    set(findobj(get(gca, 'Children'), 'LineWidth',0.5), 'LineWidth', 1.5);
    set(gca, 'linewidth', 1);
    hold off
end

%%
roiLabel = ['1', '2', '3', '4',...
    '5', '6', '7'];
color = [ 0    0.4470    0.7410;
    0.8500    0.3250    0.0980;
    0.9290    0.6940    0.1250;
    0.4940    0.1840    0.5560;
    0.4660    0.6740    0.1880;
    0.3010    0.7450    0.9330;
    0.6350    0.0780    0.1840]; % defined color list

diffY = zeros(size(Y(2:end, :)));
figure('color','w');
for n = 1:col
    diffY(:, n) = diff(Y(:, n));
    plot(X(2:end), diffY(:, n));
    hold on
end

for n = 1:col
    figure('color','w');
    diffY(:, n) = diff(Y(:, n));
    plot(X(2:end), diffY(:, n), 'Color', color(n,:));
    legend(roiLabel(n));
end
xlabel('Frames','fontsize',10)
ylabel('?Intensity','fontsize',10)
set(findobj(get(gca, 'Children'), 'LineWidth',0.5), 'LineWidth', 1.5);
set(gca, 'linewidth', 1);

%% calculate the redox potential
endFrame = 1947;
redFrame = 940;
if redFrame > endFrame
    disp('An wrong Frame input');
elseif redFrame > (endFrame - 106*4)
    redPotential = 0.8*(endFrame - redFrame)/(106*4);
elseif redFrame > (endFrame - 106*8)
    redPotential = 0.8*(redFrame - (endFrame-106*8))/(106*4);
elseif redFrame > (endFrame - 106*12)
    redPotential = 0.8*(endFrame -106*8 - redFrame)/(106*4);
elseif redFrame > (endFrame - 106*16)
    redPotential = 0.8*(redFrame - (endFrame-106*16))/(106*4);
else 
    disp('An wrong Frame input');
end