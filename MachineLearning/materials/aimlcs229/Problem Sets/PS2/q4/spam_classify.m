clc

%error_rate = xlsread('spam_classify.xls')

error_rate = [50	0.055493	0.069083
100	0.048698	0.071348
200	0.04077	0.057758
300	0.037373	0.04077
400	0.030578	0.038505
500	0.030578	0.033975]

x = error_rate(:,1);
y1 = error_rate(:,2);
y2 = error_rate(:,3);

plot(x,y1,x,y2)
