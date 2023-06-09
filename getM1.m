function M1 = getM1(theta, delta)

    num = cotd(theta)+tand(delta);
    den1 = -2*tand(delta)*cosd(theta)^2;
    den2 = 2*cotd(theta)*sind(theta)^2;
    den3 = tand(delta);
    den4 = -1.4*tand(delta);
    den = den1+den2+den3+den4;
    M1 = sqrt(2)*sqrt(num/den);

end