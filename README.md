# Funciones-Anualidades-Vencidas
El siguiente trabajo contiene las funciones programadas en R utilizadas en el tema Anualidades Vencidas de Matemáticas Financieras para la licenciatura en Actuaria y Ciencia de Datos. 

*Alexa Moreno López*

*Licenciatura en Actuaría y Ciencia de Datos*

Es posible cargar las funciones realizadas por medio del siguiente comando pegandolo en la consola de su workspace. 
```{r}
source("https://raw.githubusercontent.com/Alexa-MorenoLop/Funciones-Anualidades-Vencidas/refs/heads/main/FuncionesAnualidadesVencidas%20(1).R")
```

**Anualidades Vencidas**

Las anualidades son una serie de pagos periodicos realizados a lo largo de una operación financiera, estos pagos son de utilidad para solvertar un saldo acumulado o mejor conocido co,o Valor Futuro (VF).
Para esto, podemos reconocer de gran utilidad una ecuación derivada de una serie de calculos:

*Fórmula de Valor Futuro (VF) dada una suma de T anualidades, una tasa de interés del periodo r*

$$1. VF=A*[(1+r)^T-1/r]$$

De esta fórmula general se derivan despejes para obtener algún valor desconocido según aquellos datos con los que contamos, tales son los siguientes casos:

*Fórmula para encontrar el valor de Anualidad (A) conociendo Valor Futuro (VF), tasa de interés del periodo (r) y el número de pagos o anualidades (T)*

$$2. Anualidad=(VF/(1+r)^T-1)/r)$$

*Fórmula para identificar el número de plazos (T) al conocer  el Valor Futuro (VF), tasa de interés del periodo (r) y el monto de Anualidad (A)*

$$3. PlazosT= log((VF*r)/A+1)/log(1+r)$$

*Forma en la que se obtiene el valor de interes del periodo (r), conociendo Valor Futuro (VF), número de plazos (T) y el monto de Anualidad (A)*

Para este caso en especifico se es necesario realizar el cálculo al despejar los Intereses del Periodo (r), sin embargo, no es posible hacerlo de forma directa con la fórmula de VF de Anualidades Vencidas, ya que al intentarlo, lo máximo a l que llegariamos sería un despeje donde r se encontraria a ambos lados de la igualdad.


Por lo que, parallevar a cabo este cálculo se vió necesario el uso de un algoritmo programado en R, el cual esta basado en el método de bisección, esto lo podemos explicar como la búsqueda de un valor (en nuestro caso r) entre un valor máximo y un valor mínimo, lo que realiza el programa será "partir a la mitad" el área entre estos dos valores y tomar el lado de esta división que se acerque al valor buscado, esto se repetirá de forma iterativa, es decir, se dividirá nuevamente, hasta encontrar el valor requerido, o bien, se llegue a un limite de decimales.


Para una mayor representación y entendimiento de estas funciones y su utilidad se tomará un ejemplo en el cual se despejará cada uno de los valores.

Se nos proporciona el siguiente problema a resolver:


*"Un inversionista realiza un pago mensual de $1,200.00 al final de cada mes durante 5 años en los cuales paga una tasa de interés del 6% anual compuesto mensualmente.*

*¿Cuál es el valor futuro de esta inversión?"*

Comencemos utilizando la Fórmula con el caso 1, es decir, buscamos VF.

Para esto, antes debemos identificar los datos de nuestro problema para facilitar la computación al momento de llevarla a cabo.

$Anualidad(A)$= $1,200.00

$Número de pagos (T)$= 12 meses * 5 años = 60 

$InteresesAnualizados(i)$= 6% = 0.06

$InteresesPeriodo(r)$= 6%/12 = 0.5% = 0.005

**Cálculo del Valor Futuro (VF)**
*Conociendo la anualidad, tasa de interés del periodo y el número (plazo) de anualidades.*

```{r}
source("https://raw.githubusercontent.com/Alexa-MorenoLop/Funciones-Anualidades-Vencidas/refs/heads/main/FuncionesAnualidadesVencidas%20(1).R")

resultadoVF=VF(A=1200,r=0.005,t=60)

resultadoVF

```
Una vez que hemos encontrado el Valor Futuro podemos utilizarlo para buscar otros valores, que si bien ya conocemos debido a que se nos proporcionaron en el desarrollo del problema, utilizaremos el mismo ejercicio para calcularlos ya que buscamos comprobar el funcionamiento y eficacia de las fórmulas programadas en R.

Ahora encontremos el valor de la Anualidad, el cual sabemos que es $1,200.00.

**Cálculo del Valor de la Anualidad (A)**
*Conociendo valor futuro, tasa del periodo y número de pagos.*

```{r}

source("https://raw.githubusercontent.com/Alexa-MorenoLop/Funciones-Anualidades-Vencidas/refs/heads/main/FuncionesAnualidadesVencidas%20(1).R")

resultadoA=Anualidad(VF=83724.4,r=0.005,t=60)

resultadoA

```

**Cálculo del Valor de Número de pagos o plazo (T)**
*Conociendo Valor Futuro, Anualidad y Tasa del periodo.*

De igual manera para identificar el valor de T como el número de pagos, conociendo Valor Futuro, Anualidad e Intereses del periodo.

```{r}
source("https://raw.githubusercontent.com/Alexa-MorenoLop/Funciones-Anualidades-Vencidas/refs/heads/main/FuncionesAnualidadesVencidas%20(1).R")

resultadoPlazos=Tplazos(VF=83724.4,r=0.005,A=1200)

resultadoPlazos

```

**Cálculo de la Tasa del periodo (r)**
*Conociendo valor futuro, número de pagos y monto de la anualidad.*

Para finalizar con este ejemplo, a continuación es necesario realizar el cálculo de los Intereses del Periodo (r) con el algoritmo programado.

```{r}
source("https://raw.githubusercontent.com/Alexa-MorenoLop/Funciones-Anualidades-Vencidas/refs/heads/main/FuncionesAnualidadesVencidas%20(1).R")

resultadoTasaPeriodo=TasaPeriodo(VF=83724.4,A=1200,t=60,paro=10*(10^-18))

resultadoTasaPeriodo

```








