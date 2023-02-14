function [FC, FO] = ITW_GetFootContacts(gML, fs)
% ITW_GETFOOTCONTACTS
% Get foot contacts (first contact and foot off) from a foot-mounted
% IMU-gyroscope measure. It exploits the gyroscope medial-lateral 
% component during straight walking. 
% Published in [1] and freely inspired by [2].
% ------------------------------------------------------------------------
% INPUT:
%   · gML [N x 1]: medial-lateral component of the foot-mounted gyroscope
%   · fs [scalar]: sampling frequency of the signal.
% 
% OUTPUT:
%   · FC [M x 1]: array containing first foot contacts for the given gML
%   · FO [M x 1]: array containing foot offs for the given gML
% ------------------------------------------------------------------------
% Author: Guido Mascia -- mascia.guido@gmail.com
% Creation Date: 15.11.2022
% Last Edit: 14.02.2023
% ------------------------------------------------------------------------
% REFERENCES:
%   [1] Wu et al. (2021) "An intelligent in-shoe system for gait monitoring 
% and analysis with optimized sampling and real-time visualization 
% capabilities", Sensors, doi: 10.3390/s21082869
%   [2] Brasiliano et al. (2023) "Impact of Gait Events Identification 
% through Wearable Inertial Sensors on Clinical Gait Analysis of Children 
% with Idiopathic Toe Walking", Michromachines, doi: 10.3390/mi14020277
% -----------------------------------------------------------------------

% Reverse the direction of the signal in order to find the peaks that
% roughly correspond to the mid-swing phase of the gait cycle. 
[~, locs] = findpeaks(bwfilt(-gML, 2, fs, 5), ...
    'MinPeakHeight', std(-gML), 'MinPeakDistance', fs * .5);
locs = [locs; length(gML)]; % Add a dummy value for computation purposes

% Initialize changing-size arrays
FC = [];
FO = [];

% First Contacts
for i = 1 : length(locs) - 1
    tmp = [];
    for k = locs(i) : locs(i+1)
        if (gML(k) * gML(k-1) < 0) && (gML(k) > 0)
            tmp = [tmp; k];
        end
    end
    if ~isempty(tmp)
        FC = [FC; tmp(1)];
    end
end

% Reshape locs for computation purposes
locs = [2; locs(1:end-1); length(gML) - 1];

% Foot Off
for i = 1 : length(locs) - 1
    tmp = [];
    for k = locs(i+1) : - 1 : locs(i)
        if (gML(k) > gML(k-1)) && ((gML(k) > gML(k+1))) && gML(k) > std(gML)
            tmp = [tmp; k];
        end
    end
    if ~isempty(tmp)
        FO = [FO; tmp(1)];
    end
end
end