# Funciones-Anualidades-Vencidas
El siguiente trabajo contiene las funciones programadas en R utilizadas en el tema Anualidades Vencidas de Matemáticas Financieras para la licenciatura en Actuaria y Ciencia de Datos. 

*Alexa Moreno López*

*Licenciatura en Actuaría y Ciencia de Datos*

Es posible cargar las funciones realizadas por medio del siguiente comando pegandolo en la consola de su workspace. 
```{r}
source("https://raw.githubusercontent.com/Alexa-MorenoLop/Funciones-Anualidades-Vencidas/refs/heads/main/FuncionesAnualidadesVencidas.R")
```

# Anualidades Vencidas

Las anualidades son una serie de pagos periodicos realizados a lo largo de una operación financiera, generalmente en intervalos iguales de tiempo. 

Estos pagos son de gran utilidad en operaciones economicas financieras, ya que tienen la finalidad para solvertar un saldo acumulado o mejor conocido como Valor Futuro (VF) en partes o periodos en vez de realizar un único pago al final del plazo.

En especifico para este tema una *Anualidad Vencida* es aquella cuyo pago del Valor acumulado se realizan al final de cada periodo de pago.

Para esto, podemos reconocer de gran utilidad una ecuación derivada de una serie de calculos:

**Fórmula de Valor Futuro (VF) de una anualidad vencida** 

*Dada la Anualidad (A), Tasa de interés del periodo (r) y el número de de anulidades (T)*

$$VF=A\frac{(1+r)^T-1}{r}$$

De esta fórmula general se derivan despejes para obtener algún valor desconocido según aquellos datos con los que contamos, tales son los siguientes casos:

**Fórmula para encontrar el valor de Anualidad (A) en una anualidad vencida**

*Conociendo Valor Futuro (VF), tasa de interés del periodo (r) y el número de pagos o anualidades (T)*

$$Anualidad=\frac{VF}{\frac{(1+r)^T-1}{r}}$$

**Fórmula para identificar el número de pagos o plazo (T) en una anualidad vencida**

*Conociendo el Valor Futuro (VF), tasa de interés del periodo (r) y el monto de Anualidad (A)*

$$PlazosT= \frac{log(\frac{VF*r}{A}+1)}{log(1+r)}$$

**Forma en la que se obtiene el valor de interes del periodo (r)**

*Conociendo Valor Futuro (VF), número de Plazos (T) y el monto de Anualidad (A)*

Para este caso en especifico se es necesario realizar el cálculo al despejar los Intereses del Periodo (r), sin embargo, no es posible hacerlo de forma directa con la fórmula de VF de Anualidades Vencidas, ya que al intentarlo, lo máximo a l que llegariamos sería un despeje donde r se encontraria a ambos lados de la igualdad.

$$\frac{VF}{A}*r=[((1+r)^T)-1]$$

Por lo que, para llevar a cabo este cálculo se vió necesario el uso de un algoritmo programado en R, el cual esta basado en el método de bisección, esto lo podemos explicar como la búsqueda de un valor (en nuestro caso r) entre un valor máximo y un valor mínimo.La actividad del programa que realiza podría explicarse como "partir a la mitad" el área entre estos dos valores y tomar el lado de esta división que se acerque al valor buscado, esto se repetirá de forma iterativa, es decir, se dividirá nuevamente, hasta encontrar el valor requerido, o bien, se llegue a un limite de decimales establecido.

**Ejemplo con un problema**

Para una mayor representación y entendimiento de estas funciones y su utilidad se tomará un ejemplo en el cual se despejará cada uno de los valores.

Se nos proporciona el siguiente problema a resolver:

*"Un inversionista realiza un pago mensual de $1,200.00 al final de cada mes durante 5 años en los cuales paga una tasa de interés del 6% anual compuesto mensualmente.*

*¿Cuál es el valor futuro de esta inversión?"*

Comencemos utilizando la Fórmula general para obtener el monto futuro, es decir, buscamos VF.

Para esto, antes debemos identificar los datos de nuestro problema para facilitar la computación al momento de llevarla a cabo.

$Anualidad(A)$= $1,200.00

$Número de pagos(T)$= $12 meses * 5 años = 60$ 

$InteresesAnualizados(i)$= $6% = 0.06$

$InteresesPeriodo(r)$= $6%/12 = 0.5% = 0.005$

**Cálculo del Valor Futuro (VF)**

*Conociendo la Anualidad (A), tasa de interés del periodo (r) y el número (plazo) de anualidades (T).*

```{r}

source("https://raw.githubusercontent.com/Alexa-MorenoLop/Funciones-Anualidades-Vencidas/refs/heads/main/FuncionesAnualidadesVencidas.R")

resultadoVF=VF(A=1200,r=0.005,t=60)

resultadoVF

```

Una vez que hemos encontrado el Valor Futuro podemos utilizarlo para buscar otros valores que, si bien ya conocemos debido a que se nos proporcionaron en el desarrollo del problema, lo calcularemos basandonos en el mismo ejercicio, ya que buscamos comprobar el funcionamiento y eficacia de las fórmulas de Anualidades Vencidas programadas en R.

Ahora encontremos el valor de la Anualidad, el cual sabemos que es $1,200.00.

**Cálculo del Valor de la Anualidad (A)**

*Conociendo Valor Futuro (VF), tasa del periodo (r) y número de pagos (T).*

```{r}

source("https://raw.githubusercontent.com/Alexa-MorenoLop/Funciones-Anualidades-Vencidas/refs/heads/main/FuncionesAnualidadesVencidas.R")

resultadoA=Anualidad(VF=83724.04,r=0.005,t=60)

resultadoA

```

**Cálculo del Valor de Número de pagos o plazo (T)**

*Conociendo Valor Futuro (VF), monto de Anualidad (A) y Tasa del periodo (r).*

```{r}

source("https://raw.githubusercontent.com/Alexa-MorenoLop/Funciones-Anualidades-Vencidas/refs/heads/main/FuncionesAnualidadesVencidas.R")

resultadoPlazos=Tplazos(VF=83724.04,r=0.005,A=1200)

resultadoPlazos

```

**Cálculo de la Tasa del periodo (r)**

*Conociendo Valor Futuro (VF), número de pagos (T) y monto de la Anualidad (A).*

Para finalizar con este ejemplo, a continuación es necesario realizar el cálculo de los Intereses del Periodo (r) con el algoritmo programado.

```{r}
source("https://raw.githubusercontent.com/Alexa-MorenoLop/Funciones-Anualidades-Vencidas/refs/heads/main/FuncionesAnualidadesVencidas.R")

resultadoTasaPeriodo=TasaPeriodo(VF=83724.04,A=1200,t=60,paro=10*(10^-18))

resultadoTasaPeriodo

```

# Anualidades Vencidas con Valor Actual

Ahora bien, también se nos pueden presentar problemas donde ahora el *Valor Actual* (VA) este presente, es decir, el valor al comienzo del plazo.

El Valor Actual es la suma de valores presentes de todos los pagos. VA corresponde al Valor Futuro (VF) de la operación sumando los intereres recompuestos (I) de la operación.

Partiendo de esta lógica, y después de una serie da cálculos, se llega a la ecuación:

**Fórmula General de Anualidades vencidas conciendo el Valor Actual (VA)** 

$$VA=A\frac{1-(1+r)^{-T}}{r}$$

De esta fórmula general se derivan despejes para obtener valores desconocidos según aquellos datos con los que contamos, tales son los siguientes casos:

**Fórmula para encontrar el Valor Actual (VA) en una anualidad vencida.**

*Conociendo la Anualidad (A), tasa de interés del periodo (r) y el número de pagos o anualidades (T).*

En este caso se trata directamente de la fórmula general.

$$VA=A\frac{1-(1+r)^{-T}}{r}$$


**Fórmula para encontrar el valor de Anualidad (A) en una anualidad vencida conociendo el Valor Actual.**

*Conociendo Valor Actual (VA), tasa de interés del periodo (r) y el número de pagos o anualidades (T).*

$$AnualidadVA=\frac{VA}{\frac{1-(1+r)^{-T}}{r}}$$

**Fórmula para identificar el número de pagos (T) en una anualidad vencida conociendo el Valor Actual.**

*Conociendo el Valor Actual (VA), tasa de interés del periodo (r) y el monto de Anualidad (A).*

$$PlazosTVA=\frac{-log(1-\frac{VA*r}{A})}{log(1+r)}$$

**Forma en la que se obtiene el valor de interés del periodo (r) conociendo Valor Actual.**

*Conociendo Valor Actual (VA), número de Plazos (T) y el monto de Anualidad (A).*

Al igual que en el caso anterior donde se busca el valor del interés del periodo, al tratar de despejarlo directamente de la fórmula general se ve imposible, por lo que, bajo la misma lógica se implementa el algoritmo que nos aproximará al valor de r con cada iteración.

**Ejemplo con un problema**

Para una mayor representación y entendimiento de estas funciones y su utilidad se tomará un ejemplo en el cual se despejará cada uno de los valores.

Se nos proporciona el siguiente problema a resolver:

*"¿Cuál es el valor presente de $10 000 que se depositan en una cuenta al final de
cada trimestre durante 4 años si la tasa de interés es del 14% capitalizable en forma trimestral?*

Comencemos utilizando la Fórmula general para obtener el valor al comienzo del plazo, es decir, buscamos VA.

Para esto, antes debemos identificar los datos de nuestro problema para facilitar la computación al momento de llevarla a cabo.

$Anualidad(A)$= $10,000.00$

$Número de pagos(T)$= $4 trimestres * 4 años = 16$ 

$InteresesAnualizados(i)$= $14% = 0.14$

$InteresesPeriodo(r)$= $14%/12 = 3.5% = 0.035$

**Cálculo del Valor Actual (VA)**

*Conociendo la Anualidad (A), tasa de interés del periodo (r) y el número de pagos o anualidades (T).*

```{r}

source("https://raw.githubusercontent.com/Alexa-MorenoLop/Funciones-Anualidades-Vencidas/refs/heads/main/FuncionesAnualidadesVencidas.R")

resultadoVA=VA(A=10000,r=0.035,t=16)

resultadoVA

```

**Cálculo monto de Anualidad (A) conociendo el Valor Actual.**

*Conociendo Valor Actual (VA), tasa de interés del periodo (r) y el número de pagos o anualidades (T).*

Si bien conocemos el valor por la información dada en el problema, comprobaremos el funcionamiento de la función. Anualidad = $10,000.00$

```{r}

source("https://raw.githubusercontent.com/Alexa-MorenoLop/Funciones-Anualidades-Vencidas/refs/heads/main/FuncionesAnualidadesVencidas.R")

resultadoAnualidadVA=AnualidadVA(VA=120941.2,r=0.035,t=16)

resultadoAnualidadVA

```

**Cálculo del número de pagos (T) conociendo el Valor Actual.**

*Conociendo el Valor Actual (VA), tasa de interés del periodo (r) y el monto de Anualidad (A).*

```{r}

source("https://raw.githubusercontent.com/Alexa-MorenoLop/Funciones-Anualidades-Vencidas/refs/heads/main/FuncionesAnualidadesVencidas.R")

resultadoPlazoVA=TplazosVA(VA=120941.2,r=0.035,A=10000)

resultadoPlazoVA

```
**Cálculo de la Tasa del periodo (r) conociendo Valor Actual**

*Conociendo Valor Actual (VA), número de Plazos (T) y el monto de Anualidad (A).*

Para finalizar con este ejemplo, a continuación es necesario realizar el cálculo de los Intereses del Periodo (r) con el algoritmo programado.

```{r}
source("https://raw.githubusercontent.com/Alexa-MorenoLop/Funciones-Anualidades-Vencidas/refs/heads/main/FuncionesAnualidadesVencidas.R")

resultadoTasaPeriodoVA=TasaPeriodoVA(VA=120941.2,A=10000,t=16,paro=10*(10^-18))

resultadoTasaPeriodoVA

```

La información utilizada fue obtenida de las notas "Anualidades" realizadas por el Dr. Oscar V. De la Torre Torres
https://oscardelatorretorres.shinyapps.io/02matFin04Anualidades/#fig:figura42

Así como sacada del libro: 
Vidaurri Aguirre, H. (2017). Matemáticas Financieras (6.a ed.). Cinthia Chávez Ceballos. https://www.dropbox.com/scl/fi/8tvbn7asxqvlbfim1g5n1/libroMateFinancieras.pdf?rlkey=s1dwrr7fe03cswd6ccmndi3hk&e=12&st=bn50sqdl&dl=0


