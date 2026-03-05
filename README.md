# LAB2-INSTRUMENTACION
INTEGRANTES: Shesly Colorado 5600756 - Santiago Mora 5600 - Daniel

# INTRODUCIÓN

La actividad electrodérmica (EDA) hace referencia a los cambios eléctricos que ocurren en la piel debido a la actividad del sistema nervioso autónomo. Estos cambios están asociados principalmente con la actividad de las glándulas sudoríparas y pueden medirse a través de la conductancia cutánea, también conocida como respuesta galvánica de la piel (GSR).

La conductancia cutánea aumenta cuando el sistema nervioso simpático se activa, lo que ocurre durante estados emocionales intensos como estrés, ansiedad o excitación. Esto se debe a que la activación simpática provoca la secreción de sudor en las glándulas sudoríparas, reduciendo la resistencia eléctrica de la piel y aumentando su conductividad.

En esta práctica se desarrolló un sistema electrónico capaz de medir variaciones en la conductancia cutánea mediante un sensor de humedad colocado en la piel y un circuito de adquisición basado en Arduino/ESP, y una resistencia y capacitor en paralelo, permitiendo monitorear cambios asociados a estados fisiológicos del sujeto. La práctica permite comprender tanto los principios fisiológicos como los aspectos electrónicos de la medición de señales biomédicas.

# OBJETIVOS
## Objetivo general
 Proporcionar un sistema de medición continua de estrés basado en respuesta galvánica cutánea (GSR).

## Objetivos especificos
• Identificar las componentes estacionaria y transitoria de la GSR.

• Elaborar un dispositivo vestible que permita capturar de forma continua las variaciones de la GSR.

• Plantear hipótesis desde la fisiología humana sobre el rol de la GSR como indicador de estrés.

# MARCO TEORICO
### Respuesta galvánica cutánea (GSR)

La respuesta galvánica cutánea es un fenómeno fisiológico asociado a cambios en la conductancia eléctrica de la piel producidos por la actividad de las glándulas sudoríparas.

Cuando una persona experimenta estrés o estímulos emocionales, el sistema nervioso simpático activa las glándulas sudoríparas ecrinas. Esto incrementa la cantidad de sudor en la superficie de la piel, lo cual disminuye su resistencia eléctrica y aumenta la conductividad.

La señal GSR tiene dos componentes principales:

• Componente tónica (SCL)

Skin Conductance Level: nivel basal de conductancia de la piel.

• Componente fásica (SCR)

Skin Conductance Response: cambios rápidos en la conductancia en respuesta a estímulos.

### Glándulas sudoríparas y medición de GSR

Las glándulas sudoríparas ecrinas se encuentran distribuidas en toda la superficie de la piel, pero su densidad es mayor en ciertas regiones del cuerpo.

Las zonas con mayor densidad de glándulas sudoríparas son:

• Palmas de las manos

• Yemas de los dedos

• Plantas de los pies

• Muñeca o antebrazo

• Frente (cuero cabelludo)

 • Axilas

 • Pecho

 • Espalda

 Pero las màs usadas para medir GSR son las yemas de los dedos, palmas de las manos, muñeca o axila, pero esta se somete a señal por movimiento.

 # MATERIALES

· Arduino UNO o ESP32

· Computador con MATLAB

· Protoboard

· Resistencia 68 kΩ

· Condensador 1 µF

· Electrodos Ag/AgCl o sensor que condusca

· Cables de conexión

# DISEÑO DEL SISTEMA

El sistema de medición se basa en un divisor resistivo donde la piel actúa como una resistencia variable.

El circuito diseñado utiliza:

· Una resistencia fija de 68 kΩ

· La resistencia de la piel Rskin

· Un capacitor de 1 µF para filtrar ruido

El circuito funciona de la siguiente forma:

Cuando la conductancia de la piel aumenta debido al sudor, la resistencia disminuye y el voltaje medido cambia. Este cambio es leído por el microcontrolador.

# Cálculo de seguridad eléctrica

# PARTE A
## Revisión bibliográfica

La actividad electrodérmica es una de las respuestas fisiológicas más utilizadas para evaluar la activación del sistema nervioso autónomo. La medición de la GSR permite identificar estados emocionales y de estrés mediante cambios en la conductancia de la piel.

### Efectos de la corriente en el cuerpo humano

De acuerdo con la norma IEC 60479, los efectos de la corriente eléctrica dependen de:

· Intensidad de corriente

· Tiempo de exposición

· Trayectoria de la corriente

Corrientes menores a 1 mA generalmente no generan efectos fisiológicos significativos.

### Diseño del dispositivo vestible

El dispositivo se diseñó utilizando:

· Sensor de humedad

· Velcro para fijación

· Microcontrolador ESP/Arduino

· Transmisión de datos al computador por via blut

El sensor se ubica en los dedos índice y medio para maximizar la sensibilidad del sensor.

# PARTE B

Se construyó el dispositivo utilizando protoboard y microcontrolador.

El sistema permitió visualizar en MATLAB los cambios de conductancia de la piel en tiempo real.

Se realizaron pruebas con un sujeto en reposo y durante diferentes actividades:

· Respiración profunda

· Escritura

· Movimiento de la mano

Se observó que durante la respiración profunda se produce un aumento en la conductancia cutánea seguido de un retorno gradual al nivel basal.

Con base en los valores medidos se definieron tres niveles de estrés:

Nivel	      /       Conductancia

Bajo        /     	Nivel basal

Moderado	  /     Incremento leve

Alto	      /  Incremento significativo

# PARTE C

Se implementó transmisión inalámbrica utilizando un microcontrolador ESP.

El sistema envía un mensaje indicando el nivel de estrés:

· Bajo

· Medio

· Alto

Durante la prueba, el sujeto respiro bruscamente mientras se registraba la señal GSR.

Se observó un aumento significativo en la conductancia durante los momentos de mayor concentración.

# ANALISIS DE RESULTADOS

# PREGUNTAS DE DISCUSIÒN 
• Pregunta 1: ¿A qué se debe que una inspiración profunda incremente la magnitud de la respuesta galvánica cutánea (GSR)?

• Pregunta 2: ¿Cuáles serían las ventajas y desventajas de utilizar la GSR como indicador de estrés?

# BIBLIOGRAFIA





