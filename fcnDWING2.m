function [D] = fcnDWING2(ATYPE, EATT, PLEX, NELE, ELOC, ELST, ALIGN, VLST, CENTER, DVE, DVECT, vecTE, vecSYM)

lamb_circ = [ ...
    0.5 0.5 0; ... % Edge 1 mid-point
    0 0.5 0.5; ... % Edge 2 mid-point
    0.5 0 0.5; ... % Edge 3 mid-point
    ];

lamb_vort = [ ...
    1 0 0; ...
    0 1 0; ...
    0 0 1; ...
    ];

% D = sparse(N*5, N*5);

% Making D-matrix a little long, in case we are over-constrained
D = zeros(NELE*9, NELE*5);


%% Circulation equations between elements
% Evaluated at the mid-point of each edge which splits two HDVEs

idx = all(EATT,2); % All edges that split 2 DVEs
nedg = length(EATT(idx,1));

% (x,y) of all three vertices of HDVEs in local coordinates
x1 = reshape(PLEX(1,1,EATT(idx,:)),nedg,2);
x2 = reshape(PLEX(2,1,EATT(idx,:)),nedg,2);
x3 = reshape(PLEX(3,1,EATT(idx,:)),nedg,2);
y1 = reshape(PLEX(1,2,EATT(idx,:)),nedg,2);
y2 = reshape(PLEX(2,2,EATT(idx,:)),nedg,2);
y3 = reshape(PLEX(3,2,EATT(idx,:)),nedg,2);

lmb1 = reshape(lamb_circ(ELOC(idx,:),1),nedg,2);
lmb2 = reshape(lamb_circ(ELOC(idx,:),2),nedg,2);
lmb3 = reshape(lamb_circ(ELOC(idx,:),3),nedg,2);

a2 = (lmb1.*x1+lmb2.*x2+lmb3.*x3);
a1 = a2.^2;
b2 = (lmb1.*y1+lmb2.*y2+lmb3.*y3);
b1 = b2.^2;

c3 = ones(nedg,2);

gamma1 = [a1(:,1),a2(:,1),b1(:,1),b2(:,1),c3(:,1)];
gamma2 = [a1(:,2),a2(:,2),b1(:,2),b2(:,2),c3(:,2)].*-1;

% Row indices of the rows where circulation equations will go
rows = reshape([repmat([1:nedg]',1,5)]',[],1);
row_loc(1) = max(rows); %Helps keep track of which rows are used

% Column indices for the first half of each circulation equation, col# = (DVE*5)-4 as each DVE gets a 6 column group
col1 = reshape([repmat([(EATT(idx,1).*5)-4],1,5) + repmat([0:4],nedg,1)]',[],1);

% Assigning the values to D using linear indices
D(sub2ind(size(D),rows,col1)) = reshape(gamma1',[],1);

% Repeat of above, for the 2nd half of the circulation equations
col2 = reshape([repmat([(EATT(idx,2).*5)-4],1,5)+repmat([0:4],nedg,1)]',[],1);
D(sub2ind(size(D),rows,col2)) = reshape(gamma2',[],1);

%% Vorticity at one vertex between elements
% For reference, I will call 'mm' the current DVE and 'nn' the adjacent DVE

% Should return the local vertex number of the first vertex of the edge
[~, bs1] = find(DVE(EATT(idx,1),:,1) == repmat(ELST(idx,1),1,3));
[~, bs2] = find(DVE(EATT(idx,2),:,1) == repmat(ELST(idx,1),1,3));

lmb1 = lamb_vort(bs1,:);
lmb2 = lamb_vort(bs2,:);

% Eta direction of mm and nn, an(:,1) is DVE mm and an(:,2) is DVE nn
a2 = ones(nedg,2);
a1 = ([lmb1(:,1) lmb2(:,1)].*x1 + [lmb1(:,2) lmb2(:,2)].*x2 + [lmb1(:,3) lmb2(:,3)].*x3);

% Xi direction of mm and nn (mm is all zeros)
b2 = ones(nedg,2);
b2(:,1) = zeros(nedg,1);
b1 = ([lmb1(:,1) lmb2(:,1)].*y1 + [lmb1(:,2) lmb2(:,2)].*y2 + [lmb1(:,3) lmb2(:,3)].*y3);
b1(:,1) = zeros(nedg,1);

c3 = zeros(nedg,2);

% Vorticity in the eta-direction of mm
dgamma1 = [a1(:,1), a2(:,1), b1(:,1), b2(:,1), c3(:,1)]; % DVE mm in the eta direction

% DVE nn in a combination of the eta and xi directions, multiplied by ALIGN matrix to get the proportions right
% c3 is not multiplied by ALIGN, as it's a constant which is applied to both directions
dgamma2 = [a1(:,2).*ALIGN(idx,1,1), a2(:,2).*ALIGN(idx,1,1), b1(:,2).*ALIGN(idx,2,1), b2(:,2).*ALIGN(idx,2,1), c3(:,2)].*-1;

% Row indices of the rows where vorticity equations will go
rows = reshape([repmat([1:nedg]',1,5)+nedg]',[],1);
row_loc(2) = max(rows); % Helps keep track of which rows are used

% Column indices for the first half of each circulation equation, col# = (DVE*6)-5 as each DVE gets a 6 column group
col1 = reshape([repmat([(EATT(idx,1).*5)-4],1,5)+repmat([0:4],nedg,1)]',[],1);

% Column indices for the second half of each circulation equation, col# = (DVE*6)-5 as each DVE gets a 6 column group
col2 = reshape([repmat([(EATT(idx,2).*5)-4],1,5)+repmat([0:4],nedg,1)]',[],1);

% Assigning the values to D using linear indices
D(sub2ind(size(D),rows,col1)) = reshape(dgamma1',[],1);
D(sub2ind(size(D),rows,col2)) = reshape(dgamma2',[],1);

%% Vorticity at second vertex between elements

% Should return the local vertex number of the second vertex of the edge
[~, bs1] = find(DVE(EATT(idx,1),:,1) == repmat(ELST(idx,2),1,3));
[~, bs2] = find(DVE(EATT(idx,2),:,1) == repmat(ELST(idx,2),1,3));

lmb1 = lamb_vort(bs1,:);
lmb2 = lamb_vort(bs2,:);

% Eta direction of mm and nn, an(:,1) is DVE mm and an(:,2) is DVE nn
a2 = ones(nedg,2);
a1 = ([lmb1(:,1) lmb2(:,1)].*x1 + [lmb1(:,2) lmb2(:,2)].*x2 + [lmb1(:,3) lmb2(:,3)].*x3);

% Xi direction of mm and nn (mm is all zeros)
b2 = ones(nedg,2);
b2(:,1) = zeros(nedg,1);
b1 = ([lmb1(:,1) lmb2(:,1)].*y1 + [lmb1(:,2) lmb2(:,2)].*y2 + [lmb1(:,3) lmb2(:,3)].*y3);
b1(:,1) = zeros(nedg,1);

c3 = zeros(nedg,2);

% Xi direction of DVE mm (first half of vorticity equation)
dgamma1 = [a1(:,1), a2(:,1), b1(:,1), b2(:,1), c3(:,1)];

% DVE nn in a combination of the eta and xi directions, multiplied by ALIGN matrix to get the proportions right
% c3 is not multiplied by ALIGN, as it's a constant which is applied to both directions
dgamma2 = [a1(:,2).*ALIGN(idx,1,1), a2(:,2).*ALIGN(idx,1,1), b1(:,2).*ALIGN(idx,2,1), b2(:,2).*ALIGN(idx,2,1), c3(:,2)].*-1;

% Row indices of the rows where vorticity equations will go
rows = reshape([repmat([1:nedg]',1,5)+nedg*2]',[],1);
row_loc(1) = max(rows); % Helps keep track of which rows are used

% Column indices for the first half of each circulation equation, col# = (DVE*5)-4 as each DVE gets a 5 column group
col1 = reshape([repmat([(EATT(idx,1).*5)-4],1,5)+repmat([0:4],nedg,1)]',[],1);

% Column indices for the second half of each circulation equation, col# = (DVE*5)-4 as each DVE gets a 5 column group
col2 = reshape([repmat([(EATT(idx,2).*5)-4],1,5)+repmat([0:4],nedg,1)]',[],1);

% Assigning the values to D using linear indices
D(sub2ind(size(D),rows,col1)) = reshape(dgamma1',[],1);
D(sub2ind(size(D),rows,col2)) = reshape(dgamma2',[],1);

clear lmb1 lmb2

%% Irrotationality
% The curvature (A1 and B1) must be equal (but opposite in magnitude?) for all HDVEs

dvenum = [1:NELE]';

% A1 + B1 = 0
ddgamma = repmat([1 0 1 0 0],NELE,1);

% This is the slot of empty rows in which we will put the irrotationality equations
% (below circulation and vorticity, above kinematic conditions)
rows = reshape([repmat([1:NELE]',1,5)+nedg*3]',[],1);
row_loc(4) = max(rows); % Helps keep track of which rows are used

col3 = reshape([repmat((dvenum.*5)-4,1,5) + repmat([0:4],NELE,1)]',[],1);
D(sub2ind(size(D),rows,col3)) = reshape(ddgamma',[],1);

%% Circulation equations at leading edge and wing tip
% For lifting surface analysis
% Circulation is set to zero at the leading edge, and wing tips
% These are found by looking at the free edges that are NOT symmetry or trailing edge
% Evaluated at the mid-point of each edge which is used by only 1 HDVE (and not at the trailing edge)
if strcmp(ATYPE,'LS') == 1;
    idx = ~all(EATT,2); % All edges that are attached to only 1 HDVE
    idx(vecTE) = 0;
    idx(vecSYM) = 0;
    nedg = length(EATT(idx,1));
    
    % (x,y) of all three vertices of HDVEs in local coordinates
    x1 = reshape(PLEX(1,1,nonzeros(EATT(idx,:))),nedg,1);
    x2 = reshape(PLEX(2,1,nonzeros(EATT(idx,:))),nedg,1);
    x3 = reshape(PLEX(3,1,nonzeros(EATT(idx,:))),nedg,1);
    y1 = reshape(PLEX(1,2,nonzeros(EATT(idx,:))),nedg,1);
    y2 = reshape(PLEX(2,2,nonzeros(EATT(idx,:))),nedg,1);
    y3 = reshape(PLEX(3,2,nonzeros(EATT(idx,:))),nedg,1);
    
    % Using lamb_circ, as we are evaluating at the midpoint of the edge
    % (Vorticity is usually evaluated at vertices where lambda = 1 and not 0.5)
    lmb1 = reshape(lamb_circ(nonzeros(ELOC(idx,:)),1),nedg,1);
    lmb2 = reshape(lamb_circ(nonzeros(ELOC(idx,:)),2),nedg,1);
    lmb3 = reshape(lamb_circ(nonzeros(ELOC(idx,:)),3),nedg,1);
    
    a2 = (lmb1.*x1+lmb2.*x2+lmb3.*x3);
    a1 = a2.^2;
    b2 = (lmb1.*y1+lmb2.*y2+lmb3.*y3);
    b1 = b2.^2;
    
    c3 = ones(nedg,2);
    
    gamma_tip = [a1(:,1), a2(:,1), b1(:,1), b2(:,1), c3(:,1)];
    
    % Row indices of the rows where circulation equations will go
    rows = reshape([repmat([1:nedg]',1,5) + max(rows)]',[],1);
    
    % Column indices for each circulation equation, col# = (DVE*5)-4 as each DVE gets a 5 column group
    col4 = repmat([(nonzeros(EATT(idx,:)).*5)-4],1,5)+repmat([0:4],nedg,1);
    col4 = reshape(col4',[],1);
    
    % Assigning the values to D using linear indices
    idx9 =  sub2ind(size(D),rows,col4);
    D(idx9) = reshape(gamma_tip',[],1);
end

%% Kinematic conditions at vertices
% Flow tangency is to be enforced at all control points on the surface HDVEs

% In the D-Matrix, dot (a1,a2,b1,b2,c3) of our influencing HDVE with the normal of the point we are influencing on

% Points we are influencing
% fpg = [VLST; CENTER];
fpg = [CENTER];

% List of DVEs we are influencing from (one for each of the above fieldpoints)
len = length(fpg(:,1));
dvenum = reshape(repmat(1:NELE,len,1),[],1);

fpg = repmat(fpg,NELE,1);

[a1, a2, b1, b2, c3] = fcnHDVEIND(dvenum, fpg, DVE, DVECT, VLST, PLEX);

% List of normals we are to dot the above with
% normals = [VNORM; DVECT(:,:,3)];
normals = [DVECT(:,:,3)];
normals = repmat(normals,NELE,1); % Repeated so we can dot all at once

% Dotting a1, a2, b1, b2, c3 with the normals of the field points
temp60 = [dot(a1,normals,2) dot(a2,normals,2) dot(b1,normals,2) dot(b2,normals,2) dot(c3, normals,2)];

% Reshaping and inserting into the bottom of the D-Matrix
rows = [1:len]' + max(rows);
D(rows,:) = reshape(permute(reshape(temp60',5,[],NELE),[2 1 3]),[],5*NELE,1);

%% Removing empty rows from D-Matrix
D(~any(D,2),:) = [];

end

