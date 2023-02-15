## -- Bland-Altman with Regression Line, LoAs, and 95% CI -- ##
# The procedures are applied following the recommendations presented in [1].
# -----------------------------------------------------------------------------
# Author: Guido Mascia -- mascia.guido@gmail.com
# Creation date: 10.01.2023
# Last edit: 15.02.2023
# -----------------------------------------------------------------------------
#   [1] Giavarina (2016). "Understanding Bland Altman analysis", Biochemia 
# Medica. doi: 10.11613/BM.2015.015
# -----------------------------------------------------------------------------
library(latex2exp) # for complex data labelling

# Load dataset
X <- read.csv('./data/BAP_Data.csv')

# Create the regression line of averages vs. differences
x_reg = 0.5 * (X$y + X$yhat)
y_reg = X$y - X$yhat

XY_reg <- lm(y_reg ~ x_reg)
# Extract coefficients
d <- summary(XY_reg)$coefficients

x0 = round(d[1,1], 3)
x1 = round(d[2,1], 3)

tlt = paste0('y - ŷ = ', x0, ' ', x1, ' · (y + ŷ) / 2')

## Plot averages vs. differences 
plot(x_reg, y_reg, 
     xlab = TeX(r'(($y + \hat{y}$) / 2 (cm))'),
     ylab = TeX(r'($y - \hat{y}$)'),
     title(tlt),
     xlim = c(0,50), ylim = c(-15, 15), col = 'black', pch = 16)

# Plot bias (average difference)
abline(h = mean((X$y - X$yhat)), lwd = 2, lty = 'dotted')

# Plot LoAs (b ± 1.96 SD)
abline(h = rep(mean((X$y - X$yhat)) - 1.96 * sd(X$y - X$yhat)), lwd = 2, 
       lty = 'dashed')
abline(h = rep(mean((X$y - X$yhat)) + 1.96 * sd(X$y - X$yhat)), lwd = 2, 
       lty = 'dashed')
abline(XY_reg, col= 'black')
text(1.2, 3.5, paste0("b = ", round(mean(X$y - X$yhat),1)))
text(2.6, 13, paste0("UB = ", round(mean(mean((X$y - X$yhat)) + 1.96 * sd(X$y - X$yhat)),1)))
text(2.4, -12.5, paste0("LB = ", round(mean(mean((X$y - X$yhat)) - 1.96 * sd(X$y - X$yhat)),1)))

## -- Confidence Intervals -- ##
# 95% CI = se · t, where:
# - se = sqrt(s^2 / n)
# - t is took from https://www.ttable.org/, and is equal to
t = 2.0195
n = 42

# Bias 95% CI
se_b = sqrt(sd((X$y - X$yhat))^2 / n)
CI = se_b * t
CI_b_low = mean((X$y - X$yhat)) - CI
CI_b_hig = mean((X$y - X$yhat)) + CI

rect(xleft = -10, xright = 200, ybottom = CI_b_low, ytop = CI_b_hig, 
     border = NA, col = adjustcolor('red4', alpha = 0.3))

# LoAs 95% CI
se_loa = sqrt(3 * sd((X$y - X$yhat))^2 / n)
CI_loa = se_loa * t

CI_lb_low = mean((X$y - X$yhat)) - 1.96 * sd((X$y - X$yhat)) - CI_loa
CI_lb_hig = mean((X$y - X$yhat)) - 1.96 * sd((X$y - X$yhat)) + CI_loa

CI_ub_low = mean((X$y - X$yhat)) + 1.96 * sd((X$y - X$yhat)) - CI_loa
CI_ub_hig = mean((X$y - X$yhat)) + 1.96 * sd((X$y - X$yhat)) + CI_loa

rect(xleft = -10, xright = 200, ybottom = CI_lb_low, ytop = CI_lb_hig, 
     border = NA, col = adjustcolor('blue4', alpha = 0.3))

rect(xleft = -10, xright = 200, ybottom = CI_ub_low, ytop = CI_ub_hig, 
     border = NA, col = adjustcolor('blue4', alpha = 0.3))
