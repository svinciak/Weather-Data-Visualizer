% |1.MESIAC|2.DEN|3.HODINA|4.MINUTA
% |5.TEPLOTA|6.VLHKOST|7.RYCHLOST VETRA
% |8.SMER VETRA|9.TLAK|10.SLNECNE ZIARENIE

function start()
    disp("Vyber si z výberu funkcií: ");
    disp("(1) Mesačné štatistiky");
    disp("(2) Denné štatistiky");
    vstupUzivatela = input("Zadaj číslom: ");
    switch vstupUzivatela
        case 1
            volbaMesacne();
        case 2
            volbaDenne();
        otherwise
            volbaMesacne();
    end
end

function volbaMesacne()
    disp("Vyber si z výberu funkcií: ");
    disp("(1) Priemerná teplota vybraného mesiaca");
    disp("(2) Najteplejší deň v mesiaci");
    disp("(3) Zoradiť dni podľa slnečnosti");
    disp("(4) Zoradiť dni podľa vlhkosti");
    disp("(5) Priemerná vlhkosť vybraného mesiaca");
    disp("(6) Zoradiť dni mesiaca podľa priemeru mesačných hodnôt");
    disp("(7) Priemerný smer vetra dní v mesiaci");
    vstupUzivatela = input("Zadaj číslom: ");
    switch vstupUzivatela
        case 1
            mesiac = mesiacInput();
            priemernaTeplotaVybranehoMesiaca(mesiac);
        case 2
            mesiac = mesiacInput();
            najteplejsiDenVMesiaci(mesiac)
        case 3
            mesiac = mesiacInput();
            zoraditDniPodlaSlnecnosti(mesiac);
        case 4
            mesiac = mesiacInput();
            zoraditDniPodlaVlhkosti(mesiac);
        case 5
            mesiac = mesiacInput();
            priemernaVlhkostVybranehoMesiaca(mesiac);
        case 6
            mesiac = mesiacInput();
            meranie = typMeraniaInput();
            zoradDniMesiacaPodlaPriemeruMeranychHodnot(mesiac, meranie)
        case 7
            mesiac = mesiacInput();
            priemernySmerVetraZaDni(mesiac);
        otherwise
            error("Zlý input, skús znova");
    end
end

function volbaDenne()
    disp("Vyber si z výberu funkcií: ");
    disp("(1) Najteplejšia hodina");
    disp("(2) Najslnečnejšia hodina");
    disp("(3) Najveternejšia hodina");
    vstupUzivatela = input("Zadaj číslom: ");
    
    switch vstupUzivatela
        case 1
            den = input("Zadaj číslom deň v mesiaci: ");
            mesiac = mesiacInput();
            najteplejsiaHodina(mesiac, den)
        case 2
            den = input("Zadaj číslom deň v mesiaci: ");
            mesiac = mesiacInput();
            najslnecnejsiaHodina(mesiac, den)
        case 3
            den = input("Zadaj číslom deň v mesiaci: ");
            mesiac = mesiacInput();
            najveternejsiaHodina(mesiac, den)
    end
end

function [typMerania] = mesiacInput()
    disp("(1) JANUAR");
    disp("(2) FEBRUAR");
    disp("(3) MAREC");
    disp("(4) APRIL");
    disp("(5) MAJ");
    disp("(6) JUN");
    disp("(7) JUL");
    disp("(8) AUGUST");
    disp("(9) SEPTEMBER");
    disp("(10) OKTOBER");
    disp("(11) NOVEMBER");
    disp("(12) DECEMBER");
    typMerania = input("Zadaj mesiac: ");
    switch (typMerania)
        case 1
            typMerania = 1;
        case 2
            typMerania = 2;
        case 3
            typMerania = 3;
        case 4
            typMerania = 4;
        case 5
            typMerania = 5;
        case 6
            typMerania = 6;
        case 7
            typMerania = 7;
        case 8
            typMerania = 8;
        case 9
            typMerania = 9;
        case 10
            typMerania = 10;
        case 11
            typMerania = 11;
        case 12
            typMerania = 12;
        otherwise
            disp("Nezadal si spravnu hodnoty, zadaj znova:");
            typMeraniaInput();
    end
end

function [typMerania] = typMeraniaInput()
    disp("Zadaj typ meranej hodnoty:");
    disp("(1) TEPLOTA");
    disp("(2) VLHKOST");
    disp("(3) RYCHLOST VETRA");
    disp("(4) SMER VETRA");
    disp("(5) TLAK");
    disp("(6) SLNECNE ZIARENIE");
    typMerania = input("--------");
    switch (typMerania)
        case 1
            typMerania = 5;
        case 2
            typMerania = 6;
        case 3
            typMerania = 7;
        case 4
            typMerania = 8;
        case 5
            typMerania = 9;
        case 6
            typMerania = 10;
        otherwise
            disp("Nezadal si spravnu hodnoty, zadaj znova:");
            typMeraniaInput();
    end
end

function [pocetDni] = pocetDniMesiac(mesiac)
    priemernaTeplotaVybranehoMesiaca(1);
    switch(mesiac)
        case 1
            pocetDni = 30;
        case 2
            pocetDni = 28;
        case 3
            pocetDni = 31;
        case 4
            pocetDni = 30;
        case 5
            pocetDni = 31;
        case 6
            pocetDni = 30;
        case 7
            pocetDni = 31;
        case 8
            pocetDni = 31;
        case 9
            pocetDni = 30;
        case 10
            pocetDni = 31;
        case 11
            pocetDni = 30;
        case 12
            pocetDni = 31;
        otherwise
            pocetDni = 30;
    end
end

%%% POVINNE FUNKCIE - VYBER DAT %%%
function [vybraneDataMesiac] = vyberDataMesiac(mesiac, typMerania)
    load("meteodata.mat");
    vybraneDataMesiac = [];
    for i = 1:size(meteodata, 1)
        if meteodata(i, 1) == mesiac
            vybraneDataMesiac = [vybraneDataMesiac; meteodata(i, typMerania)];
        end
    end
end

function [vybraneDataDen] = vyberDataDen(den, mesiac, typMerania)
    load("meteodata.mat");
    vybraneDataDen = [];
    for i = 1:size(meteodata)
        if meteodata(i, 1)==mesiac && meteodata(i, 2)==den
            vybraneDataDen = [vybraneDataDen; meteodata(i, typMerania)];
        end
    end
end

function [vybraneDataDen] = vybratOdDo(mesiac, odDen, doDen, typDat)
load("meteodata.mat");
vybraneDataDen = [];

%kontrola vstupnych udajov
if mesiac < 1 || mesiac > 12
    disp("Zadal si neplatný časový rozsah.");
elseif odDen < 1 || doDen < 1 || odDen > doDen
    disp('Zadaj platný rozsah dní.');
elseif typDat < 1 || typDat > size(meteodata, 2)
    disp('Typ dát nie je platný.');
else
    vybraneRiadky = (meteodata(:, 1) == mesiac) & (meteodata(:, 2) >= odDen) & (meteodata(:, 2) <= doDen);
    vybraneDataDen = meteodata(vybraneRiadky, typDat);
    disp(vybraneDataDen);
end
end

%%% POVINNE FUNKCIE - MESACNE STATISTIKY %%%
function priemernaTeplotaVybranehoMesiaca(mesiac)
    load("meteodata.mat");
    if mesiac < 1 || mesiac > 12
        disp('Mesiac musí byť v rozmedzí 1 až 12.');
    end
    
    teploty = vyberDataMesiac(mesiac, 5);
    suma = 0;
    pocet = 0;
    
    for i = 1:length(teploty)
        suma = suma + teploty(i);
        pocet = pocet + 1;
    end
    
    priemer = suma / pocet;
    plot(teploty);
    ciarka = yline(priemer, 'r', 'Priemer', 'LineWidth',2);
    disp("Priemerná teplota je: " + priemer + " °C.");
    
    ylabel('Teplota (°C)');
    title('Denné teploty');
    legend('Ostatné dni', 'Teplotný priemer', 'Location', 'best');
end

function najteplejsiDenVMesiaci(mesiac)
    load("meteodata.mat");
    if mesiac < 1 || mesiac > 12
        error("Mesiac musí byť v rozmedzí 1 až 12.");
    end
    dniData = vyberDataMesiac(mesiac, 2);
    dniATeploty = [];
    
    for i = 1:length(dniData)
        aktualnyDen = dniData(i);
    
        %kontrola, ci je spracovany
        uzExistuje = false;
        for j = 1:size(dniATeploty, 1)
            if dniATeploty(j, 1) == aktualnyDen
                uzExistuje = true;
                break;
            end
        end
        %ak nie je spracovany
        if ~uzExistuje
            teplotaAktualnyDen = vyberDataDen(aktualnyDen, mesiac, 5);
            %10 najvyssich teplot v aktualnom dni
            topTeploty = zeros(1, 10);
            for k = 1:10
                [maxTeplota, index] = max(teplotaAktualnyDen);
                topTeploty(k) = maxTeplota;
                teplotyDna(index) = -9999999999;%tuto hodnotu potom ignorovat
            end
            %priemer teploty v dni
            priemernaTeplota = mean(topTeploty);
            dniATeploty = [dniATeploty; aktualnyDen, priemernaTeplota];
        end
    end
    
    %hladanie najvyssej priemernej teploty
    [maxHodnota, indexMax] = max(dniATeploty(:, 2));
    najteplejsiDen = dniATeploty(indexMax, :);%den a priemerna teplota
    
    %VYPIS DAT
    disp('Najteplejší deň v mesiaci:');
    disp(["Deň: " + num2str(najteplejsiDen(1)) + " | Priemerná teplota: " + num2str(najteplejsiDen(2)) + "  °C"]);
    
    figure;
    hold on;
    bar(dniATeploty(:, 1), dniATeploty(:, 2), 'b');
    bar(najteplejsiDen(1), najteplejsiDen(2), 'r');
    celkovyPriemer = mean(dniATeploty(:, 2));
    yline(celkovyPriemer, 'g', 'Priemer', 'LineWidth', 2);
    hold off;
    xlabel('Deň');
    ylabel('Priemerná teplota (°C)');
    title('Priemerné teploty počas dní v mesiaci');
    legend('Ostatné dni', 'Najteplejší deň', 'Location', 'best');
end

function zoraditDniPodlaSlnecnosti(mesiac)
load("meteodata.mat");

dni = vyberDataMesiac(mesiac, 2);
ziarenie = vyberDataMesiac(mesiac, 10);

% pridanie jedinecnych dni
jedinecneDni = [];
for i = 1:length(dni)
    uzExistuje = false;
    for j = 1:length(jedinecneDni)
        if dni(i) == jedinecneDni(j)
            uzExistuje = true;
            break;
        end
    end
    if ~uzExistuje
        jedinecneDni = [jedinecneDni; dni(i)];
    end
end

% pocitanie priemerneho ziarenie pre kazdy den
priemer = [];
for i = 1:length(jedinecneDni)
    aktualnyDen = jedinecneDni(i);
    suma = 0;
    pocet = 0;
    for j = 1:length(dni)
        if dni(j) == aktualnyDen
            suma = suma + ziarenie(j);
            pocet = pocet + 1;
        end
    end
    priemer = [priemer; aktualnyDen, suma / pocet];
end

% bubble sort na zoradenie dni
n = size(priemer, 1);
for i = 1:n-1
    for j = i+1:n
        if priemer(j, 2) > priemer(i, 2)
            temp = priemer(i, :);
            priemer(i, :) = priemer(j, :);
            priemer(j, :) = temp;
        end
    end
end

%vypis
disp("Zoradené dni (" + length(jedinecneDni) + " dní) podľa priemerného slnečného žiarenia (zostupne):");
for i = 1:size(priemer, 1)
    disp("Deň: " + priemer(i, 1) + ", Priemerné slnečné žiarenie: " + priemer(i, 2) + " w/m2.");
end
end

function zoraditDniPodlaVlhkosti(mesiac)
priemerDni = priemerDniMesiac(mesiac, 6);

% select sort na zoradenie dni
n = size(priemerDni, 1);
for i = 1:n-1
    minIndex = i;
    for j = i+1:n
        if priemerDni(j, 2) < priemerDni(minIndex, 2)
            minIndex = j;
        end
    end
    if minIndex ~= i
        temp = priemerDni(i, :);
        priemerDni(i, :) = priemerDni(minIndex, :);
        priemerDni(minIndex, :) = temp;
    end
end
disp('Zoradené dni podľa vlhkosti:');
for i = 1:n
    disp("Deň: " + num2str(priemerDni(i, 1)) + ", Vlhkosť: " + num2str(priemerDni(i, 2)));
end

%graf
dni = priemerDni(:, 1);
vlhkosti = priemerDni(:, 2);
figure;
bar(dni, vlhkosti, 'b');
hold on;
grid on;
priemernaVlhkost = mean(vlhkosti);
line([min(dni)-0.5, max(dni)+0.5], [priemernaVlhkost, priemernaVlhkost], 'Color', 'r', 'LineStyle', '--', 'LineWidth', 2);

title("Priemerna vlhkost dní - Mesiac " + mesiac);
xlabel('Dni v mesiaci');
ylabel('Priemerná vlhkosť');
xlim([min(dni)-0.5, max(dni)+0.5]);
ylim([0, max(vlhkosti) + 5]);
legend({'Priemerná vlhkosť dní', 'Priemerná vlhkosť'}, 'Location', 'best');
hold off;
end

function priemernaVlhkostVybranehoMesiaca(mesiac)
    load("meteodata.mat");
    if mesiac < 1 || mesiac > 12
        disp('Mesiac musí byť v rozmedzí 1 až 12.');
    end
    poleDat = priemerDniMesiac(mesiac, 6);
    dni = poleDat(:, 1);
    priemerneVlhkosti = poleDat(:, 2);
    celkovaPriemernaVlhkost = mean(priemerneVlhkosti);
    disp("Celková priemerná vlhkosť celého mesiaca je: " + celkovaPriemernaVlhkost + " %.");
    %GRAF
    figure;
    plot(dni, priemerneVlhkosti, '-o', 'LineWidth', 2, 'MarkerSize', 8);
    grid on;
    title("Priemerná vlhkosť pre mesiac " + mesiac);
    xlabel('Dni v mesiaci');
    ylabel('Priemerná vlhkosť (%)');
    yline(celkovaPriemernaVlhkost, 'Color', 'g', 'LineWidth', 2);
    xlim([min(dni) - 1, max(dni) + 1]);
    ylim([min(priemerneVlhkosti) - 5, max(priemerneVlhkosti) + 5]);
    legend({'Priemerná vlhkosť dní', 'Celková priemerná vlhkosť mesiaca'}, 'Location', 'best');
end

function zoradDniMesiacaPodlaPriemeruMeranychHodnot(mesiac, typMerania)
    priemerDni = priemerDniMesiac(mesiac, typMerania);
    pocetDni = length(priemerDni(:, 1));
    
    % bubble sort na zoradenie dni
    n = size(priemerDni, 1);
    for i = 1:n-1
        for j = i+1:n
            if priemerDni(j, 2) > priemerDni(i, 2)
                temp = priemerDni(i, :);
                priemerDni(i, :) = priemerDni(j, :);
                priemerDni(j, :) = temp;
            end
        end
    end
    
    %vypis
    disp("Zoradené dni (" + length(pocetDni) + " dní): ");
    for i = 1:size(priemerDni, 1)
        disp("Deň: " + priemerDni(i, 1) + ", Priemer: " + priemerDni(i, 2));
    end
end

function [poleDat] = priemerDniMesiac(mesiac, typMerania)
load("meteodata.mat");
dni = [];
meranieHodnoty = [];
for i = 1:size(meteodata, 1)
    if meteodata(i, 1) == mesiac
        dni = [dni; meteodata(i, 2)];
        meranieHodnoty = [meranieHodnoty; meteodata(i, typMerania)];
    end
end

% pridanie jedinecnych dni
jedinecneDni = [];
for i = 1:length(dni)
    uzExistuje = false;
    for j = 1:length(jedinecneDni)
        if dni(i) == jedinecneDni(j)
            uzExistuje = true;
            break;
        end
    end
    if ~uzExistuje
        jedinecneDni = [jedinecneDni; dni(i)];
    end
end

% pocitanie priemeru pre kazdy den
priemer = [];
for i = 1:length(jedinecneDni)
    aktualnyDen = jedinecneDni(i);
    suma = 0;
    pocet = 0;
    for j = 1:length(dni)
        if dni(j) == aktualnyDen
            suma = suma + meranieHodnoty(j);
            pocet = pocet + 1;
        end
    end
    priemer = [priemer; aktualnyDen, suma / pocet];
end

poleDat = priemer;
end

function [poleDni] = vratPocetDniMesiaca(mesiac)
    dni = vyberDataMesiac(mesiac, 2);
    jedinecneDni = [];
    for i = 1:length(dni)
        uzExistuje = false;
        for j = 1:length(jedinecneDni)
            if dni(i) == jedinecneDni(j)
                uzExistuje = true;
                break;
            end
        end
        if ~uzExistuje
            jedinecneDni = [jedinecneDni; dni(i)];
        end
    end
    poleDni = jedinecneDni;
end

function priemernySmerVetraZaDni(mesiac)
    smeryVetra = priemerDniMesiac(mesiac, 8);
    dni = smeryVetra(:, 1);
    stupne = smeryVetra(:, 2);
    
    %vypocitanie smery vetra
    smery = ["Sever", "Severovýchod", "Východ", "Juhovýchod", "Juh", "Juhozápad", "Západ", "Severozápad"];
    uhly = [0, 45, 90, 135, 180, 225, 270, 315, 360];
    smerPopis = strings(size(stupne));
    for i = 1:length(stupne)
        for j = 1:length(uhly)-1
            if stupne(i) >= uhly(j) && stupne(i) < uhly(j+1)
                smerPopis(i) = smery(j);
                break;
            end
        end
    end

    %graf
    figure;
    grid on;
    stem(dni, stupne, 'filled', 'LineWidth', 2, 'LineStyle','none','Color','g');
    title("Priemerný smer vetra za dni v mesiaci " + mesiac);
    xlabel("Dni v mesiaci");
    ylabel("Smer vetra (stupne)");
    xticks(dni);
    for i = 1:length(dni)
        text(dni(i), stupne(i) + 10, smerPopis(i), 'HorizontalAlignment', 'center');
    end
end

%%% POVINNE FUNKCIE - DENNE STATISTIKY

function najteplejsiaHodina(mesiac, den)
load("meteodata.mat");
teploty = vyberDataDen(den, mesiac,5);
hodiny = vyberDataDen(den, mesiac,3);

maxTeplota = -9999999999;
najHodina = -1;
for i = 1:length(teploty)
    if teploty(i) > maxTeplota
        maxTeplota = teploty(i);
        najHodina = hodiny(i);
    end
end
disp("Najteplejšia hodina dňa bola v hodine: " + najHodina + " s maximálnou teplotou: " +maxTeplota + "°C.");
end

function najslnecnejsiaHodina(mesiac, den)
load("meteodata.mat");
slnecnost = vyberDataDen(den, mesiac, 10);
hodiny = vyberDataDen(den, mesiac, 3);

maxSlnecnost = -9999999999;
najHodina = -1;
for i = 1:length(slnecnost)
    if slnecnost(i) > maxSlnecnost
        maxSlnecnost = slnecnost(i);
        najHodina = hodiny(i);
    end
end
disp("Najslnečnejia hodina dňa bola v: ")
disp("Deň: " + den);
disp("Mesiac: " + mesiac);
disp("Hodina: " + najHodina);
disp("Slnečné žiarenie: " + maxSlnecnost + " w/m2.");

figure;
%stem(hodiny, slnecnost, 'b', 'LineWidth', 3);
bar(slnecnost, 'blue', 'LineWidth',1,'BarWidth',1);
%plot(hodiny, slnecnost);

hold on;
ylabel('Slnečné žiarenie (w/m2)');
end

function najveternejsiaHodina(mesiac, den)
load("meteodata.mat");
if mesiac < 1 || mesiac > 12
    error('Mesiac musí byť v rozmedzí 1 až 12.');
end
hodinyData = vyberDataDen(den, mesiac, 3);
vietorData = vyberDataDen(den, mesiac, 6);
hodiny = [];
priemerneRychlosti = [];

for i = 1:length(hodinyData)
    aktualnaHodina = hodinyData(i);
    spracovane = false;
    for j = 1:length(hodiny)
        if hodiny(j) == aktualnaHodina
            spracovane = true;
            break;
        end
    end

    if ~spracovane
        hodiny = [hodiny; aktualnaHodina];
        %vypocitanie priemeru pre kazdu hodinu
        sucty = 0;
        pocet = 0;
        for k = 1:length(hodinyData)
            if hodinyData(k) == aktualnaHodina
                sucty = sucty + vietorData(k);
                pocet = pocet + 1;
            end
        end
        priemerneRychlosti = [priemerneRychlosti; sucty / pocet];
    end
end

[maxRychlost, indexMax] = max(priemerneRychlosti);
najsilnejsiaHodina = hodiny(indexMax);
figure;
bar(hodiny, priemerneRychlosti, 'b'); %modre stlpce
hold on;
bar(najsilnejsiaHodina, maxRychlost, 'r');%max
hold off;

title("Rýchlosť vetra - Mesiac " + mesiac + ", " + "Deň " + den);
xlabel("Hodina");
ylabel("Rýchlosť vetra (m/s)");
legend("Rýchlosť vetra", "Najsilnejší vietor");
end

%%%%%%% VOLANIE METOD
%vyberDataMesiac(1,5);
%vyberDataDen(1,1,6);
%vybratOdDo(1,3,5,7);

%===MESACNE STATS===%
%priemernaTeplotaVybranehoMesiaca(2);
%najteplejsiDenVMesiaci(2);
%zoraditDniPodlaSlnecnosti(2);
%zoraditDniPodlaVlhkosti(1);
%priemernaVlhkostVybranehoMesiaca(1);
%priemerDniMesiac(2,5)
%zoradDniMesiacaPodlaPriemeruMeranychHodnot(1,8);
%priemernySmerVetraZaDni(1);

%===DENNE STATS===
%najteplejsiaHodina(1,1);
%najslnecnejsiaHodina(1,1);
%najveternejsiaHodina(2,5);
start();