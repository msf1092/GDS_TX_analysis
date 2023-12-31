function fnc_plot_xyy(x,y1,y2,axLim_factor,xLab,yLab1,yLab2,Leg1,Leg2)
%Plots y1 n y2 versus x
%   

% f = figure ('Name',fig_name,'Position',[100 100 500 375]);
% set(f,'defaulttextinterpreter','latex');
set(0,'defaulttextinterpreter','latex');
left_color = [0.85 0.47 0.32];
right_color = [0.1 0.25 0.89];
set(0,'defaultAxesColorOrder',[left_color; right_color]);

% Plot x-y1
yyaxis left
plot(x,y1,'-o','LineWidth',1,'MarkerSize',2,'Color',[0.85 0.47 0.32])
xlabel(xLab,'FontSize',10,'Color','k','Interpreter','latex')
ylabel(yLab1,'FontSize',10,'Color','k','Interpreter','latex')

if min(x) == max(x)
    xlim([min(x)-axLim_factor*abs(min(x)) max(x)+axLim_factor*0.001])
else
    xlim([min(x)-axLim_factor*abs(min(x)) max(x)+axLim_factor*max(x)])
end
if min(y1) == max(y1)
    ylim([min(y1)-axLim_factor*abs(min(y1)) max(y1)+axLim_factor*0.001]) % If the min n max are equal, there'll be an error.
else
    ylim([min(y1)-axLim_factor*abs(min(y1)) max(y1)+axLim_factor*max(y1)])
end
ax = gca;
set(ax,'TickLabelInterpreter','latex')
grid on

% Plot x-y2
yyaxis right
plot(x,y2,'-','LineWidth',1,'MarkerSize',10,'Color',[0.1 0.25 0.89])
ylabel(yLab2,'FontSize',10,'Color','k','Interpreter','latex')
if min(y2) == max(y2)
    ylim([min(y2)-axLim_factor*abs(min(y2)) max(y2)+axLim_factor*0.001]) % If the min n max are equal, there'll be an error.
else
    ylim([min(y2)-axLim_factor*abs(min(y2)) max(y2)+axLim_factor*max(y2)])
end
% set (gca, 'YDir','reverse')
ax = gca;
set(ax,'TickLabelInterpreter','latex')

lgnd = legend(Leg1,Leg2,'FontSize',9,'Location','best','Interpreter','latex');
set(lgnd,'color','none')

% Save the figure to the desired formats
% exportgraphics(gcf, fullfile(out_dir, [fig_name '.jpg']), 'Resolution', res);
% exportgraphics(gcf, fullfile(out_dir, [fig_name '.png']), 'Resolution', res);
% exportgraphics(gcf, fullfile(out_dir, [fig_name '.tif']), 'Resolution', res);
% print(fullfile(out_dir, [fig_name '.svg']), '-dsvg', '-r300');
% print(fullfile(out_dir, [fig_name '.eps']), '-depsc', '-r300');

end