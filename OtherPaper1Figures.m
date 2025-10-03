clc;
clear all;
close all;

load('MiscStatsPaper1.mat')


figure(1)
hold on

% Plot average TMD with error bars (standard deviation)
errorbar(CureTime, AvTMD, STDTMD, 'k*', 'LineWidth', 2, 'MarkerSize', 8)

% title('Percent Theoretical Maximum Density vs Cure Time')
xlabel('Partial Cure Time [hr]')
ylabel(' %TMD ')
% grid on
% legend boxoff;
box on

% Optional: improve formatting
set(gca, 'FontSize', 12)




figure(2);
clf; 
hold on;

% --- CHANGE 1: Spacing out the data ---
spacing_factor = 2; % Adjust this value to control spacing between groups
x_locations = (1:length(CureTime)) * spacing_factor; 

% Define bar properties
bar_width = 0.42; 
offset = bar_width ;

% === LEFT Y-AXIS: Max Stress ===
yyaxis left;
b1 = bar(x_locations - offset, AVMaxStress, bar_width, ...
    'FaceColor', [1 0 0], ...         % red fill
    'EdgeColor', 'k', ...             % black border
    'LineWidth', 1.5);
x_stress_centers = b1.XEndPoints;

% Error bars for Stress (red solid)
errorbar(x_stress_centers, AVMaxStress, STDMaxStress, ...
    'k', 'LineStyle', 'none', 'LineWidth', 1.5);

ylabel('Max Stress [MPa]', 'Color', 'r');
set(gca, 'YColor', 'r');
ylim([0, 3.5]); 

% === RIGHT Y-AXIS: Modulus of Elasticity ===
yyaxis right;
b2 = bar(x_locations + offset, AVYModulus, bar_width, ...
    'FaceColor', [0.3 0.6 1], ...         % blue fill
    'EdgeColor', 'k', ...             % black border
    'LineWidth', 1.5);
x_modulus_centers = b2.XEndPoints;

% Error bars for Modulus (blue solid)
errorbar(x_modulus_centers, AVYModulus, STDYModulus, ...
    'k', 'LineStyle', 'none', 'LineWidth', 1.5);

ylabel('Modulus of Elasticity [MPa]', 'Color', 'b');  
set(gca, 'YColor', '0.3 0.6 1');
ylim([0, 60]); 

% === Common formatting ===
xlabel('Partial Cure Time [hr]');
box on;
set(gca, 'FontSize', 12);
set(gca, 'XColor', 'k');

xticks(x_locations);
xticklabels(CureTime);

x_min = min(x_locations) - (bar_width*1.5);
x_max = max(x_locations) + (bar_width*1.5);
xlim([x_min-1, x_max+1]);

legend([b1, b2], 'Max Stress', 'Modulus of Elasticity', 'Location', 'best');
legend boxoff;
hold off;



figure(3);
clf; 
hold on;

% --- CHANGE 1: Spacing out the data ---
spacing_factor = 2; 
x_locations = (1:length(CureTime)) * spacing_factor; 

bar_width = 0.42; 
offset = bar_width ;

% === LEFT Y-AXIS: Height ===
yyaxis left;
b1 = bar(x_locations - offset, AvHeight, bar_width, ...
    'FaceColor', [1 0 0], ...         % red fill
    'EdgeColor', 'k', ...
    'LineWidth', 1.5);
x_height_centers = b1.XEndPoints;

% Error bars for Height (red)
errorbar(x_height_centers, AvHeight, STDHeight, ...
    'k', 'LineStyle', 'none', 'LineWidth', 1.5);

ylabel('Height [mm]', 'Color', 'r');
set(gca, 'YColor', 'r');
ylim([0, 15]); 

% === RIGHT Y-AXIS: Base Area ===
yyaxis right;
b2 = bar(x_locations + offset, AvBaseArea, bar_width, ...
    'FaceColor', [0.3 0.6 1], ...         % blue fill
    'EdgeColor', 'k', ...
    'LineWidth', 1.5);
x_area_centers = b2.XEndPoints;

% Error bars for Base Area (blue)
errorbar(x_area_centers, AvBaseArea, STDBaseArea, ...
    'k', 'LineStyle', 'none', 'LineWidth', 1.5);

ylabel('Base Area [mm^2]', 'Color', '0.3 0.6 1');  
set(gca, 'YColor', 'b');
ylim([90, 140]); 

% === Common formatting ===
xlabel('Partial Cure Time [hr]');
box on;
set(gca, 'FontSize', 12);
set(gca, 'XColor', 'k');

xticks(x_locations);
xticklabels(CureTime);

x_min = min(x_locations) - (bar_width*1.5);
x_max = max(x_locations) + (bar_width*1.5);
xlim([x_min-1, x_max+1]);

legend([b1, b2], 'Height', 'Base Area', 'Location', 'best');
legend boxoff;
hold off;




save('MiscStatsPaper1.mat', ...
'CureTime',...
 'AvD',... %average density 
'AvTMD',... %average theoretical max density
'AVMaxStress',... %average max stress
'AVYModulus',... %average youngs modulus
'AvHeight',... %average height
'AvBaseArea',... %average base area
 'STDD',...%standard deviation for density 
'STDTMD',...%standard deviation for theortical max density
'STDMaxStress',...%standard deviation for max stress
'STDYModulus',...%standard deviation for youngs modulus
'STDHeight',...%standard deviation for height
'STDBaseArea')   %standard deviation for base area
