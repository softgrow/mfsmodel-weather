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
    glm.fit: itted probabilities numerically 0 or 1 occurred

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
