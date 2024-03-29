MFS-Modelling
=============

Tools for Modelling MFS Call Data

Results - Step 1
================
    Coefficients:
                 Estimate     Std. Error   z value      Pr(>|z|)
    (Intercept)   -3.865e+00    4.677e-02   -8.265e+01    0.000e+00
    dayofweek      3.568e-02    7.268e-03    4.909e+00    9.164e-07
    hour           8.541e-02    2.250e-03    3.796e+01   3.168e-310
    month         -1.997e-02    4.217e-03   -4.735e+00    2.197e-06

    Degrees of Freedom: 43823 Total (i.e. Null);  43820 Residual
    Null Deviance:      33700
    Residual Deviance: 32080        AIC: 32090

    Prior correction performed with tau = 0.04740437
    Rare events bias correction performed

Results - Step 2 - Average Monthly Temp
================
	Coefficients:
             Estimate     Std. Error   z value      Pr(>|z|)   
	(Intercept)   -4.425e+00    9.233e-02   -4.793e+01    0.000e+00
	dayofweek      3.573e-02    7.272e-03    4.913e+00    9.003e-07
	hour           8.550e-02    2.252e-03    3.797e+01   1.724e-310
	month         -1.101e-02    4.535e-03   -2.428e+00    1.520e-02
	temperature    2.349e-02    3.336e-03    7.040e+00    1.952e-12

	Degrees of Freedom: 43823 Total (i.e. Null);  43819 Residual
	Null Deviance:      33700
	Residual Deviance: 32030        AIC: 32040

	Prior correction performed with tau = 0.04740437
	Rare events bias correction performed
Results - Step 3 - Previous observed Temp
================
    Warning message:
    glm.fit: fitted probabilities numerically 0 or 1 occurred

    Coefficients:
                 Estimate     Std. Error   z value      Pr(>|z|)
    (Intercept)   -4.675e+00    6.446e-02   -7.252e+01    0.000e+00
    dayofweek      3.546e-02    7.299e-03    4.858e+00    1.189e-06
    hour           7.395e-02    2.282e-03    3.241e+01   1.149e-227
    month         -4.398e-03    4.567e-03   -9.629e-01    3.356e-01
    temperature    5.114e-02    2.780e-03    1.840e+01    2.614e-75

    Degrees of Freedom: 43823 Total (i.e. Null);  43819 Residual
    Null Deviance:      33700
    Residual Deviance: 31690        AIC: 31700

    Prior correction performed with tau = 0.04740437
    Rare events bias correction performed

Results - Step 4 - Days of Week
================
    Warning message:
    glm.fit: fitted probabilities numerically 0 or 1 occurred

    Coefficients:
                 Estimate     Std. Error   z value      Pr(>|z|)
    (Intercept)   -4.634e+00    4.701e-02   -9.859e+01    0.000e+00
    hour           7.391e-02    2.279e-03    3.243e+01   4.739e-228
    temperature    5.157e-02    2.730e-03    1.890e+01    2.576e-79
    IsMonday      -7.809e-02    4.278e-02   -1.825e+00    6.795e-02
    IsThursday     1.099e-01    4.492e-02    2.447e+00    1.441e-02
    IsFriday       1.456e-01    4.533e-02    3.213e+00    1.317e-03
    IsSaturday     3.017e-01    4.734e-02    6.373e+00    1.868e-10

    Degrees of Freedom: 43823 Total (i.e. Null);  43817 Residual
    Null Deviance:      33700
    Residual Deviance: 31650        AIC: 31660

    Prior correction performed with tau = 0.04740437
    Rare events bias correction performed

Results - Step 5 - Remove Operational Movements
================
    Warning message:
    glm.fit: fitted probabilities numerically 0 or 1 occurred

    Coefficients:
                 Estimate     Std. Error   z value      Pr(>|z|)
    (Intercept)   -4.688e+00    4.643e-02   -1.010e+02    0.000e+00
    hour           7.312e-02    2.244e-03    3.259e+01   3.458e-230
    temperature    5.060e-02    2.686e-03    1.883e+01    8.075e-79
    IsMonday      -8.037e-02    4.223e-02   -1.903e+00    5.705e-02
    IsThursday     1.158e-01    4.441e-02    2.607e+00    9.146e-03
    IsFriday       1.417e-01    4.469e-02    3.171e+00    1.518e-03
    IsSaturday     2.931e-01    4.659e-02    6.291e+00    3.192e-10

    Degrees of Freedom: 43823 Total (i.e. Null);  43817 Residual
    Null Deviance:      34380
    Residual Deviance: 32320        AIC: 32340

    Prior correction performed with tau = 0.04411894
    Rare events bias correction performed

Results - Step 6 - Remove Increase sample size to give model more information on zeros
================

    Warning message:
    glm.fit: fitted probabilities numerically 0 or 1 occurred

    Coefficients:
                 Estimate    Std. Error  z value     Pr(>|z|)
    (Intercept)  -3.975e+00   1.460e-02  -2.723e+02   0.000e+00
    hour          3.024e-02   6.162e-04   4.908e+01   0.000e+00
    temperature   2.898e-02   6.906e-04   4.196e+01   0.000e+00
    IsMonday     -2.354e-02   1.285e-02  -1.832e+00   6.694e-02
    IsThursday    9.195e-02   1.269e-02   7.245e+00   4.326e-13
    IsFriday      1.399e-01   1.261e-02   1.110e+01   1.273e-28
    IsSaturday    1.129e-01   1.264e-02   8.931e+00   4.249e-19

    Degrees of Freedom: 262943 Total (i.e. Null);  262937 Residual
    Null Deviance:      336400
    Residual Deviance: 331200       AIC: 331200

    Prior correction performed with tau = 0.04411894
    Rare events bias correction performed

Results - Step 6a - Use case control weighting
================

    Warning message:
    glm.fit: fitted probabilities numerically 0 or 1 occurred

    Coefficients:
                 Estimate    Std. Error  z value     Pr(>|z|)
    (Intercept)  -3.964e+00   3.361e-02  -1.179e+02   0.000e+00
    hour          2.843e-02   1.377e-03   2.066e+01   1.028e-94
    temperature   2.958e-02   1.539e-03   1.922e+01   2.843e-82
    IsMonday     -2.264e-02   2.964e-02  -7.639e-01   4.449e-01
    IsThursday    9.222e-02   2.890e-02   3.191e+00   1.418e-03
    IsFriday      1.435e-01   2.857e-02   5.024e+00   5.068e-07
    IsSaturday    1.090e-01   2.874e-02   3.794e+00   1.485e-04

    Degrees of Freedom: 262943 Total (i.e. Null);  262937 Residual
    Null Deviance:      95090
    Residual Deviance: 94120        AIC: 15690

    Weighting performed with tau = 0.04411894
    Rare events bias correction performed

Results - Step 6b - No Rare event correction
================
    Warning message:
    glm.fit: fitted probabilities numerically 0 or 1 occurred

    Coefficients:
                 Estimate    Std. Error  z value     Pr(>|z|)
    (Intercept)  -1.571e+00   1.460e-02  -1.076e+02   0.000e+00
    hour          3.024e-02   6.162e-04   4.908e+01   0.000e+00
    temperature   2.898e-02   6.906e-04   4.196e+01   0.000e+00
    IsMonday     -2.355e-02   1.285e-02  -1.833e+00   6.679e-02
    IsThursday    9.194e-02   1.269e-02   7.244e+00   4.358e-13
    IsFriday      1.399e-01   1.261e-02   1.110e+01   1.287e-28
    IsSaturday    1.129e-01   1.264e-02   8.930e+00   4.285e-19

    Degrees of Freedom: 262943 Total (i.e. Null);  262937 Residual
    Null Deviance:      336400
    Residual Deviance: 331200       AIC: 331200
    Rare events bias correction performed

Results - Step 6c - Logit model only
================

    Warning message:
    glm.fit: fitted probabilities numerically 0 or 1 occurred

    Deviance Residuals:
        Min       1Q   Median       3Q      Max
    -1.3130  -0.9394  -0.7978   1.3689   8.4904

    Coefficients:
                  Estimate Std. Error  z value Pr(>|z|)
    (Intercept) -1.5712017  0.0145975 -107.635  < 2e-16 ***
    hour         0.0302444  0.0006162   49.079  < 2e-16 ***
    temperature  0.0289802  0.0006906   41.962  < 2e-16 ***
    IsMonday    -0.0235660  0.0128482   -1.834   0.0666 .
    IsThursday   0.0919263  0.0126911    7.243 4.38e-13 ***
    IsFriday     0.1399055  0.0126063   11.098  < 2e-16 ***
    IsSaturday   0.1128724  0.0126410    8.929  < 2e-16 ***
    ---
    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

    (Dispersion parameter for binomial family taken to be 1)

    Null deviance: 336448  on 262943  degrees of freedom
    Residual deviance: 331217  on 262937  degrees of freedom
    AIC: 331231

    Number of Fisher Scoring iterations: 4

Results - Step 6d - Julia logit model only
================

    Coefficients:
                  Estimate   Std.Error  z value Pr(>|z|)
    (Intercept)    -1.5712   0.0145975 -107.635   <1e-99
    hour         0.0302444 0.000616235  49.0793   <1e-99
    temperature  0.0289802 0.000690629   41.962   <1e-99
    IsMonday     -0.023566   0.0128482 -1.83419   0.0666
    IsThursday   0.0919263   0.0126911  7.24335   <1e-12
    IsFriday      0.139906   0.0126063  11.0981   <1e-27
    IsSaturday    0.112872    0.012641  8.92908   <1e-18

Step 7 - NBE Colloquim model but Julia
======================================
    Coefficients:
                  Estimate   Std.Error  z value Pr(>|z|)
    (Intercept)   -3.77284   0.0116495 -323.862   <1e-99
    hour         0.0231019 0.000456182  50.6418   <1e-99
    IsMonday      0.122254   0.0120215  10.1696   <1e-23
    IsTuesday     0.206699   0.0118108  17.5008   <1e-67
    IsWednesday   0.176734    0.011879  14.8779   <1e-49
    IsThursday     0.21296   0.0117948  18.0555   <1e-72
    IsFriday      0.261926   0.0116857  22.4143   <1e-99
    IsSaturday    0.226724    0.011765   19.271   <1e-82
    tempband2    0.0765277  0.00297399  25.7323   <1e-99
    tempband4    0.0300173  0.00237588  12.6342   <1e-35
    tempband5b1    0.01211  0.00675359  1.79312   0.0730
    tempband5b2  0.0415202   0.0108828  3.81521   0.0001
    tempband5b3  0.0261287   0.0145412  1.79688   0.0724
    tempband5b4  0.0475908   0.0204734  2.32452   0.0201
    tempband5b5  0.0756126   0.0293007  2.58058   0.0099
    tempband5bz  0.0865206   0.0586816  1.47441   0.1404

Step 7p - NBE Colloquim model - Poisson with 1
======================================

    Coefficients:
                  Estimate   Std.Error  z value Pr(>|z|)
    (Intercept)   -3.78992   0.0114299 -331.581   <1e-99
    hour         0.0221202 0.000446189  49.5759   <1e-99
    IsMonday      0.117332   0.0117743  9.96511   <1e-22
    IsTuesday        0.198   0.0115583  17.1305   <1e-65
    IsWednesday   0.169417   0.0116283  14.5693   <1e-47
    IsThursday    0.203921   0.0115412   17.669   <1e-69
    IsFriday      0.250627   0.0114305  21.9261   <1e-99
    IsSaturday    0.217097   0.0115118  18.8586   <1e-78
    tempband2     0.073599  0.00291459   25.252   <1e-99
    tempband4    0.0285869  0.00231666  12.3397   <1e-34
    tempband5b1   0.011425  0.00656885  1.73927   0.0820
    tempband5b2  0.0391931   0.0105626  3.71054   0.0002
    tempband5b3  0.0246091   0.0140736   1.7486   0.0804
    tempband5b4  0.0442925   0.0197345  2.24442   0.0248
    tempband5b5  0.0704368   0.0280169  2.51409   0.0119
    tempband5bz  0.0750793   0.0552735  1.35832   0.1744

Step 7q - NBE Colloquim model - Poisson with 1,2,3...
=================
    Coefficients:
                  Estimate   Std.Error  z value Pr(>|z|)
    (Intercept)   -3.77504   0.0113085 -333.824   <1e-99
    hour         0.0221518 0.000440346  50.3055   <1e-99
    IsMonday      0.123658   0.0116427  10.6211   <1e-25
    IsTuesday     0.208874   0.0114181  18.2931   <1e-74
    IsWednesday   0.176693   0.0114962  15.3697   <1e-52
    IsThursday    0.211344   0.0114096  18.5234   <1e-75
    IsFriday       0.26156   0.0112927  23.1618   <1e-99
    IsSaturday     0.22655   0.0113762  19.9144   <1e-87
    tempband2    0.0749714  0.00287873  26.0432   <1e-99
    tempband4    0.0292694  0.00228357  12.8174   <1e-36
    tempband5b1   0.011577  0.00646926  1.78955   0.0735
    tempband5b2  0.0402354   0.0103961  3.87025   0.0001
    tempband5b3  0.0220355   0.0138624  1.58959   0.1119
    tempband5b4  0.0497162   0.0193828  2.56497   0.0103
    tempband5b5  0.0714394   0.0273278  2.61417   0.0089
    tempband5bz  0.0967719   0.0527162  1.83571   0.0664

Step 8 - Add hour function and year
=============
    Coefficients:
                    Estimate  Std.Error  z value Pr(>|z|)
    (Intercept)     -3.89515  0.0343862 -113.277   <1e-99
    year           0.0486605  0.0020006   24.323   <1e-99
    hour0to1       -0.200861  0.0452568 -4.43824    <1e-5
    hour1to2       -0.166261  0.0307567 -5.40569    <1e-7
    hour3to4       -0.112407  0.0330688  -3.3992   0.0007
    hour4to5       -0.123788   0.043667 -2.83481   0.0046
    hour5to6        0.173167  0.0434854  3.98219    <1e-4
    hour6to7        0.281338  0.0391738  7.18179   <1e-12
    hour7to8        0.421769  0.0332093  12.7003   <1e-36
    hour8to9        0.346418  0.0277572  12.4803   <1e-35
    hour9to10       0.100561  0.0246993   4.0714    <1e-4
    hour10to11     -0.179571  0.0218166 -8.23092   <1e-15
    hour11to13    -0.0561719 0.00812962 -6.90953   <1e-11
    hour15to16      0.110874  0.0184575  6.00699    <1e-8
    hour16to17    -0.0714394  0.0256807 -2.78184   0.0054
    hour17to18      0.167914  0.0258116  6.50537   <1e-10
    hour18to19     -0.225317  0.0263946 -8.53647   <1e-16
    hour19to20    -0.0702119  0.0280893  -2.4996   0.0124
    hour20to21    -0.0991658  0.0295289 -3.35826   0.0008
    hour21to22    -0.0777595  0.0310024 -2.50818   0.0121
    hour22to23     -0.144905  0.0334736 -4.32894    <1e-4
    hour23to24    -0.0924898  0.0445278 -2.07713   0.0378
    IsMonday        0.125735  0.0116404  10.8016   <1e-26
    IsTuesday       0.210622  0.0114165  18.4489   <1e-75
    IsWednesday     0.179593  0.0114937  15.6253   <1e-54
    IsThursday      0.214809  0.0114078    18.83   <1e-78
    IsFriday        0.264128  0.0112894  23.3961   <1e-99
    IsSaturday      0.229595  0.0113732  20.1873   <1e-89
    tempband2      0.0189116  0.0037896  4.99038    <1e-6
    tempband3    -0.00908493 0.00340189 -2.67055   0.0076
    tempband5a     0.0179924 0.00367917  4.89034    <1e-5
    tempband5b2    0.0346521 0.00624817  5.54596    <1e-7
    tempband5b4    0.0434187  0.0154417  2.81177   0.0049
    tempband5b5    0.0551226  0.0270923  2.03462   0.0419
    tempband5bz     0.104784  0.0529103   1.9804   0.0477

Step 9 - Add wind and dewpoint, Redo hour
=============
    Coefficients:
                   Estimate   Std.Error  z value Pr(>|z|)
    (Intercept)    -3.93051   0.0351259 -111.898   <1e-99
    year          0.0486377  0.00200018  24.3167   <1e-99
    hour0to1      -0.201051   0.0452569 -4.44243    <1e-5
    hour1to2      -0.166329   0.0307563 -5.40798    <1e-7
    hour3to4       -0.11247   0.0330694 -3.40103   0.0007
    hour4to5      -0.124129   0.0436672 -2.84262   0.0045
    hour5to6        0.17329   0.0434851  3.98505    <1e-4
    hour6to7       0.281432   0.0391736  7.18424   <1e-12
    hour7to8       0.423072   0.0332096  12.7395   <1e-36
    hour8to9       0.344392   0.0277499  12.4106   <1e-34
    hour9to10      0.108709    0.024545  4.42897    <1e-5
    hour10to11    -0.213999   0.0191211 -11.1918   <1e-28
    hour12to13    -0.088438   0.0131883  -6.7058   <1e-10
    hour15to16     0.113757   0.0186953  6.08478    <1e-8
    hour16to17   -0.0722974   0.0256936 -2.81383   0.0049
    hour17to18     0.167543   0.0258186  6.48923   <1e-10
    hour18to19    -0.225188   0.0263985 -8.53033   <1e-16
    hour19to20   -0.0697614   0.0280926 -2.48327   0.0130
    hour20to21   -0.0984745   0.0295313 -3.33458   0.0009
    hour21to22   -0.0775052   0.0310029 -2.49993   0.0124
    hour22to23    -0.144595   0.0334741 -4.31961    <1e-4
    hour23to24   -0.0924366    0.044528 -2.07592   0.0379
    IsMonday       0.126168   0.0116412  10.8381   <1e-26
    IsTuesday      0.212084     0.01142  18.5713   <1e-76
    IsWednesday    0.179938   0.0114939  15.6551   <1e-54
    IsThursday     0.214925   0.0114081  18.8397   <1e-78
    IsFriday       0.263548    0.011292  23.3394   <1e-99
    IsSaturday     0.228976   0.0113742  20.1312   <1e-89
    tempband2     0.0154393  0.00384772  4.01258    <1e-4
    tempband3    -0.0111211  0.00342263 -3.24928   0.0012
    tempband5a    0.0175582  0.00368377  4.76636    <1e-5
    tempband5b2   0.0372524  0.00626508  5.94604    <1e-8
    tempband5b4   0.0459163   0.0154451  2.97287   0.0030
    tempband5b5   0.0532244   0.0270948  1.96438   0.0495
    tempband5bz    0.100877   0.0527813  1.91123   0.0560
    dew_point    0.00403081 0.000732363  5.50384    <1e-7
    wind_speed   0.00228641  0.00125169  1.82666   0.0678

Results Step 10 - Correct dew_point and wind_speed index
============
    Coefficients:
                   Estimate   Std.Error  z value Pr(>|z|)
    (Intercept)    -3.92155   0.0347398 -112.883   <1e-99
    year          0.0485735  0.00199998   24.287   <1e-99
    hour0to1      -0.200988   0.0452568 -4.44105    <1e-5
    hour1to2      -0.166179    0.030757 -5.40297    <1e-7
    hour3to4      -0.112263   0.0330683 -3.39488   0.0007
    hour4to5      -0.123886   0.0436668 -2.83708   0.0046
    hour5to6       0.173731   0.0434852  3.99517    <1e-4
    hour6to7        0.28108   0.0391734  7.17527   <1e-12
    hour7to8        0.42396    0.033208  12.7668   <1e-36
    hour8to9       0.344182   0.0277467  12.4044   <1e-34
    hour9to10      0.110088    0.024541  4.48589    <1e-5
    hour10to11     -0.21348   0.0191038 -11.1747   <1e-28
    hour12to13   -0.0874292   0.0131681 -6.63948   <1e-10
    hour15to16     0.114861   0.0186957  6.14367    <1e-9
    hour16to17   -0.0726822   0.0256929 -2.82888   0.0047
    hour17to18     0.166447   0.0258148  6.44771    <1e-9
    hour18to19    -0.225947   0.0263947 -8.56032   <1e-16
    hour19to20   -0.0716924   0.0280904  -2.5522   0.0107
    hour20to21   -0.0991559   0.0295285 -3.35797   0.0008
    hour21to22   -0.0779293   0.0310023 -2.51366   0.0119
    hour22to23      -0.1448   0.0334735  -4.3258    <1e-4
    hour23to24   -0.0924354   0.0445279  -2.0759   0.0379
    IsMonday       0.125757   0.0116404  10.8035   <1e-26
    IsTuesday      0.211254   0.0114171  18.5034   <1e-75
    IsWednesday    0.180139    0.011494  15.6724   <1e-54
    IsThursday     0.214577   0.0114079  18.8094   <1e-78
    IsFriday       0.263101   0.0112911  23.3017   <1e-99
    IsSaturday     0.228731   0.0113744  20.1094   <1e-89
    tempband2     0.0160776   0.0038257  4.20252    <1e-4
    tempband3    -0.0109418  0.00341949 -3.19983   0.0014
    tempband5a    0.0176293  0.00368066   4.7897    <1e-5
    tempband5b2   0.0385233  0.00628796  6.12651    <1e-9
    tempband5b4    0.048267   0.0154594  3.12218   0.0018
    tempband5b5   0.0536702   0.0271161  1.97928   0.0478
    tempband5bz    0.115059   0.0530725  2.16795   0.0302
    dew_point    0.00390169 0.000729324  5.34974    <1e-7

Results Step 11 - Leave Wind Speed In
=============

  | Coefficients | Estimate | Std.Error |  z value | Pr(>\|z\|) |
  | --- | --- | --- | --- | --- |
  |  (Intercept)   |  -3.92828 |  0.0351363 | -111.801 |  <1e-99 |
  |  year     |     0.0482033 | 0.00199961 | 24.1064   | <1e-99|
  |  hour0to1  |    -0.201484  | 0.0452568 | -4.45201    | <1e-5 |
  |  hour1to2   |   -0.165943 |  0.0307585 | -5.39505    | <1e-7 |
  |  hour3to4    |  -0.112332  | 0.0330674 | -3.39708  | 0.0007 |
  |  hour4to5     | -0.124051 |  0.0436655 | -2.84094 |  0.0045 |
  |  hour5to6      | 0.175264 |  0.0434846  | 4.03049  |  <1e-4 |
  |  hour6to7  |     0.282751 |  0.0391703  | 7.21849 |  <1e-12 |
  |  hour7to8   |    0.426791 |  0.0332034  | 12.8538 |  <1e-37 |
  |  hour8to9    |   0.339623 |  0.0278138  | 12.2106  | <1e-33 |
  |  hour9to10    |  0.105154 |  0.0249001  | 4.22303  |  <1e-4 |
  |  hour10to11 |   -0.185707 |  0.0249332 | -7.44816 |  <1e-13 |
  |  hour11to12  | -0.0526015 |  0.0255667 | -2.05743 |  0.0396 |
  |  hour12to13  | -0.0631609 |  0.0189612 | -3.33105 |  0.0009 |
  |  hour15to16  |   0.110462 |  0.0187254  | 5.89906  |  <1e-8 |
  |  hour16to17 |  -0.0755145 |  0.0256934 | -2.93906 |  0.0033 |
  |  hour17to18  |   0.170437 |  0.0258201  | 6.60094 |  <1e-10 |
  |  hour18to19 |   -0.229678 |  0.0263915 | -8.70271 |  <1e-17 |
  |  hour19to20 |  -0.0715832 |   0.028085  | -2.5488 |  0.0108 |
  |  hour20to21 |  -0.0893263 |  0.0295421 | -3.02369 |  0.0025 |
  |  hour21to22 |  -0.0789808 |  0.0310044 | -2.54741 |  0.0109 |
  |  hour22to23 |   -0.143115  | 0.0334746 | -4.27532  |  <1e-4 |
  |  hour23to24 |  -0.0915308 |  0.0445303 | -2.05547 |  0.0398 |
  |  IsMonday   |    0.125958 |  0.0116417  | 10.8196 |  <1e-26 |
  |  IsTuesday  |    0.212071 |  0.0114169  | 18.5752 |  <1e-76 |
  |  IsWednesday |   0.180471 |  0.0114945  | 15.7006 |  <1e-54 |
  |  IsThursday |    0.214703 |  0.0114079  | 18.8206 |  <1e-78 |
  |  IsFriday    |   0.263771 |  0.0112891   | 23.365 |  <1e-99 |
  |  IsSaturday  |   0.229289 |  0.0113746   | 20.158 |  <1e-89 |
  |  tempband2  |   0.0166308 | 0.00390385  | 4.26011  |  <1e-4 |
  |  tempband3  |  -0.0177655 | 0.00425992 | -4.17038  |  <1e-4 |
  |  tempband4  |   0.0114097 | 0.00305726  | 3.73201 |  0.0002 |
  |  tempband5b1 |  0.0157002 | 0.00643611  | 2.43939 |  0.0147 |
  |  tempband5b2 |  0.0369874 |  0.0083731  | 4.41741 |   <1e-5 |
  |  tempband5b4 |  0.0555186 |  0.0152284  | 3.64574 |  0.0003 |
  |  tempband5b5 |  0.0913057 |  0.0221132  | 4.12901  |  <1e-4 |
  |  dew_point  |  0.00395742 | 0.000735134  | 5.38327 |   <1e-7 |
  |  wind_speed  |  0.0022446 | 0.00124634  | 1.80096 |  0.0717 |

    ADL
    Expected Value for 0 116024.23786580352
    Expected Value for 1 116720.2860107171
    Expected Value for 2 117440.9486500019
    Expected Value for -1 115385.27395891977
    HND
    Expected Value for 0 116470.34973240174
    Expected Value for 1 117253.7522074085
    Expected Value for 2 118162.81813503151
    Expected Value for -1 115793.16293129568

Results Step 12 - Use Polynomials
===========
    julia> include("makecomb.jl")
    Warning: could not import Base.add! into NumericExtensions
    116024 incidents loaded
    DataFrameRegressionModel{GeneralizedLinearModel,Float64}:

    Coefficients:
                     Estimate   Std.Error  z value Pr(>|z|)
    (Intercept)      -2.71827    0.143181 -18.9849   <1e-79
    year            0.0477146  0.00200157  23.8387   <1e-99
    hourfrac         -1.28046    0.110009 -11.6396   <1e-30
    hourfrac2         1.37622    0.105945  12.9899   <1e-37
    hourfrac3       -0.691903    0.046416 -14.9066   <1e-49
    hourfrac4        0.178586    0.011108  16.0773   <1e-57
    hourfrac5      -0.0260914  0.00159193 -16.3898   <1e-59
    hourfrac6      0.00229711 0.000142658  16.1022   <1e-57
    hourfrac7    -0.000124593  8.05876e-6 -15.4606   <1e-53
    hourfrac8      4.07985e-6  2.78733e-7  14.6371   <1e-47
    hourfrac9     -7.40502e-8  5.38921e-9 -13.7405   <1e-42
    hourfrac10    5.72564e-10 4.46065e-11  12.8359   <1e-36
    IsMonday         0.128256   0.0116418  11.0169   <1e-27
    IsTuesday        0.206165   0.0114185  18.0553   <1e-72
    IsWednesday      0.177042   0.0114941  15.4028   <1e-52
    IsThursday       0.216094   0.0114091  18.9405   <1e-79
    IsFriday         0.259353   0.0112934   22.965   <1e-99
    IsSaturday       0.224483   0.0113753  19.7343   <1e-85
    temperature     -0.368525   0.0560734 -6.57219   <1e-10
    temp2           0.0574261  0.00867669  6.61844   <1e-10
    temp3         -0.00414448 0.000653105 -6.34581    <1e-9
    temp4         0.000150997  2.55212e-5  5.91656    <1e-8
    temp5         -2.69136e-6   4.9628e-7 -5.42306    <1e-7
    temp6          1.87449e-8  3.78652e-9  4.95042    <1e-6
    dew_point      -0.0194683   0.0015148  -12.852   <1e-37
    dew_point2     0.00148698  8.78881e-5   16.919   <1e-63
    wind_speed     -0.0612822  0.00385731 -15.8873   <1e-56
    wind_speed2    0.00547301 0.000312889  17.4919   <1e-67
