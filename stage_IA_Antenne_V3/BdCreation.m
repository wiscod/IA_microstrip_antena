clear;close all;clc;%% Creation de la base de donn�e d'entrainement-validation-test% d�finition des plages de valeurs des entr�es de la BDH = 0.1:0.1:5;Er = 2.2:0.2:12;Fr = 1:0.1:10;Z0 = 50;% calcul de la taille de la bdsizeBd = length(H)*length(Er)*length(Fr);i=1;bd = zeros(sizeBd, 11);ticfor n=1:length(H)    for j=1:length(Er)        clc;        disp('H = '); disp(H(n));        disp('Er = '); disp(Er(j));        for k=1:length(Fr)            [Wp,Lp,Fi,Wf,Gpf,Lg,Wg] = antenna1(H(n),Er(j),Fr(k),Z0);            % entrees            bd(i,1) = H(n);            bd(i,2) = Er(j);            bd(i,3) = Fr(k);            bd(i,4) = Z0;            % sorties            bd(i,5) = Wp;            bd(i,6) = Lp;            bd(i,7) = Fi;            bd(i,8) = Wf;            bd(i,9) = Gpf;            bd(i,10) = Lg;            bd(i,11) = Wg;            i=i+1;        end    endendtoc                %%%->2877 sec (47 min)%125 -> 1s%500 -> 4s%1000 -> 8s%10.000 > 80s%100.000 -> 800s%500.000 -> 4000;%1.000.000 -> 8000s%% Stockage de la bd%save('database\bd_training.mat', 'bd');