function [sz, zs] = plotauc(filedir)
%PLOTAUC Function take input as a string showing the directory of
%spreadsheet input file
%Example use: plotauc("ZnS_dopedMn_Chitosan.xlsx");
% Notice the file is in the same folder of the fuction

[values,labels]=xlsread(filedir,-1);

subplot(2,1,1)
hold on
AbsorbancePlot = plot(values(:,1),values(:,2:end));
legend(AbsorbancePlot, labels(2:end))
hold off
title("Absorbance spectra")
xlabel("Wavelength(nm)") 
ylabel("Absorbance(a.u.)") 

energy = 1240./values(:,1);
%DefiningTemporaryVariablesForCalculating
%Kamaraj, Eswaran. (2018). Re: How to draw Tauc plot from absorbance spectrum for ZnO nanoparticles?. Retrieved from: https://www.researchgate.net/post/How_to_draw_Tauc_plot_from_absorbance_spectrum_for_ZnO_nanoparticles/5c18975d979fdc16f545ba07/citation/download. 
C = 100 - values(:,2:end);
E = values(:,2:end).*values(:,2:end);
F = 2*C;
G = E./F;
H = repmat(energy,1,size(G,2));

sz = size( G );
disp(sz);
zs = size( H );
disp(zs);

I = G.*H;
xx = sqrt(I);

subplot(2,1,2)
hold on
Tauc = plot(energy,xx);
xlim([0 4])
legend(Tauc, labels(2:end))
hold off
title("Tauc plot")
xlabel("Energy(eV)")
ylabel("(\alpha hv)^2") 

end

