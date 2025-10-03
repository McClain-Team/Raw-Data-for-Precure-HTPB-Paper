 function [Strain,Stress]=ComputeStressStrain(Load,Position,H,A)
%Note, I am using True Strain as it seems to be generally more common for
%plastics 
fc=.1; %cut off frequency 
fs= 100;% kHz sampling frequency, 
n_order=2 ;   %' filter order'


[b,a]=butter(n_order,fc/(fs/2));

Load_filt=filtfilt(b,a,Load);%this prevents the data from shifting
Position_filt=filtfilt(b,a,Position);
%Time_filt=filtfilt(b,a,Time);

for i=1:length(Load_filt)
    LoadReal(i)=abs(Load_filt(i));
    PositionReal(i)=abs(Position_filt(i));
    Strain(i)=(PositionReal(i))/H; 
  
    Stress(i)=LoadReal(i)/A;

end


