clear all;
clc;
close all;


load('Paper1CompressionData.mat')



% 2 Hour Oven 
[H2_2_Strain,H2_2_Stress]=ComputeStressStrain(H2_2_Load,H2_2_Position,H2_2_H,H2_2__A);
[H2_4_Strain,H2_4_Stress]=ComputeStressStrain(H2_4_Load,H2_4_Position,H2_4_H,H2_4_A);
[H2_5_Strain,H2_5_Stress]=ComputeStressStrain(H2_5_Load,H2_5_Position,H2_5_H,H2_5_A);

[H2_2_Strain,H2_2_Stress]=ZeroingData(H2_2_Strain,H2_2_Stress, 0.00154624); %This value is hardcoded based on when the head stopped traveling and it actully started compressing the pellet and collecting real data
[H2_4_Strain,H2_4_Stress]=ZeroingData(H2_4_Strain,H2_4_Stress, 0.00788157);
[H2_5_Strain,H2_5_Stress]=ZeroingData(H2_5_Strain,H2_5_Stress, 0.00918299);


[H2_02_R_squared,H2_02_Slope, H2_02_MaxStress]=SlopeFinder(H2_2_Strain,H2_2_Stress);
[H2_04_R_squared,H2_04_Slope,H2_04_MaxStress]=SlopeFinder(H2_4_Strain,H2_4_Stress);
[H2_05_R_squared,H2_05_Slope,H2_05_MaxStress]=SlopeFinder(H2_5_Strain,H2_5_Stress);


figure (1)
hold on
plot (H2_2_Strain,H2_2_Stress,'LineWidth',3)
plot (H2_4_Strain,H2_4_Stress,'LineWidth',3)
plot (H2_5_Strain,H2_5_Stress,'LineWidth',3)
title('Stress Strain Batch 2 2 hour 0 Freezer')
legend({'H2.02','H2.04', 'H2.05'})
ylabel('Stress [MPa]')
xlabel('Strain')
hold off
grid on


% 4 Hour Oven
[H4_1_Strain,H4_1_Stress]=ComputeStressStrain(H4_1_Load,H4_1_Position,H4_1_H,H4_1_A);
[H4_2_Strain,H4_2_Stress]=ComputeStressStrain(H4_2_Load,H4_2_Position,H4_2_H,H4_2_A);
[H4_3_train,H4_3_tress]=ComputeStressStrain(H4_3_Load,H4_3_Position,H4_3_H,H4_3_A);
[H4_4_Strain,H4_4_Stress]=ComputeStressStrain(H4_4_Load,H4_4_Position,H4_4_H,H4_4_A);
[H4_5_Strain,H4_5_Stress]=ComputeStressStrain(H4_5_Load,H4_5_Position,H4_5_H,H4_5_A);

[H4_1_Strain,H4_1_Stress]=ZeroingData(H4_1_Strain,H4_1_Stress,0.00729874);
[H4_2_Strain,H4_2_Stress]=ZeroingData(H4_2_Strain,H4_2_Stress, 0.00925226);
[H4_3_train,H4_3_tress]=ZeroingData(H4_3_train,H4_3_tress, 0.0349463);
[H4_4_Strain,H4_4_Stress]=ZeroingData(H4_4_Strain,H4_4_Stress, 0.0079572);
[H4_5_Strain,H4_5_Stress]=ZeroingData(H4_5_Strain,H4_5_Stress, 0.0262768);


[H4_1_R_squared,H4_1_Slope, H4_1_MaxStress]=SlopeFinder(H4_1_Strain,H4_1_Stress);
[H4_2_R_squared,H4_2_lope, H4_2_MaxStress]=SlopeFinder(H4_2_Strain,H4_2_Stress);
[H4_3_R_squared,H4_3_Slope, H4_3_MaxStress]=SlopeFinder(H4_3_train,H4_3_tress);
[H4_4_R_squared,H4_4_Slope, H4_4_MaxStress]=SlopeFinder(H4_4_Strain,H4_4_Stress);
[H4_5_SR_squared,H4_5_SSlope, H4_5_SMaxStress]=SlopeFinder(H4_5_Strain,H4_5_Stress);



figure (2)
hold on
plot (H4_1_Strain,H4_1_Stress,'LineWidth',3)
plot (H4_2_Strain,H4_2_Stress,'LineWidth',3)
plot (H4_3_train,H4_3_tress,'LineWidth',3)
plot (H4_4_Strain,H4_4_Stress,'LineWidth',3)
plot (H4_5_Strain,H4_5_Stress,'LineWidth',3)
title('Stress Strain Batch 2 4 hour')
legend({'H4.1','H4.2','H4.3','H4.4', 'H4.5'})
ylabel('Stress [MPa]')
xlabel('Strain')
hold off
grid on



%Stress Strain Batch 4 8 hour Oven'

[H8_3__Strain,B4_3_Stress]=ComputeStressStrain(H8_3_Load,H8_3_Position,H8_3_H,H8_3_A);
[H8_6_Strain,H8_6_Stress]=ComputeStressStrain(H8_6_Load,H8_6_Position,H8_6_H,H8_6_A);
[H8_7_Strain,H8_7_Stress]=ComputeStressStrain(H8_7_Load,H8_7_Position,H8_7_H,H8_7_A);

[H8_3__Strain,B4_3_Stress]=ZeroingData(H8_3__Strain,B4_3_Stress,0.00453074);
[H8_6_Strain,H8_6_Stress]=ZeroingData(H8_6_Strain,H8_6_Stress,0.00538672);
[H8_7_Strain,H8_7_Stress]=ZeroingData(H8_7_Strain,H8_7_Stress,0.00142772);

[H8_3_R_squared,H8_3_Slope, H8_3_MaxStress]=SlopeFinder(H8_3__Strain,B4_3_Stress);
[H8_6_R_squared,H8_6_Slope, B4_6_MaxStress]=SlopeFinder(H8_6_Strain,H8_6_Stress);
[H8_7_R_squared,H8_7_Slope, H8_7_MaxStress]=SlopeFinder(H8_7_Strain,H8_7_Stress);


figure (3)
hold on
plot (H8_3__Strain,B4_3_Stress, 'r','LineWidth',3)
plot (H8_6_Strain,H8_6_Stress, 'g','LineWidth',3)
plot (H8_7_Strain,H8_7_Stress, 'k','LineWidth',3)
title('Stress Strain Batch 4 8 hour Oven')
legend({'H8.3', 'H8.6','H8.7'})
ylabel('Stress [MPa]')
xlabel('Strain')
grid on
hold off


%Stress Strain Batch 4, 12 hour Oven

[H12_1_Strain,H12_1_Stress]=ComputeStressStrain(H12_1_Load,H12_1_Position,H12_1_H,H12_1_A);
[H12_2_Strain,H12_2_Stress]=ComputeStressStrain(H12_2_Load,H12_2_Position,H12_2_H,H12_2_A);
[H12_3_Strain,H12_3_Stress]=ComputeStressStrain(H12_3_Load,H12_3_Position,H12_3_H,H12_3_A);
[H12_4_Strain,H12_4_Stress]=ComputeStressStrain(H12_4_Load,H12_4_Position,H12_4_H,H12_4_A);
[H12_5_Strain,H12_5_Stress]=ComputeStressStrain(H12_5_Load,H12_5_Position,H12_5_H,H12_5_A);
[H12_7_Strain,H12_7_Stress]=ComputeStressStrain(H12_7_Load,H12_7_Position,H12_7_H,H12_7_A);


[H12_1_Strain,H12_1_Stress]=ZeroingData(H12_1_Strain,H12_1_Stress,0.00186004);
[H12_2_Strain,H12_2_Stress]=ZeroingData(H12_2_Strain,H12_2_Stress,0.00806454);
[H12_3_Strain,H12_3_Stress]=ZeroingData(H12_3_Strain,H12_3_Stress,0.0079428);
[H12_4_Strain,H12_4_Stress]=ZeroingData(H12_4_Strain,H12_4_Stress,0.00810776);
[H12_5_Strain,H12_5_Stress]=ZeroingData(H12_5_Strain,H12_5_Stress,0.00825225);
[H12_7_Strain,H12_7_Stress]=ZeroingData(H12_7_Strain,H12_7_Stress,0.00721807);


[H12_1_R_squared,H12_1_Slope, H12_1_MaxStress]=SlopeFinder(H12_1_Strain,H12_1_Stress);
[H12_2_R_squared,H12_2_Slope, H12_2_MaxStress]=SlopeFinder(H12_2_Strain,H12_2_Stress);
[H12_3_R_squared,H12_3_Slope, H12_3_MaxStress]=SlopeFinder(H12_3_Strain,H12_3_Stress);
[H12_4_R_squared,H12_4_Slope, H12_4_MaxStress]=SlopeFinder(H12_4_Strain,H12_4_Stress);
[H12_5_R_squared,H12_5_Slope, H12_5_MaxStress]=SlopeFinder(H12_5_Strain,H12_5_Stress);
[H12_7_R_squared,H12_7_Slope, H12_7_MaxStress]=SlopeFinder(H12_7_Strain,H12_7_Stress);


figure (4)
hold on
plot (H12_1_Strain,H12_1_Stress, 'r','LineWidth',3)
plot (H12_2_Strain,H12_2_Stress, 'b','LineWidth',3)
plot (H12_3_Strain,H12_3_Stress, 'g','LineWidth',3)
plot (H12_4_Strain,H12_4_Stress, 'k','LineWidth',3)
plot (H12_5_Strain,H12_5_Stress, 'c','LineWidth',3)
plot (H12_7_Strain,H12_7_Stress, 'm','LineWidth',3)
title('Stress Strain Batch 4, 12 hour Oven')
legend({'H12.1','H12.2', 'H12.3','H12.4','H12.5','H12.7'})
ylabel('Stress [MPa]')
xlabel('Strain')
grid on
hold off


% B4 24 hour stuff

[H24_1_Strain,H24_1_Stress]=ComputeStressStrain(H24_1_Load,H24_1_Position,H24_1_H,H24_1_A);
[H24_2_Strain,BH24_2_Stress]=ComputeStressStrain(H24_2_Load,H24_2_Position,H24_2_H,H24_2_A);

[H24_1_Strain,H24_1_Stress]=ZeroingData(H24_1_Strain,H24_1_Stress,0.00687283);
[H24_2_Strain,BH24_2_Stress]=ZeroingData(H24_2_Strain,BH24_2_Stress,0.00320491);

[H24_1_R_squared,H24_1_Slope, H24_1_MaxStress]=SlopeFinder(H24_1_Strain,H24_1_Stress);
[H24_2_R_squared,H24_2_Slope, H24_2_MaxStress]=SlopeFinder(H24_2_Strain,BH24_2_Stress);


figure (5)
hold on
plot (H24_1_Strain,H24_1_Stress, 'r','LineWidth',3)
plot (H24_2_Strain,BH24_2_Stress, 'b','LineWidth',3)
title('Stress Strain Batch 4, 24 hour Oven in mineral oild')
legend({'B4.16','B4.17'})
ylabel('Stress [MPa]')
xlabel('Strain')
grid on
hold off


%Batch 6
[H24_5_Strain,H24_5_Stress]=ComputeStressStrain(H24_5_Load,H24_5_Position,H24_5_H,H24_5_A);
[H24_6_Strain,H24_6_Stress]=ComputeStressStrain(H24_6_Load,H24_6_Position,H24_6_H,H24_6_A);
[H24_7_Strain,H24_7_Stress]=ComputeStressStrain(H24_7_Load,H24_7_Position,H24_7_H,H24_7_A);
[H24_9_Strain,H24_9_Stress]=ComputeStressStrain(H24_9_Load,H24_9_Position,H24_9_H,H24_9_A);


[H24_5_Strain,H24_5_Stress]=ZeroingData(H24_5_Strain,H24_5_Stress,0.0071902);
[H24_6_Strain,H24_6_Stress]=ZeroingData(H24_6_Strain,H24_6_Stress,0.00243706);
[H24_7_Strain,H24_7_Stress]=ZeroingData(H24_7_Strain,H24_7_Stress,0.00714673);
[H24_9_Strain,H24_9_Stress]=ZeroingData(H24_9_Strain,H24_9_Stress,0.00147107);


[H24_5_R_squared,H24_5_Slope, H24_5_MaxStress]=SlopeFinder(H24_5_Strain,H24_5_Stress);
[H24_6_R_squared,H24_6_Slope, B6_2_MaxStress]=SlopeFinder(H24_6_Strain,H24_6_Stress);
[H24_7_R_squared,H24_7_Slope, H24_7_MaxStress]=SlopeFinder(H24_7_Strain,H24_7_Stress);
[H24_9_R_squared,H24_9_Slope, H24_9_MaxStress]=SlopeFinder(H24_9_Strain,H24_9_Stress);




%represenitive curve
figure (6)
hold on
plot (H24_5_Strain,H24_5_Stress, 'r','LineWidth',3)
plot (H24_6_Strain,H24_6_Stress, 'b','LineWidth',3)
plot (H24_7_Strain,H24_7_Stress, 'g','LineWidth',3)
plot (H24_9_Strain,H24_9_Stress, 'k','LineWidth',3)
title('Stress Strain Batch 6, 24 hour Oven')
legend({'B6.1','B6.2','B6.3','B6.5'})
ylabel('Stress [MPa]')
xlabel('Strain')
grid on
hold off









%Color Plot

figure (25)
hold on

plot (H2_5_Strain,H2_5_Stress,'LineWidth',3, 'Color', 'r')
plot (H4_2_Strain,H4_2_Stress,'LineWidth',3, 'Color', 'b')
plot (H8_7_Strain,H8_7_Stress,'LineWidth',3, 'Color', 'g')
plot (H12_4_Strain,H12_4_Stress,'LineWidth',3, 'Color','k')
plot (H24_6_Strain,H24_6_Stress, 'LineWidth',3, 'Color','m')

legend({ '2 hour','4 hour' ,'8 hour', '12 hour','24 hour'})
legend boxoff
ylabel('Stress [MPa]')
xlabel('Strain')
xlim([0 0.55])
hold off
% grid on

