function [matWADJE, matWELST, matWVLST, matWDVE, valWNELE, matWEATT, matWEIDX, matWELOC, matWPLEX, matWDVECT, matWALIGN, matWVATT, matWVNORM, matWCENTER] ...
    = fcnRELAX(valDELTIME, valNELE, matCOEFF, matDVE, matDVECT, matVLST, matPLEX, valWNELE, matWCOEFF, matWDVE, matWDVECT, matWVLST, matWPLEX)
% Relaxes wake by moving points in the wake vertex list matWVLST, and updating the local vectors in matWDVECT

%% Finding induced velocities at all wake vertices
s_ind = fcnSDVEVEL(matWVLST, valNELE, matCOEFF, matDVE, matDVECT, matVLST, matPLEX);
w_ind = fcnWINDVEL(matWVLST, valWNELE, matWCOEFF, matWDVE, matWDVECT, matWVLST, matWPLEX);


%% Identifying trailing edges, we won't relax these points

% Finding vertices common between wing and wake, these are the trailing edge vertices
[idxTEV, ~] = ismember(matWVLST, matVLST, 'rows');

% Setting induced velocities at these points to zero
s_ind(idxTEV,:) = repmat([0 0 0], length(nonzeros(idxTEV)), 1);
w_ind(idxTEV,:) = repmat([0 0 0], length(nonzeros(idxTEV)), 1);

%% Moving wake vertices
matWVLST = matWVLST + (s_ind + w_ind).*valDELTIME; % Needs more work for rotors (assuming freestream magnitude is 1)

%% Recreating wake point matrix, and regenerating wake HDVE parameters
matWAKEGEOM(:,:,1) = matWVLST(matWDVE(:,1,1),:);
matWAKEGEOM(:,:,2) = matWVLST(matWDVE(:,2,1),:);
matWAKEGEOM(:,:,3) = matWVLST(matWDVE(:,3,1),:);

[~, matWADJE, matWELST, matWVLST, matWDVE, valWNELE, matWEATT, matWEIDX, matWELOC, matWPLEX, ...
    matWDVECT, matWALIGN, matWVATT, matWVNORM, matWCENTER] = fcnTRIANG('wake',matWAKEGEOM);

