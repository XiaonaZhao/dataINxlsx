
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

for n = 1:9
    plot(X, Y(:, n));
    hold on
end



% h=plot(a,b,'k-o','Markersize',7,'Markerface','white','linewidth',1.0);
% XLabel('a','fontsize',10)
% YLabel('b','fontsize',10)
% Legend('a','b',0)
% hh = findobj('tag','legend');   %|
% set(hh,'fontsize',10)         %| ����legend�ֺŴ�С
% set(h,'LineWidth',1.0);       %| ����ͼ���߿�
% set(gca,'linewidth',1.5)      %| ����ͼ����߿���߿�1.5
% set(gca,'box','off')          %| ȥͼ�����
% %| �����������ֺ�12 ��б�壬��
% set(gca,'fontsize',12,'fontweight','normal','fontangle','italic')
% %| ����x��labal����Ϊб��,���壬�ֺ�12
% set(get(gca,'xlabel'),'fontangle','italic','fontweight','bold', 'fontsize',12)
% %| ����y��labal����Ϊб�壬�Ǻ��壬�ֺ�12
% set(get(gca,'ylabel'),'fontangle','italic','fontweight','normal', 'fontsize',12)