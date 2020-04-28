clc
clear

load('Tunnel Testing\2020-01-30\30-Jan-2020 16.15.50_Scorpion_KDE_T-Motor 18in_RPM3000_Alpha0_20.7492.mat', ... % Alpha 0, 0.2889
    'Angle', 'lbf_N', 'FT', 'rho', 'valDIAM', 'valRPM', 'vecPOS_TUNNEL_OG', 'dataRate');

% load('Tunnel Testing\2020-02-11\11-Feb-2020 17.06.36_Scorpion_KDE_T-Motor 18in_RPM3000_Alpha15_15.175.mat', ... % Alpha 15, 0.2113
%     'Angle', 'lbf_N', 'FT', 'rho', 'valDIAM', 'valRPM', 'vecPOS_TUNNEL_OG', 'dataRate');

%% Tunnel
CT_tunnel_raw = lbf_N.*FT(:,3);
CT_tunnel_raw = CT_tunnel_raw./(rho.*(pi.*((valDIAM/2).^2)).*(((valDIAM/2).*(valRPM.*(pi/30))).^2));

Fp = 1/dataRate;
Fst = 413/(dataRate/2);
d = fdesign.lowpass('N,Fc,Ap,Ast',1000,Fst,1,50);

Hd = design(d);
CT_tunnel2 = filtfilt(Hd.Numerator,1,detrend(CT_tunnel_raw)) + mean(CT_tunnel_raw);

binAng = linspace(0, 360, 30);
binAvg = [];
binMax = [];
binMin = [];
for i = 1:length(binAng)
    rng = 0.25;
    idx = vecPOS_TUNNEL_OG >= binAng(i) - rng & vecPOS_TUNNEL_OG <= binAng(i) + rng;
    binAvg(i) = mean(CT_tunnel2(idx));
    binMax(i) = max(CT_tunnel2(idx));
    binMin(i) = min(CT_tunnel2(idx));
end

hFig3 = figure(3);
clf(3);

hold on
plot(binAng, binAvg, '-.^m');
hold off

%% DDE Relaxed
% load('Alpha 15 Results/New/TMotor_Fixed_J0.2113_0.00025.mat', 'CT_U', 'CT', 'valDELTIME', 'matDVE', 'matVLST', 'vecHUB', 'vecDVESURFACE', 'matDGAMMADT', 'matINTCIRC', 'vecTEDVE', 'valMAXTIME', 'matSPANDIR', 'valRPM', 'vecDVETHRUST')
% load('Alpha 15 Results/New/TMotor_Fixed_J0.2113_0.00025.mat', 'CT_U', 'CT', 'valDELTIME', 'matDVE', 'matVLST', 'vecHUB', 'vecDVESURFACE', 'matDGAMMADT', 'matINTCIRC', 'vecTEDVE', 'valMAXTIME', 'matSPANDIR', 'valRPM', 'vecDVETHRUST')
load('Alpha 0 Results/New/TMotor_Fixed_J0.3_0.00025.mat', 'CT_U', 'CT', 'valDELTIME', 'matDVE', 'matVLST', 'vecHUB', 'vecDVESURFACE', 'matDGAMMADT', 'matINTCIRC', 'vecTEDVE', 'valMAXTIME', 'matSPANDIR', 'valRPM', 'vecDVETHRUST')
% load('Alpha 0 Results/New/TMotor_Relaxed_J0.3_0.001.mat', 'CT_U', 'CT', 'valDELTIME', 'matDVE', 'matVLST', 'vecHUB', 'vecDVESURFACE', 'matDGAMMADT', 'matINTCIRC', 'vecTEDVE', 'valMAXTIME', 'matSPANDIR', 'valRPM', 'vecDVETHRUST')

CT_U = CT

deg_per_ts = valRPM.*(pi/30).*(180/pi).*valDELTIME;
tmp_offset = 0;
vecPOS_R = [tmp_offset:(length(CT_U)-1 + tmp_offset)]'.*deg_per_ts + 90;
vecPOS = mod(vecPOS_R,360);

binAng = linspace(0, 355.5, 80);
binAvg = [];
binMax = [];
binMin = [];

% idx = [1:80, 225:245, 265:285]
idx = [1:80]
CT_U(idx) = nan;

for i = 1:length(binAng)/2
    rng = 1;
%     idx = vecPOS >= binAng(i) - rng & vecPOS <= binAng(i) + rng;
    idx = (vecPOS >= binAng(i) - rng & vecPOS <= binAng(i) + rng) |...
        (vecPOS >= binAng(i) - rng + 180 & vecPOS <= binAng(i) + rng + 180);
    if any(idx)
        binAvg(i) = nanmean(CT_U(idx));
        binMax(i) = nanmax(CT_U(idx));
        binMin(i) = nanmin(CT_U(idx));
    else
        binAvg(i) = nan;
        binMax(i) = nan;
        binMin(i) = nan;       
    end
end
binAvg = repmat(binAvg, 1, 2);
% binAng = [binAng binAng + 180];

binAng = binAng(~isnan(binAvg));
binAvg = binAvg(~isnan(binAvg));

hold on
plot(binAng, binAvg, '-.r');
hold off

% %% DDE Relaxed
% load('Alpha 0 Results/New/TMotor_Relaxed_J0.3_0.00025.mat', 'CT_U', 'CT', 'valDELTIME', 'matDVE', 'matVLST', 'vecHUB', 'vecDVESURFACE', 'matDGAMMADT', 'matINTCIRC', 'vecTEDVE', 'valMAXTIME', 'matSPANDIR', 'valRPM', 'vecDVETHRUST')
% % load('Alpha 15 Results/New/TMotor_Relaxed_J0.2113_0.00025.mat', 'CT_U', 'CT', 'valDELTIME', 'matDVE', 'matVLST', 'vecHUB', 'vecDVESURFACE', 'matDGAMMADT', 'matINTCIRC', 'vecTEDVE', 'valMAXTIME', 'matSPANDIR', 'valRPM', 'vecDVETHRUST')
% 
% deg_per_ts = valRPM.*(pi/30).*(180/pi).*valDELTIME;
% tmp_offset = 0;
% vecPOS_R = [tmp_offset:(length(CT_U)-1 + tmp_offset)]'.*deg_per_ts + 90;
% vecPOS = mod(vecPOS_R,360);
% 
% binAng = linspace(0, 355.5, 80);
% binAvg = [];
% binMax = [];
% binMin = [];
% 
% idx = [1:80, 225:245, 265:285]
% % idx = [1:240]
% 
% CT_U(idx) = nan;
% 
% for i = 1:length(binAng)/2
%     rng = 1;
% %     idx = vecPOS >= binAng(i) - rng & vecPOS <= binAng(i) + rng;
%     idx = (vecPOS >= binAng(i) - rng & vecPOS <= binAng(i) + rng) |...
%         (vecPOS >= binAng(i) - rng + 180 & vecPOS <= binAng(i) + rng + 180);
%     if any(idx)
%         binAvg(i) = nanmean(CT_U(idx));
%         binMax(i) = nanmax(CT_U(idx));
%         binMin(i) = nanmin(CT_U(idx));
%     else
%         binAvg(i) = nan;
%         binMax(i) = nan;
%         binMin(i) = nan;       
%     end
% end
% binAvg = repmat(binAvg, 1, 2);
% % binAng = [binAng binAng + 180];
% 
% binAng = binAng(~isnan(binAvg));
% binAvg = binAvg(~isnan(binAvg));
% 
% hold on
% plot(binAng, binAvg, '--b');
% hold off

%%
grid minor
box on
% axis tight

xlim([0 360]);
% ylim([0 0.04])
% ylim([0.004 0.019])


legend('Experimental Data (0-4x BR)','DDE Method (Fixed)','DDE Method (Relaxed)','Location','North')
% legend('boxoff')
xlabel('Azimuth Location, Degrees');
ylabel('Thrust Coefficient');
% title('\mu = 0.3, \alpha = 0, RPM = 3000, \DeltaT = 0.0005')

WH = [4.5 5];
% fcnFIG2LATEX(hFig2, 'tmotor_time_15.pdf', WH)
% fcnFIG2LATEX(hFig2, 'tmotor_time_0.pdf', WH)

