function [IP,df,PO,D,P,FullLUT]=nco_calc(F0,Fs,N,pg,SFDR)
    pr = pg*pi/180;              % Fase inicial en radianes.
    IP = ceil((F0*2^N)/Fs);      % Incremento de fase.
    df = Fs/(2^N);               % Verificar el valor real de la resolucion en frecuencia lograda.
    PO = ceil(((2^N)*pr)/(2*pi));% Verificar el offset de fase logrado.
    P  = ceil((abs(SFDR)-12)/6); % Calcular el número de bits del cuantificador de fase.
    D  = N-P;                    % Calcular el número de bits del Dither.
    FullLUT=-1+2^(P-2);          % Número de datos en la LUT.
