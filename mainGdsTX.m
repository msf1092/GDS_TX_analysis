clear; close all; format compact; clc;
%% Loading data
% Get a list of all text files in the folder
in_dir = 'C:\Users\qdmofa\OneDrive - TUNI.fi\Fincone II-adjunct\Asli\FINCONE II - Analytical tools\Codes\GDS TX\in';
in_dir_plan = 'C:\Users\qdmofa\OneDrive - TUNI.fi\Fincone II-adjunct\Asli\FINCONE II - Analytical tools\Codes\GDS TX\in\Plan';
in_dir_cons = 'C:\Users\qdmofa\OneDrive - TUNI.fi\Fincone II-adjunct\Asli\FINCONE II - Analytical tools\Codes\GDS TX\in\Consolidation Files';
out_dir = 'C:\Users\qdmofa\OneDrive - TUNI.fi\Fincone II-adjunct\Asli\FINCONE II - Analytical tools\Codes\GDS TX\out';
code_dir = 'C:\Users\qdmofa\OneDrive - TUNI.fi\Fincone II-adjunct\Asli\FINCONE II - Analytical tools\Codes\GDS TX\Code';

% Load the input file as a table named "in" with tab delimiter and comma decimal separator
cd(in_dir)
in = dir('**/*.gds');
plan = dir('**/*.pln');
phase = dir('**/*.tst');
in = readtable(fullfile(in_dir, in.name), 'Delimiter', ',', 'DecimalSeparator', ',', 'FileType','text', 'VariableNamingRule','preserve'); 

% % The code should be developed for automating on plan n phase:
% plan = readtable(fullfile(in_dir_plan, plan.name), 'Delimiter', ',', 'DecimalSeparator', ',', 'FileType','text', 'VariableNamingRule','preserve'); 
% phase = phase(7,1);    %%%%%%%%%%%%%%%%% 7 %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% phase = readtable(fullfile(in_dir_plan, phase.name), 'Delimiter', ',', 'DecimalSeparator', ',', 'FileType','text', 'VariableNamingRule','preserve'); 

% phase_no = input('Enter the number of the phase: ');
%% Plots:
cd(code_dir)
res = 300; % resolution
axLim_factor = 0.00001;
for phase_no = 21 : length(phase)
    fncPlots(in,phase_no,out_dir,res,axLim_factor);
end
