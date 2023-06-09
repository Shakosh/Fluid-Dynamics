function delta = getdelta(theta, M1)

    num = M1^2*sind(theta)^2 - 1;
    den = M1^2*(1.4 + cosd(2*theta)) + 2;
    frac = num/den;
    out = 2*cotd(theta);
    delta = atand(out*frac);
    
end