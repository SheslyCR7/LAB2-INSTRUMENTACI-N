# Instrumentación Biomédica y Biosensores 
 LABORATORIO - 2 Estimación del nivel de estrés basada en la respuesta galvánica cutánea (GSR) 

###  Integrantes
- Shesly Nicole Colorado - 5600756
- Santiago Mora - 5600775
- Daniel Herrera - 5600588


## Requisitos
Software:
- Arduino IDE
- MATLAB

Hardware:
- Sensor de humedad del suelo YL-100
- ESP32
----
# INTRODUCCIÓN

La actividad electrodérmica (EDA) hace referencia a los cambios eléctricos que ocurren en la piel debido a la actividad del sistema nervioso autónomo. Estos cambios están asociados principalmente con la actividad de las glándulas sudoríparas y pueden medirse a través de la conductancia cutánea, también conocida como respuesta galvánica de la piel (GSR). [3][4]

La conductancia cutánea aumenta cuando el sistema nervioso simpático se activa, lo que ocurre durante estados emocionales intensos como estrés, ansiedad o excitación[1][3][7]. Esto se debe a que la activación simpática provoca la secreción de sudor en las glándulas sudoríparas, reduciendo la resistencia eléctrica de la piel y aumentando su conductividad.[3][4]

En esta práctica se desarrolló un sistema electrónico capaz de medir variaciones en la conductancia cutánea mediante un sensor de humedad colocado en la piel y un circuito de adquisición basado en Arduino/ESP, y una resistencia y capacitor en paralelo, permitiendo monitorear cambios asociados a estados fisiológicos del sujeto [5][6]. La práctica permite comprender tanto los principios fisiológicos como los aspectos electrónicos de la medición de señales biomédicas.

# OBJETIVOS
## Objetivo general
 Proporcionar un sistema de medición continua de estrés basado en respuesta galvánica cutánea (GSR).

## Objetivos específicos
• Identificar las componentes estacionaria y transitoria de la GSR.

• Elaborar un dispositivo vestible que permita capturar de forma continua las variaciones de la GSR.

• Plantear hipótesis desde la fisiología humana sobre el rol de la GSR como indicador de estrés.

# MARCO TEORICO
### Respuesta galvánica cutánea (GSR)

La respuesta galvánica cutánea es un fenómeno fisiológico asociado a cambios en la conductancia eléctrica de la piel producidos por la actividad de las glándulas sudoríparas [3][4].

<p align="center"> <img width="800" height="640" alt="image" src="https://github.com/user-attachments/assets/45591249-676b-473a-931f-4ad144596885" /> </p> <p align="center"> Fig. 1.Respuesta Galvánica Cutánea [15].


Cuando una persona experimenta estrés o estímulos emocionales, el sistema nervioso simpático activa las glándulas sudoríparas ecrinas[3]. Esto incrementa la cantidad de sudor en la superficie de la piel, lo cual disminuye su resistencia eléctrica y aumenta la conductividad.[1][3]

La señal GSR tiene dos componentes principales [3]:

• Componente tónica (SCL)

Skin Conductance Level: nivel basal de conductancia de la piel.

• Componente fásica (SCR)

Skin Conductance Response: cambios rápidos en la conductancia en respuesta a estímulos.

### Glándulas sudoríparas y medición de GSR

Las glándulas sudoríparas ecrinas se encuentran distribuidas en toda la superficie de la piel, pero su densidad es mayor en ciertas regiones del cuerpo [3].

<p align="center"> <img width="800" height="400" alt="image" src="https://github.com/user-attachments/assets/ae2ef1db-0e7e-44b9-ad91-171ce49c65e3" /> </p> <p align="center"> Fig. 2. Piel y Glandulas sudoriparas.



Las zonas con mayor densidad de glándulas sudoríparas son:

• Palmas de las manos

• Yemas de los dedos

• Plantas de los pies

• Muñeca o antebrazo

• Frente (cuero cabelludo)

 • Axilas

 • Pecho

 • Espalda

 Pero las más usadas para medir GSR son las yemas de los dedos, palmas de las manos, muñeca o axila, pero esta se somete a señal por movimiento [3][8].

# DISEÑO DEL SISTEMA
Para la elaboración de esta práctica de laboratorio se realizó el siguiente montaje para la captura de la señal de GSR:

<p align="center"> <img width="253" height="253" alt="image" src="https://github.com/user-attachments/assets/f8f58cac-d576-49e8-98c9-3aae4ef29f0c" /> </p> <p align="center"> Fig. 3. Montaje del circuito para la captura de GSR </p>

Para el diseño ergonómico del sistema mostrado en la Figura 1 se utilizó un microcontrolador ESP32  y como fuente 3 pila AAA los cuales estaban ubicados en una cinta velcro para adaparla al brazo como se muestra en la figura 2,y un sensor de humedad del suelo YL-100 adaptado en la palma de la mano para medir variaciones en la conductancia de la piel como se observa en la figuras 3.

<p align="center"> <img width="260" height="340" alt="image" src="https://github.com/user-attachments/assets/423da712-bb5e-430d-8ebf-56f6a756dbd8" /> </p> <p align="center"> Fig. 4. Ubicacion de microcontrolador y fuente</p>
<p align="center"> <img width="253" height="350" alt="image" src="https://github.com/user-attachments/assets/e14c7ebe-27bc-4b1c-860f-9c887c4defbc" />
 </p> <p align="center"> Fig. 5. Ubicacion del sensor</p>

El sistema de medición se basa en un divisor resistivo, donde la piel del sujeto actúa como una resistencia variable.

El circuito diseñado utiliza:

Una resistencia fija de 68 kΩ

La resistencia de la piel (Rskin)

Un capacitor de 1 µF para el filtrado de ruido

El circuito funciona de la siguiente manera:

Cuando la conductancia de la piel aumenta debido a la presencia de sudor, la resistencia de la piel disminuye y el voltaje medido en el divisor resistivo cambia. Esta variación de voltaje es leída por el microcontrolador, permitiendo registrar los cambios en la conductancia cutánea asociados a la actividad electrodérmica. [5][6]

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

De acuerdo con estudios sobre actividad electrodérmica, la resistencia de la piel normalmente se encuentra en un rango aproximado entre **300 kΩ y 2 MΩ** [3].

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

Esto corresponde aproximadamente a **49 µA**, lo cual es un valor muy bajo y se encuentra muy por debajo del límite de **1 mA** utilizado comúnmente como referencia de seguridad en aplicaciones biomédicas de medición superficial [13].

Por lo tanto, el circuito diseñado limita adecuadamente la corriente que puede circular por el sujeto, garantizando condiciones seguras de operación.


## 6.2 Cumplimiento de normas de seguridad (IEC 60479)

La norma IEC 60479 describe los efectos que puede producir la corriente eléctrica cuando circula a través del cuerpo humano, estableciendo diferentes zonas de riesgo dependiendo de la magnitud de la corriente y del tiempo de exposición [14].

De acuerdo con esta norma, las corrientes eléctricas muy pequeñas, del orden de microamperios o fracciones de miliamperio, generalmente no producen efectos fisiológicos perceptibles en el cuerpo humano [14]. Los efectos más notorios, como contracciones musculares o dificultad para soltar un conductor, aparecen cuando las corrientes alcanzan valores mayores en el rango de miliamperios.

En el sistema implementado para esta práctica, la corriente máxima que podría circular por el sujeto se encuentra aproximadamente entre 0.049 mA y 0.074 mA, dependiendo del voltaje de alimentación. Estos valores son considerablemente menores que los niveles asociados con efectos fisiológicos peligrosos.

Además, el circuito incorpora una resistencia limitadora en serie, lo cual es una práctica ampliamente utilizada en instrumentación biomédica para garantizar la seguridad del paciente y evitar que corrientes peligrosas puedan circular en caso de fallas en el sistema [13].

Otro aspecto importante es que el sistema funciona con bajo voltaje (3.3 V o 5 V), lo que reduce aún más el riesgo eléctrico.

Teniendo en cuenta lo anterior, se puede afirmar que el diseño del circuito cumple con los principios de seguridad descritos en la norma IEC 60479, ya que la corriente que puede circular a través del cuerpo humano se mantiene muy por debajo de los niveles que podrían representar algún riesgo para el usuario[14].

# PARTE A
## Revisión bibliográfica

La actividad electrodérmica es una de las respuestas fisiológicas más utilizadas para evaluar la activación del sistema nervioso autónomo [3][4]. La medición de la GSR permite identificar estados emocionales y de estrés mediante cambios en la conductancia de la piel [1][9].

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

· Transmisión de datos al computador por vía bluetooth

El sensor se ubica en los dedos índice y medio para maximizar la sensibilidad del sensor [3][5].

# PARTE B

Se construyó el dispositivo utilizando protoboard y microcontrolador.

El sistema permitió visualizar en MATLAB los cambios de conductancia de la piel en tiempo real.

Se realizaron pruebas con un sujeto en reposo y durante diferentes actividades:

· Respiración profunda

· Escritura

· Movimiento de la mano

Se observó que durante la respiración profunda se produce un aumento en la conductancia cutánea seguido de un retorno gradual al nivel basal [1][4].

Con base en los valores medidos se definieron tres niveles de estrés:
<p align="center">

| Nivel | Conductancia |
|:---:|:---:|
| Bajo | Nivel basal |
| Moderado | Incremento leve |
| Alto | Incremento significativo |

</p>

# PARTE C

Se implementó transmisión inalámbrica utilizando un microcontrolador ESP [1][4][9].

El sistema envía un mensaje indicando el nivel de estrés:

· Bajo

· Medio

· Alto

Durante la prueba, el sujeto respiró bruscamente mientras se registraba la señal GSR.

Se observó un aumento significativo en la conductancia durante los momentos de mayor concentración.
# ANALISIS DE RESULTADOS

Durante el desarrollo de la práctica se logró implementar un sistema de medición de la respuesta galvánica cutánea (GSR) utilizando un sensor de humedad del suelo YL-100, un microcontrolador ESP32 y una interfaz de visualización en MATLAB. El sistema permitió registrar variaciones en el voltaje del divisor resistivo asociado a cambios en la conductancia de la piel del sujeto.

En las primeras pruebas realizadas en condiciones de reposo se observó una señal relativamente estable, correspondiente al nivel basal de conductancia cutánea (Skin Conductance Level, SCL). Posteriormente, al realizar estímulos fisiológicos como respiración profunda, se registraron incrementos temporales en la señal, los cuales corresponden a respuestas fásicas de la conductancia cutánea (Skin Conductance Response, SCR). Este comportamiento es consistente con lo descrito en la literatura, donde la activación del sistema nervioso simpático produce un aumento en la actividad de las glándulas sudoríparas y, por lo tanto, un incremento en la conductancia de la piel [3][4].



https://github.com/user-attachments/assets/b86e63c6-e24e-4731-a15f-1e6b5f19fdb3
 <p align="center"> Fig. 6. Señal en tiempo real </p>



Al momento de la presentación final del laboratorio se presentó una limitación experimental importante, ya que el sensor utilizado sufrió un deterioro que provocó una alta sensibilidad al ruido eléctrico y a las variaciones de contacto con la piel. Como consecuencia, la señal registrada presentó fluctuaciones irregulares y picos abruptos que no correspondían a cambios fisiológicos reales del sujeto.

Este comportamiento fue causado por que el sensor tuvo un daño en sus pines de conexión, por ende, al ser al ultimo minuto toco improvisar y soldar con cable de protoboard, esto hizo que el sensor fuera mucho más sensible, por eso al momento de tomar la señal aparecian picos o saturaciones sin sentido.

A pesar de esta limitación, el sistema permitió evidenciar el principio fundamental de funcionamiento de la medición de GSR: los cambios en la actividad del sistema nervioso autónomo se reflejan en variaciones en la conductancia eléctrica de la piel. Además, se pudo observar que estímulos fisiológicos como la respiración profunda generan incrementos transitorios en la señal, seguidos por un retorno gradual al nivel basal, lo cual coincide con el comportamiento descrito en estudios sobre actividad electrodérmica [1][3].

Finalmente, el experimento permitió identificar aspectos importantes para el diseño de dispositivos biomédicos, como la necesidad de utilizar electrodos apropiados (por ejemplo Ag/AgCl), sistemas de filtrado adecuados y sensores diseñados específicamente para señales fisiológicas, con el fin de reducir el ruido y mejorar la calidad de la señal adquirida. Estas consideraciones son fundamentales para el desarrollo de sistemas vestibles confiables para la estimación del estrés mediante GSR.

# PREGUNTAS DE DISCUSIÓN 
### Pregunta 1: ¿A qué se debe que una inspiración profunda incremente la magnitud de la respuesta galvánica cutánea (GSR)?

Cuando una persona realiza una inspiración profunda se activa el sistema nervioso autónomo, especialmente la rama simpática. Esta activación genera cambios fisiológicos en el cuerpo, entre ellos un aumento en la actividad de las glándulas sudoríparas presentes en la piel.

La respuesta galvánica cutánea (GSR) mide precisamente los cambios en la conductancia eléctrica de la piel. Cuando las glándulas sudoríparas se activan, aumenta la cantidad de humedad en la superficie de la piel, lo que disminuye su resistencia eléctrica y, en consecuencia, aumenta su conductancia. Por esta razón, durante una inspiración profunda suele observarse un aumento en la señal de GSR [3].

Además, la respiración profunda puede producir una breve activación fisiológica relacionada con la regulación cardiovascular y la respuesta autonómica del organismo, lo que también contribuye a que la señal de conductancia cutánea presente un incremento temporal [1].

En resumen, el aumento de la GSR durante una inspiración profunda se debe principalmente a la activación del sistema nervioso simpático y al incremento de la actividad de las glándulas sudoríparas, lo que modifica la conductividad eléctrica de la piel [3].


### Pregunta 2: ¿Cuáles serían las ventajas y desventajas de utilizar la GSR como indicador de estrés?

El uso de la respuesta galvánica cutánea (GSR) como indicador de estrés tiene varias ventajas. En primer lugar, es una técnica **no invasiva**, ya que solo requiere colocar electrodos sobre la piel para medir cambios en la conductancia cutánea. Además, es relativamente fácil de implementar con circuitos simples y sensores de bajo costo, lo que permite su uso en dispositivos portátiles o vestibles. Otra ventaja importante es que la GSR responde rápidamente a cambios en el sistema nervioso autónomo, por lo que puede reflejar variaciones en el nivel de activación fisiológica casi en tiempo real [3].

Sin embargo, también presenta algunas limitaciones. Una de las principales es que la GSR **no es un indicador exclusivo del estrés**, ya que la conductancia de la piel también puede cambiar por otros factores como la temperatura, el movimiento, la humedad de la piel o incluso estímulos emocionales distintos al estrés. Esto puede generar interferencias o interpretaciones erróneas si no se analizan los datos junto con otras señales fisiológicas.

Otra desventaja es que la señal puede variar considerablemente entre personas, debido a diferencias fisiológicas individuales en la actividad de las glándulas sudoríparas o en la conductividad de la piel. Por esta razón, en aplicaciones más avanzadas suele combinarse la GSR con otras mediciones fisiológicas como frecuencia cardíaca o variabilidad de la frecuencia cardíaca para obtener estimaciones más confiables del estado de estrés [12].

En general, la GSR es una herramienta útil para evaluar cambios en la activación fisiológica del organismo, pero debe interpretarse con cuidado y preferiblemente en conjunto con otras variables fisiológicas.


# REFERENCIAS 

[1] Loggia, M. L., Juneau, M., & Bushnell, C. M. (2011). Autonomic responses to heat pain: Heart rate, skin conductance, and their relation to verbal ratings and stimulus intensity. *Pain*, 152(3), 592–598. https://doi.org/10.1016/j.pain.2010.11.032

[2] Breimhorst, M., Sandrock, S., Fechir, M., Hausenblas, N., Geber, C., & Birklein, F. (2010). Do intensity ratings and skin conductance responses reliably discriminate between different stimulus intensities in experimentally induced pain? *Journal of Pain*, 12(1), 61–70. https://doi.org/10.1016/j.jpain.2010.04.012

[3] Boucsein, W. (2013). *Electrodermal activity* (2nd ed.). Springer. https://doi.org/10.1007/978-1-4614-1126-0

[4]Dascălu, L. C., Babiș, C., Chivu, O., Iacobescu, G., Alecusan, A. M., & Semenescu, A. (2019). Measurements of galvanic skin response on subjects affected by stress. *Acta Universitatis Cibiniensis Technical Series*, 71(1), 25–29. https://doi.org/10.2478/aucts-2019-0006

[5] Phadke, A. N., Harasheh, K., & Gill, S. (2025). Wearable IoT-Enabled Galvanic Skin Response Device for objective pain and stress monitoring: hardware design and prototype development. *Sensors*, 26(1), 116. https://doi.org/10.3390/s26010116

[6] Swetha, K., & Kiran, K. V. D. (2025). Kalman‐Normalized GSR Analysis for Real‐Time Stress Quantification in wearable systems. *International Journal of Telemedicine and Applications*, 2025(1), 8828363. https://doi.org/10.1155/ijta/8828363

[7] De Luca, P. A., Sánchez, A. M. E., Pérez Olan, G., & Leija Salas, L. (2004). Medición integral del estrés crónico. *Revista Mexicana de Ingeniería Biomédica*, 25(1), 60–66.

[8] Cruz, J. R. J., & Rivera, M. A. G. (2019). Estimación del estrés por medio de la entropía de la variabilidad de la frecuencia cardíaca y la respuesta galvánica de la piel. *Pistas Educativas*. https://pistaseducativas.celaya.tecnm.mx/index.php/pistas/article/view/2093

[9] Sergio, A. R. (2016). Clasificación de niveles de estrés utilizando señales fisiológicas. https://e-archivo.uc3m.es/entities/publication/bf295ba9-911b-4bab-8632-cce450c21820

[10] Varón, D. J., García, I. B., & Gupta, B. B. (2023). Análisis del estrés, atención, interés y conexión emocional en la enseñanza superior presencial y online: un estudio neurotecnológico. *Dialnet*. https://dialnet.unirioja.es/servlet/articulo?codigo=8947684

[11] Vega, A., Bilbao, M., & Falappa, M. A. (2025). Workplace stress assessment using emotional recognition and heart rate techniques. https://sedici.unlp.edu.ar/handle/10915/178019

[12] Figner, B., & Murphy, R. O. (2011). Using skin conductance in judgment and decision making research. In *A Handbook of Process Tracing Methods for Decision Research* (pp. 163–184). Psychology Press.

[13] Webster, J. G. (2010). *Medical Instrumentation: Application and Design* (4th ed.). Wiley.

[14] International Electrotechnical Commission. (2018). *IEC 60479-1: Effects of current on human beings and livestock – Part 1: General aspects*.

[15] Farnsworth, B. (2025, August 29). Skin Conductance Response - GSR/EDA - How to measure it. iMotions. https://imotions.com/blog/learning/best-practice/skin-conductance-response/



INTEGRANTES: Shesly Colorado - Santiago Mora  - Daniel Herrera



