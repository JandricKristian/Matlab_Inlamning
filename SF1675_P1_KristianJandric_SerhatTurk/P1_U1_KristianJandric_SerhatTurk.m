clear all
clc

% Kristian Jandric
% Serhat Türk
% T18

disp('Ange tre koordinater för två vektorer samt tre koordinater för två punkter ');
disp(' ');


%Vektor 1
disp(' ');
u = input('Mata in koordinaterna för vektorn u i formatet [x y z]: ');

%vetor 2
disp(' ');
v = input('Mata in koordinaterna för vektorn v i formatet [x y z]: ');
disp(' ');

%punkt 1
disp(' ');
P = input('Mata in koordinaterna för punkten P i formatet [x y z]: ');
disp(' ');

%punkt 2
disp(' ');
Q = input('Mata in koordinaterna för punkten Q i formatet [x y z]: ');
disp(' ');


% Räknar och skriver ut längden av vektorn u

uLangd = hurLang(u);

disp(' ');
disp(['Längden av vektorn u = ',num2str(uLangd)]);

% Räknar och skriver ut längden av vektorn v

vLangd = hurLang(v);

disp(' ');
disp(['Längden av vektorn v = ',num2str(vLangd)]);


% Räknar och skriver ut längden av vektorn u + v

uvLangd = hurLang(u + v);

disp(' ');
disp(['Längden av vektorn u + v = ',num2str(uvLangd)]);

% Räknar och skriver ut vinkeln mellan u och v

uvVinkel = acosd(sum(u.*v)/(uLangd*vLangd));

disp(' ');
disp(['Vinkeln mellan u och v = ',num2str(uvVinkel),'°']);

% Räknar och skriver ut skalärprodukt samt kryssprodukt

uvSkalar = Skalar(u, v);
uvKryss = kryssa(u, v);
vuKryss = uvKryss * -1;

disp(' ');
disp(['Skalärprodukten av u * v blir = ',num2str(uvSkalar)]);

disp(' ');
disp(['Kyrssprodukten av u x v blir = ',num2str(uvKryss)]);

disp(' ');
disp(['Kyrssprodukten av v x u blir = ',num2str(vuKryss)]);


% Räknar och skriver ut projektionen av u på v 

projU = projektor(u, v);

disp(' ');
disp(['Projektionen av u på v = ',num2str(projU)]);

% Räknar och skriver ut projektionen av v på u 

projV = projektor(v, u);

disp(' ');
disp(['Projektionen av v på u = ',num2str(projV)]);

% Räknar och skriver ut avståndet mellan punkten P och linjen given av
% vektorn v

avstandPL = hurLang(P - projektor(P, v));

disp(' ')
dmin = input('Du blir varnad när avståndet PL < (ditt inmatade värde): ');

disp(' ');
disp(['Avståndet mellan punkten P och linjen L som ges av vektorn v = ',num2str(avstandPL)]);

if avstandPL < dmin
    disp(['Varning! avståndet PL är mindre än det angivna värdet (',num2str(avstandPL),' < ',num2str(dmin),')'])

end

% Räknar och skriver ut normalen till planet s

sNormal = kryssa(u, v);

% Kollar ifall vektorerna är parallella

if sNormal(1) == 0 && sNormal(2) == 0 && sNormal(3) == 0
        
    disp(' ');
    disp('Ett plan kan ej skapas då vektorerna är parallella. Testa andra vektorer.');
else
    
    disp(' ');
    disp(['Normalen till planet som bildas av u, v och Q = ', num2str(sNormal)]);

    % Räknar och skriver ut avståndet mellan punkten P och planet S

    QP = P - Q;
    avstandPS = hurLang(projektor(QP, sNormal));

    disp(' ');
    disp(['Avståndet mellan punkten P och planet S som ges av vektorn v = ',num2str(avstandPS)]);
end
