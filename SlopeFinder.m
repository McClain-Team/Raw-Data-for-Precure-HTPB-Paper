function [R_squared,slope,MaxStress]=SlopeFinder(Sample_Strain,Sample_Stress)


%My code was a bit buggy, so I asked chatgpt to help clean up the data
%collection. Refer to this link for refrence 
%https://chatgpt.com/share/67a239f7-94bc-800c-b458-bade45142836


%I ran through the images and found the earliest region where the data is
%linear after it starts, and hardcoded the values here. 
MinPercentStrain=0.02;%(20/100)*max(Sample_Strain);
MaxPercentStrain=0.035;%(50/100)*max(Sample_Strain);


SlopeStrain = [];
SlopeStress = [];
Slope = [];


for i = 1:100:length(Sample_Strain)
    if MinPercentStrain <= Sample_Strain(i) && Sample_Strain(i) <= MaxPercentStrain
        SlopeStrain(end+1) = Sample_Strain(i); % Append values dynamically
        SlopeStress(end+1) = Sample_Stress(i);

      
    end
end


for i = 1:length(SlopeStrain) - 1
    deltaStrain = SlopeStrain(i + 1) - SlopeStrain(i);
    deltaStress = SlopeStress(i + 1) - SlopeStress(i);

 
end

MaxStress=max(Sample_Stress);

% Perform linear regression: fit line y = a*x + b
coeffs = polyfit(SlopeStrain, SlopeStress, 1);  % Linear fit
slope = coeffs(1);
intercept = coeffs(2);

% Compute predicted stress values and R²
predictedStress = polyval(coeffs, SlopeStrain);
SStotal = sum((SlopeStress - mean(SlopeStress)).^2);
SSres = sum((SlopeStress - predictedStress).^2);
R_squared = 1 - (SSres / SStotal);

% % Display results
% fprintf('Linear Region Slope: %.4f MPa/Strain\n', slope);
% fprintf('R^2 Value: %.4f\n', R_squared);

% 
% figure ()
% hold on
% plot (Sample_Strain,Sample_Stress,'b','LineWidth',3)
% plot (SlopeStrain,SlopeStress,'r','LineWidth',3)
% title('QuickVisualCheck ')
% legend({'real data','slope'})
% ylabel('Stress [MPa]')
% xlabel('Strain')
% hold off
% grid on
% 
% 
% figure (2)
% hold on
% plot (Slope,'b','LineWidth',3)
% % plot (SlopeStrain,SlopeStress,'r','LineWidth',3)
% title('Slope ')
% % legend({'real data','slope'})
% ylabel('Stress [MPa]')
% xlabel('Strain')
% hold off
% grid on


end