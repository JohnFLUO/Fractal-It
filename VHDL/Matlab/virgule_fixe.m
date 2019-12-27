clc
clear variable
close all

y  = [ 0.299,   0.587,   0.114 ];
cb = [-0.1687, -0.3313,  0.5   ];
cr = [ 0.5,    -0.4187, -0.0813];

y_fi  = fi(y, true, 8, 7)
cb_fi = fi(cb, true, 8, 7)
cr_fi = fi(cr, true, 8, 7)

y_fi_bin  = bin(y_fi)
cb_fi_bin = bin(cb_fi)
cr_fi_bin = bin(cr_fi)

y_fi_bin_dec  = dec(y_fi)
cb_fi_bin_dec = dec(cb_fi)
cr_fi_bin_dec = dec(cr_fi)
