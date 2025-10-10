clc;
clear all;
close all;

load('MicroCTDiamaterData.mat')


Particle_d10_4hr = prctile(particle_4hr,10);
Particle_d50_4hr = prctile(particle_4hr,50);
Particle_d90_4hr = prctile(particle_4hr,90);

Particle_d10_8hr = prctile(particle_8hr,10);
Particle_d50_8hr = prctile(particle_8hr,50);
Particle_d90_8hr = prctile(particle_8hr,90);


Particle_d10_24hr= prctile(particle_24hr,10);
Particle_d50_24hr = prctile(particle_24hr,50);
Particle_d90_24hr = prctile(particle_24hr,90);


Void_d10_4hr = prctile(void_4hr,10);
Void_d50_4hr = prctile(void_4hr,50);
Void_d90_4hr = prctile(void_4hr,90);

Void_d10_8hr = prctile(void_8hr,10);
Void_d50_8hr = prctile(void_8hr,50);
Void_d90_8hr = prctile(void_8hr,90);


Void_d10_24hr = prctile(void_24hr,10);
Void_d50_24hr = prctile(void_24hr,50);
Void_d90_24hr = prctile(void_24hr,90);


% --- Create the histogram for Particle Sizes ---
figure(7);
hold on;
h1 = histogram(particle_4hr);
h2 = histogram(particle_8hr);
h3 = histogram(particle_24hr);
hold off;

% Customize the plot
title('Particle Size Distribution for All Samples');
xlabel('Equivalent Diameter [mm]');
ylabel('Frequency');
legend('4-hour', '8-hour', '24-hour');
legend boxoff
grid off;

% Make histograms semi-transparent for better visibility of overlaps
h1.FaceAlpha = 0.6;
h2.FaceAlpha = 0.6;
h3.FaceAlpha = 0.6;

% --- Matlab was making the bin sizes inconitent by default for the two
% void plots, so I used chatgpt to help me hardcod the sizing for the bins
% CONSISTENT BIN EDGES FOR VOID SIZES ---
% Determine the overall range for void sizes based on the desired x-limit
% (0 to 0.14*1000 = 140 microns).
min_void_size = 0;
max_void_size = 140 ;microns
bin_width = 10; % Choose a fixed bin width, e.g., 5 microns, for consistency

% Create the consistent bin edges vector
custom_void_bin_edges = min_void_size:bin_width:max_void_size;

% --- Create the histogram for Void Sizes (Frequency) ---
figure(8);
hold on;
% Use the 'BinEdges' property for a consistent bin size across all data sets
h4 = histogram(void_4hr, 'BinEdges', custom_void_bin_edges);
h5 = histogram(void_8hr, 'BinEdges', custom_void_bin_edges);
h6 = histogram(void_24hr, 'BinEdges', custom_void_bin_edges);
hold off;

% Customize the plot
title('Void Size Distribution for All Samples');
xlabel('Equivalent Diameter [μm]'); % Changed from [mm] to [μm] for consistency with values
ylabel('Frequency');
legend('4-hour', '8-hour', '24-hour');
legend boxoff
grid off;

% Make histograms semi-transparent for better visibility of overlaps
h4.FaceAlpha = 0.6;
h5.FaceAlpha = 0.6;
h6.FaceAlpha = 0.6; 



%% ---- Particle Size Probability (adds to 100%) ----
figure(9);
hold on;
h1 = histogram(particle_4hr,'Normalization','probability');
h2 = histogram(particle_8hr, 'Normalization','probability');
h3 = histogram(particle_24hr,'Normalization','probability');
hold off;


title('Particle Size Distribution (Probability Histogram)');
xlabel('Equivalent Diameter [μm]');
ylabel('Relative Frequency (%)');
legend('4-hour','8-hour','24-hour');
grid off;
legend boxoff
h1.FaceAlpha=0.6; h2.FaceAlpha=0.6; h3.FaceAlpha=0.6;
yt = yticks; % scale y-axis to percent
yticklabels(string(yt*100))

%% pull in the new data
figure(10);
hold on;
histogram(particle_B211, 'Normalization','probability', ...
    'FaceAlpha',0.5,'FaceColor','b','LineStyle' ,'--','LineWidth', 2,'DisplayName','B211'); 
histogram(particle_B45,  'Normalization','probability', ...
    'FaceAlpha',0.5,'FaceColor','g','LineStyle' ,':','LineWidth', 2,'DisplayName','B45'); 
histogram(particle_B611, 'Normalization','probability', ...
    'FaceAlpha',0.5,'FaceColor','r','LineStyle' ,'-','LineWidth', 2,'DisplayName','B611'); 
hold off;

% title('Particle Size Distribution (Probability Histogram)');
xlabel('Equivalent Diameter [μm]');
ylabel('Relative Frequency (%)');
legend('4-hour','8-hour','24-hour');
grid off;
legend boxoff
h1.FaceAlpha=0.6; h2.FaceAlpha=0.6; h3.FaceAlpha=0.6;
yt = yticks; 
yticklabels(string(yt*100));

figure(4);
hold on;
% Use the 'BinEdges' property here too
h4 = histogram(void_4hr, 'Normalization', 'probability', 'BinEdges', custom_void_bin_edges);
h5 = histogram(void_8hr, 'Normalization', 'probability', 'BinEdges', custom_void_bin_edges);
h6 = histogram(void_24hr, 'Normalization', 'probability', 'BinEdges', custom_void_bin_edges);
hold off;

title('Void Size Distribution (Probability Histogram)');
xlabel('Equivalent Diameter [μm]');
ylabel('Relative Frequency (%)');
legend('4-hour','8-hour','24-hour');
legend boxoff
grid off;
h4.FaceAlpha=0.6; h5.FaceAlpha=0.6; h6.FaceAlpha=0.6;
yt = yticks;
yticklabels(string(yt*100));

%% ---- Particle Size CDF (line plot) ----
figure(5); hold on;
h1 = cdfplot(particle_4hr);
h2 = cdfplot(particle_8hr);
h3 = cdfplot(particle_24hr);

set([h1 h2 h3], 'LineWidth', 2);

title('Particle Size CDF (Cumulative Distribution Function)');
xlabel('Equivalent Diameter [μm]');
ylabel('CDF');
legend('4-hour','8-hour','24-hour','Location','best');
legend boxoff
grid off;
ylim([0 1.02])


%% ---- Void Size CDF (line plot) ----
figure(6); hold on;
h4 = cdfplot(void_4hr);
h5 = cdfplot(void_8hr);
h6 = cdfplot(void_24hr);

set([h4 h5 h6], 'LineWidth', 2);

title('Void Size CDF (Cumulative Distribution Function)');
xlabel('Equivalent Diameter [μm]');
ylabel('CDF');
legend('4-hour','8-hour','24-hour','Location','best');
legend boxoff
xlim([0 0.14*1000]);
ylim([0 1.02])
 grid off;



