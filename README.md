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

Results - Step 6a - Use case control=weighting
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
