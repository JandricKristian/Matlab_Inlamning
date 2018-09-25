load fiskbana.mat

% Kristian Jandric
% Serhat Türk
% T18


% Alla vektorer och punkter för varje plan inmatade
u1 = [0 4 -1]; v1 = [3 -2 1]; Q1 = [1 2 3];
u2 = [-5 1 3]; v2 = [-1 0 1]; Q2 = [-10 -1 1];
u3 = [0 1 0]; v3 = [-1 1 1]; Q3 = [2 10 0];

% Matriser som tillåter en att gå igenom alla vektorer och
% punkter för varje plan på ett bättre sätt (blir lättare)
ua = [u1; u2; u3];
va = [v1; v2; v3];
Qa = [Q1; Q2; Q3];

% Denna for loop räknar ut och plottar alla nät (planen) samt
% den vägen fisken simmar
for plan = 1:3
    
    % Skriver ut plotten samt lägger till markörer och ändrar färg
    % på plotten
    p1 = plot3(X, Y, Z,'-o', 'MarkerIndices', 1);
    hold on
    p2 = plot3(X(end), Y(end), Z(end), '-p', 'MarkerIndices', 1);

    p1.Color = 'b';
    p2.Color = 'b';

    % Räknar och skriver ut nätet (planet)
    fyrkant = kryssa(ua(plan,:), va(plan,:));
    a = fyrkant(1);
    b = fyrkant(2);
    c = fyrkant(3);

    [Xp,Yp] = meshgrid(-15:0.5:15,-15:0.5:15);
    d = -(a*Qa(plan,1) + b*Qa(plan,2) + c*Qa(plan,3));
    Zp = -1 / c * ( a * Xp + b * Yp + d);
    mesh(Xp,Yp,Zp)
    
    % Sätter titel på plotten samt avslutar plotten 
    % (så att en ny plot kan skapas)
    title(['Fiskens bana plottad mot nätet (plan ',num2str(plan),')'])
    figure;
end

hold on
distvec = [];

% Denna for loop räknar, skriver ut och plottar avståndet
% mellan fisken och nätet (planet) med avseende på tid
% (sker tre gånger då vi ska räkna med 3 olika nät (plan))
for LOOP = 1:3
    
    % Sätter variablerna som krävs för att kolla avståndet mellan fisken
    % och nätet i varje punkt fisken befinner sig i innan den blir 
    % fångad
    natNormal = kryssa(ua(LOOP,:), va(LOOP,:));

    fisk = [X(1) Y(1) Z(1)];
    k = 1;
    
    avstand = hurLang(projektor(fisk - Qa(LOOP,:), natNormal));
    
    tempvec = [];
    
    % Kollar varje punkt i fiskens bana tills dess att avståndet 
    % mellan fisken och nätet blir mindre än 0.5 samt sparar alla
    % avstånd
    while avstand > 0.5 && k < length(T)
        
        k = k + 1;
        
        fisk = [X(k) Y(k) Z(k)];
        avstand = hurLang(projektor(fisk - Qa(LOOP,:), natNormal));
        
        tempvec = [tempvec, avstand];    
    end
    
    % Skriver ut ifall fisken blir fångad eller inte och i så fall
    % när den blev fångad
    if avstand < 0.5
        
        disp(['Fisk ', num2str(LOOP), ' fångad av nätet efter ', num2str(T(k)),' sekunder']);
    else
        
        disp(['Fisk ', num2str(LOOP), ' ej fångad av nätet inom 10 sekunder']);
    end
    
    % Plottar fiskens avstånd från nätet (planet) med avseende på tiden
    plot(T(1:length(tempvec)),tempvec);
    
    % Vi visste inte vad ni menade med att spara alla avstånd i distvec
    % så vi sparar alla värden vi kollat i distvec
    distvec = [distvec, tempvec];
end

% Lägger till titel, etiketter på axlarna samt en lista som visar vilken
% funktion som är vilken
xlabel('tid (s)')
ylabel('avstånd från nätet (obestämd enhet)');
legend('Plan 1','Plan 2','Plan 3');
title('fiskens avstånd från nätet med avseende på tid');
