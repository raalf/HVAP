% clc
clear

% strSPANSPACING = 'NORMAL';
strSPANSPACING = 'NORMAL';
strCHORDSPACING = 'NORMAL';
valALPHA = 4;
AR = 7;

valMAXTIME = 100;
valDELTIME = 1;

vecM = 5;
vecN = 10;

xtcr = 1; % 1 is straight TE, 0 is straight LE

elliptical_wing_o_matic(vecN, vecM, valALPHA, strSPANSPACING, strCHORDSPACING, valDELTIME, valMAXTIME, AR, xtcr, 'NO')
run('OPERA_MAIN');