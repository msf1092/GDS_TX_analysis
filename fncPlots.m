function fncPlots(in,phase_no,out_dir,res,axLim_factor);
%The functions plots all required plots in one tiled layout
% It uses sub-functions:

%% Selection of data, for the phase number:
n = 1;
for i = 1 : height(in)
    if in{i,"Stage Number"} == phase_no
        data(n,:) = in(i,:);
        n = n + 1;
    end
end
%% Plots:
tiledlayout(4,3,"InnerPosition",[0.1300 0.1100 0.7750 0.8150],"Units","normalized","Padding","compact","TileSpacing","compact");
% Change the size of the figure
set(gcf, 'Position', [30 50 1600 1000]);
% (1)
nexttile
% plot u and B vs. Time
x = data.("Time since start of stage (s)");
y1 = data.("Pore Pressure (kPa)");
y2 = data.("B Value");
xLab = 'Time, $t$ ($sec$)';
yLab1 = 'Pore water pressure, $u$ ($kPa$)';
yLab2 = '$B$';
Leg1 = 'Pore water pressure';
Leg2 = '$B$ value';
fnc_plot_xyy(x,y1,y2,axLim_factor,xLab,yLab1,yLab2,Leg1,Leg2)
% (2)
nexttile
% plot u and q vs. Axial strain
x = data.("Axial Strain (%)");
y1 = data.("Pore Pressure (kPa)");
y2 = data.("Deviator Stress (kPa)");
xLab = 'Axial strain, $\varepsilon_1$ ($\%$)';
yLab1 = 'Pore water pressure, $u$ ($kPa$)';
yLab2 = 'Deviatoric stress, $q$ ($kPa$)';
Leg1 = 'Pore water pressure';
Leg2 = 'Deviatoric stress';
fnc_plot_xyy(x,y1,y2,axLim_factor,xLab,yLab1,yLab2,Leg1,Leg2)
% (3)
nexttile
% plot delta_V vs. Time-squared
x = data.("Time since start of stage (s)") .^ 0.5;
y1 = data.("Volume Change (mm³)");
y2 = data.("Volume Change (mm³)");
xLab = '(Time)$^{\frac{1}{2}}$ ($sec$)';
yLab1 = 'Volume change, $\Delta V$ ($mm^3$)';
yLab2 = 'Volume change, $\Delta V$ ($mm^3$)';
Leg1 = 'Volume Change';
Leg2 = 'Volume Change';
fnc_plot_xyy(x,y1,y2,axLim_factor,xLab,yLab1,yLab2,Leg1,Leg2)
% (4)
nexttile
% plot axial stress and strain vs. Time
x = data.("Time since start of stage (s)");
y1 = data.("Axial Stress (kPa)");
y2 = data.("Axial Strain (%)");
xLab = 'Time, $t$ ($sec$)';
yLab1 = 'Axial stress, $\sigma^\prime_1$ ($kPa$)';
yLab2 = 'Axial strain, $\varepsilon_1$ ($\%$)';
Leg1 = 'Axial stress';
Leg2 = 'Axial strain';
fnc_plot_xyy(x,y1,y2,axLim_factor,xLab,yLab1,yLab2,Leg1,Leg2)
% (5)
nexttile
% plot radial stress and strain vs. Time
x = data.("Time since start of stage (s)");
y1 = data.("Axial Stress (kPa)");
y2 = data.("Radial Strain (%)");
xLab = 'Time, $t$ ($sec$)';
yLab1 = 'Radial stress, $\sigma^\prime_3$ ($kPa$)';
yLab2 = 'Radial strain, $\varepsilon_3$ ($\%$)';
Leg1 = 'Radial stress';
Leg2 = 'Radial strain';
fnc_plot_xyy(x,y1,y2,axLim_factor,xLab,yLab1,yLab2,Leg1,Leg2)
% (6)
nexttile
% plot q and u versus p' 
x = data.("Eff. Cambridge p' (kPa)");
y1 = data.("Deviator Stress (kPa)");
y2 = data.("Pore Pressure (kPa)");
xLab = 'Mean effective stress, $p^\prime$ ($kPa$)';
yLab1 = 'Deviatoric stress, $q$ ($kPa$)';
yLab2 = 'Pore water pressure, $u$ ($kPa$)';
Leg1 = '$p^\prime-q$';
Leg2 = '$p^\prime-u$';
fnc_plot_xyy(x,y1,y2,axLim_factor,xLab,yLab1,yLab2,Leg1,Leg2)
% (7)
nexttile
% plot q and u versus p 
x = data.("Cambridge p (kPa)");
y1 = data.("Deviator Stress (kPa)");
y2 = data.("Pore Pressure (kPa)");
xLab = 'Mean total stress, $p$ ($kPa$)';
yLab1 = 'Deviatoric stress, $q$ ($kPa$)';
yLab2 = 'Pore water pressure, $u$ ($kPa$)';
Leg1 = '$p-q$';
Leg2 = '$p-u$';
fnc_plot_xyy(x,y1,y2,axLim_factor,xLab,yLab1,yLab2,Leg1,Leg2)
% (8)
nexttile
% plot back and radial volume vs. Time
x = data.("Time since start of stage (s)");
y1 = data.("Back Volume (mm³)");
y2 = data.("Radial Volume (mm³)");
xLab = 'Time, $t$ ($sec$)';
yLab1 = 'Back volume ($mm^3$)';
yLab2 = 'Radial volume ($mm^3$)';
Leg1 = 'Back volume';
Leg2 = 'Radial volume';
fnc_plot_xyy(x,y1,y2,axLim_factor,xLab,yLab1,yLab2,Leg1,Leg2)
% (9)
nexttile
% plot t vs. s'
x = (data.("Eff. Axial Stress (kPa)") + data.("Eff. Radial Stress (kPa)")) ./ 2; % s'
y1 = (data.("Eff. Axial Stress (kPa)") - data.("Eff. Radial Stress (kPa)")) ./ 2; % t
y2 = data.("Max Shear Stress t (kPa)");
xLab = '$s^\prime=\frac{1}{2}(\sigma^\prime_1+\sigma^\prime_3)$ ($kPa$)';
yLab1 = '$t^\prime=\frac{1}{2}(\sigma^\prime_1-\sigma^\prime_3)$ ($kPa$)';
yLab2 = 'Max. shear stress ($kPa$)';
Leg1 = '$s^\prime-t^\prime$';
Leg2 = 'Max. shear stress';
fnc_plot_xyy(x,y1,y2,axLim_factor,xLab,yLab1,yLab2,Leg1,Leg2)
% (10)
nexttile
% plot shear strain vs. shear stress
x = data.("Shear Strain (%)"); % gamma
y1 = data.("Max Shear Stress t (kPa)"); % t
y2 = data.("Pore Pressure (kPa)");
xLab = 'Shear strain, $\gamma$ ($\%$)';
yLab1 = 'Max shear stress, $\tau$, $t^\prime=\frac{1}{2}(\sigma^\prime_1-\sigma^\prime_3)$ ($kPa$)';
yLab2 = 'Pore water pressure, $u$ ($kPa$)';
Leg1 = 'Shear strain';
Leg2 = 'Pore water pressure';
fnc_plot_xyy(x,y1,y2,axLim_factor,xLab,yLab1,yLab2,Leg1,Leg2)
% (11)
nexttile
% plot eff. and total stress ratio vs. Time
x = data.("Time since start of stage (s)");
y1 = data.("Eff. Stress Ratio");
y2 = data.("Total Stress Ratio");
xLab = 'Time, $t$ ($sec$)';
yLab1 = 'Effective stress ratio, $\sigma^\prime_1/\sigma^\prime_3$';
yLab2 = 'Total stress ratio, $\sigma_1/\sigma_3$';
Leg1 = 'Effective Stress Ratio';
Leg2 = 'Total Stress Ratio';
fnc_plot_xyy(x,y1,y2,axLim_factor,xLab,yLab1,yLab2,Leg1,Leg2)
% (12)
nexttile
% plot shear stress vs. Axial strain
x = data.("Axial Strain (%)");
y1 = data.("Max Shear Stress t (kPa)");
y2 = data.("Max Shear Stress t (kPa)");
xLab = 'Axial strain, $\varepsilon_1$ ($\%$)';
yLab1 = 'Max. shear stress, $t$ ($kPa$)';
yLab2 = 'Max. shear stress, $t$ ($kPa$)';
Leg1 = 'Max. shear stress';
Leg2 = 'Max. shear stress';
fnc_plot_xyy(x,y1,y2,axLim_factor,xLab,yLab1,yLab2,Leg1,Leg2)

% Save the figure to the desired formats
fig_name = sprintf('DynTX_phase_%d',phase_no);
% exportgraphics(gcf, fullfile(out_dir, [fig_name '.jpg']), 'Resolution', res);
exportgraphics(gcf, fullfile(out_dir, [fig_name '.png']), 'Resolution', res);
% exportgraphics(gcf, fullfile(out_dir, [fig_name '.tif']), 'Resolution', res);
% print(fullfile(out_dir, [fig_name '.svg']), '-dsvg', '-r300');
% print(fullfile(out_dir, [fig_name '.eps']), '-depsc', '-r300');

end

