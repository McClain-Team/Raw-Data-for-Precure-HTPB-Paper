function [CStrain,CStress]=ZeroingData(Sample_Strain,Sample_Stress,NewZero)



j=1;
strainCleanData= zeros(1,length(Sample_Strain));
stressCleanData= zeros(1,length(Sample_Stress));



for i=1:length(Sample_Stress)

    if  Sample_Stress(i)>NewZero

        if j==1

            B0Stress=Sample_Stress(i);
            B0Strain=Sample_Strain(i);


            j=2;
        end

        CStrain(i)=Sample_Strain(i)-B0Strain;
        CStress(i)=Sample_Stress(i)-B0Stress;

    end
   
end


end
