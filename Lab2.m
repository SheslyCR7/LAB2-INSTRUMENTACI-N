clc; clear; close all;

% ================= SOLICITUD DE DATOS =================
nombre = input('Ingrese su nombre: ', 's');
Trec = input('Ingrese la duración de la muestra en segundos: ');
archivo = nombre + ".mat";

% ================= CONFIGURACIÓN TÉCNICA =================
ip = "192.168.43.246";  
port = 80;

t = tcpclient(ip, port);

Fs = 50;                 
ventana = 10;            

Ntotal = Fs * Trec;      
Nvent = Fs * ventana;    

% Buffers
buffer = zeros(Nvent,1);     
voltaje = zeros(Ntotal,1);   

tiempo_total = (0:Ntotal-1)/Fs;
tiempo_vent = linspace(-ventana, 0, Nvent);

% ================= FIGURA =================
figure;
h = plot(tiempo_vent, buffer, 'LineWidth', 1.5);
xlabel('Tiempo (s)');
ylabel('Voltaje (V)');
title(['Señal respiratoria de: ', nombre]);
grid on;
ylim([0 1.5]);

% Texto de estado
estadoTxt = text(-ventana+1,1.3,"Estado: --","FontSize",14,"FontWeight","bold");

% ======== ADQUISICIÓN ========
disp("Iniciando grabación...");

for k = 1:Ntotal
    
    if t.NumBytesAvailable > 0
        
        valor = str2double(readline(t));
        
        if ~isnan(valor)
            
            voltaje(k) = valor;
            buffer = [buffer(2:end); valor];   
            
            % ===== CLASIFICACIÓN SIMPLE =====
            if valor < 0.4
                estado = "NORMAL";
                color = [0 0 1];        % azul
            elseif valor < 0.9
                estado = "MEDIA";
                color = [1 0.5 0];      % naranja
            else
                estado = "ALTA";
                color = [1 0 0];        % rojo
                beep;
            end

            set(h,'YData',buffer,'Color',color);
            set(estadoTxt,"String","Estado: " + estado,"Color",color);

            drawnow limitrate;
        end
    end
end

% Guardar datos
save(archivo,"voltaje","tiempo_total","Fs");

disp("Grabación finalizada y guardada como: " + archivo);