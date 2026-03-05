# LAB2-INSTRUMENTACION


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

# 6. Cálculo de seguridad eléctrica

## 6.1 Análisis de la corriente máxima en el sistema


En dispositivos biomédicos que tienen contacto con el cuerpo humano es fundamental limitar la corriente que puede circular por el sujeto para evitar riesgos eléctricos. En este circuito se utiliza una resistencia de **68 kΩ** conectada en serie con la resistencia de la piel, la cual actúa como elemento limitador de corriente.

La corriente que circula por el sistema puede calcularse usando la ley de Ohm:

$$
I = \frac{V}{R_1 + R_{piel}}
$$


- $V$ es el voltaje de alimentación del sistema  
- $R_1 = 68\,k\Omega$ es la resistencia limitadora  
- $R_{piel}$ es la resistencia de la piel del sujeto  

De acuerdo con estudios sobre actividad electrodérmica, la resistencia de la piel normalmente se encuentra en un rango aproximado entre **300 kΩ y 2 MΩ** (Boucsein, 2012).

Para verificar la seguridad del sistema se analiza el **peor de los casos**, lo que quiere decir, cuando la resistencia de la piel se aproxima a cero:

$$
R_{piel} = 0
$$

En esta condición, la corriente máxima del sistema estaría limitada únicamente por la resistencia de **68 kΩ**:

$$
I_{max} = \frac{V}{68\,k\Omega}
$$

Si el circuito se alimenta con **3.3 V**, como ocurre cuando se utiliza una ESP32:

$$
I_{max} = \frac{3.3}{68000}
$$

$$
I_{max} = 0.0485\,mA
$$

Esto corresponde aproximadamente a **49 µA**, lo cual es un valor muy bajo y se encuentra muy por debajo del límite de **1 mA** utilizado comúnmente como referencia de seguridad en aplicaciones biomédicas de medición superficial (Webster, 2010).

Por lo tanto, el circuito diseñado limita adecuadamente la corriente que puede circular por el sujeto, garantizando condiciones seguras de operación.


## 6.2 Cumplimiento de normas de seguridad (IEC 60479)

La norma IEC 60479 describe los efectos que puede producir la corriente eléctrica cuando circula a través del cuerpo humano, estableciendo diferentes zonas de riesgo dependiendo de la magnitud de la corriente y del tiempo de exposición.

De acuerdo con esta norma, las corrientes eléctricas muy pequeñas, del orden de microamperios o fracciones de miliamperio, generalmente no producen efectos fisiológicos perceptibles en el cuerpo humano (IEC 60479-1, 2018). Los efectos más notorios, como contracciones musculares o dificultad para soltar un conductor, aparecen cuando las corrientes alcanzan valores mayores en el rango de miliamperios.

En el sistema implementado para esta práctica, la corriente máxima que podría circular por el sujeto se encuentra aproximadamente entre 0.049 mA y 0.074 mA, dependiendo del voltaje de alimentación. Estos valores son considerablemente menores que los niveles asociados con efectos fisiológicos peligrosos.

Además, el circuito incorpora una resistencia limitadora en serie, lo cual es una práctica ampliamente utilizada en instrumentación biomédica para garantizar la seguridad del paciente y evitar que corrientes peligrosas puedan circular en caso de fallas en el sistema (Webster, 2010).

Otro aspecto importante es que el sistema funciona con bajo voltaje (3.3 V o 5 V), lo que reduce aún más el riesgo eléctrico.

Teniendo en cuenta lo anterior, se puede afirmar que el diseño del circuito cumple con los principios de seguridad descritos en la norma IEC 60479, ya que la corriente que puede circular a través del cuerpo humano se mantiene muy por debajo de los niveles que podrían representar algún riesgo para el usuario.

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

1. Loggia, M. L., Juneau, M., & Bushnell, C. M. (2011). Autonomic responses to heat pain: Heart rate, skin conductance, and their relation to verbal ratings and stimulus intensity. Pain, 152(3), 592–598. https://doi.org/10.1016/j.pain.2010.11.032
2. Breimhorst, M., Sandrock, S., Fechir, M., Hausenblas, N., Geber, C., & Birklein, F. (2010). Do intensity ratings and skin conductance responses reliably discriminate between different stimulus intensities in experimentally induced pain? Journal of Pain, 12(1), 61–70. https://doi.org/10.1016/j.jpain.2010.04.012
3. Boucsein, Wolfram. (2013). Electrodermal activity: Second edition. 10.1007/978-1-4614-1126-0.
4. Dascălu, L. C., Babiș, C., Chivu, O., Iacobescu, G., Alecusan, A. M., & Semenescu, A. (2019). Measurements of galvanic skin response on subjects affected by stress. Acta Universitatis Cibiniensis Technical Series, 71(1), 25–29. https://doi.org/10.2478/aucts-2019-0006
5. Phadke, A. N., Harasheh, K., & Gill, S. (2025). Wearable IOT-Enabled Galvanic Skin Response Device for objective pain and stress monitoring: hardware design and prototype development. Sensors, 26(1), 116. https://doi.org/10.3390/s26010116
6. Swetha, K., & Kiran, K. V. D. (2025). Kalman‐Normalized GSR Analysis for Real‐Time Stress Quantification in wearable systems. International Journal of Telemedicine and Applications, 2025(1), 8828363. https://doi.org/10.1155/ijta/8828363
7. De Luca, PA, Sánchez A., ME, Pérez Olan, G., & Leija Salas, L. (2004). Medición integral del estrés crónico. Revista Mexicana De Ingeniería Biomédica , 25 (1), 60–66. Recuperado de https://mail.rmib.com.mx/index.php/rmib/article/view/263
8. Cruz, J. R. J., & River, M. a. G. (2019, November 29). ESTIMACIÓN DEL ESTRÉS POR MEDIO DE LA ENTROPÍA DE LA VARIABILIDAD DE LA FRECUENCIA CARDÍACA y LA RESPUESTA GALVÁNICA DE LA PIEL (ESTIMATION OF STRESS THROUGH ENTROPY OF VARIABILITY OF CARDIAC FREQUENCY AND GALVANIC SKIN RESPONSE). Jiménez Cruz | Pistas Educativas. https://pistaseducativas.celaya.tecnm.mx/index.php/pistas/article/view/2093
9. Sergio, A. R. (2016). Clasificación de niveles de estrés utilizando señales fisiológicas. https://e-archivo.uc3m.es/entities/publication/bf295ba9-911b-4bab-8632-cce450c21820
10. Varón, D. J., García, I. B., & Gupta, B. B. (2023). Análisis del estrés, atención, interés y conexión emocional en la enseñanza superior presencial y online: un estudio neurotecnológico. Dialnet. https://dialnet.unirioja.es/servlet/articulo?codigo=8947684
11. Vega, A., Bilbao, M., & Falappa, M. A. (2025, April 1). Workplace stress assessment using emotional recognition and heart rate techniques. https://sedici.unlp.edu.ar/handle/10915/178019



INTEGRANTES: Shesly Colorado - Santiago Mora  - Daniel Herrera



