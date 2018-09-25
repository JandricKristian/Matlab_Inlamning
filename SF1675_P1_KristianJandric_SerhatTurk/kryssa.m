function k = kryssa(a, b)

    % Funktionen beräknar kryssprodukten av två vektorer
    if length(a) == 3 && length(b) == 3
       
        k = [a(2)*b(3)-b(2)*a(3),-a(1)*b(3)+b(1)*a(3),a(1)*b(2)-b(1)*a(2)];
    else
        disp('vektorerna måste vara rated R för R^3');
    end

end