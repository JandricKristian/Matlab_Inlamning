function p = projektor(c, d)

    % Funktionen beräknar projektionen av en vektor på en annan
    %Projektion av c på d
    p = Skalar(c, d)/(hurLang(d)^2)*d;

end