clc; clear; close all;

%% ===== CARGAR ARCHIVO =====
load("dd.mat");  

% Detectar variable de señal
if exist('data','var')
    senal = data;
elseif exist('voltaje','var')
    senal = voltaje;
else
    error("No se encontró la señal en el archivo");
end

t = tiempo_total;

%% ===== INTERVALO A ANALIZAR 
t_inicio = 75;   
t_fin    = 131;   

idx = t >= t_inicio & t <= t_fin;

senal_seg = senal(idx);
t_seg = t(idx);

%% ===== FILTRO BUTTERWORTH PASA BAJAS =====
Fc = 0.5;     % frecuencia corte (Hz)
orden = 4;

[b,a] = butter(orden, Fc/(Fs/2), "low");

senal_filtrada = filtfilt(b,a,senal_seg);

%% ===== SUAVIZADO =====
senal_suave = movmean(senal_filtrada, Fs);

%% ===== GRAFICAS =====
figure

subplot(2,1,1)
plot(t_seg, senal_seg, 'b')
title("Señal GSR original")
xlabel("Tiempo (s)")
ylabel("Conductancia")
grid on

subplot(2,1,2)
plot(t_seg, senal_suave, 'r', 'LineWidth', 1.5)
title("Señal GSR filtrada")
xlabel("Tiempo (s)")
ylabel("Conductancia")
grid on