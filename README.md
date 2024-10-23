# Funciones-Anualidades-Vencidas
El siguiente trabajo contiene las funciones programadas en R utilizadas en el tema Anualidades Vencidas de Matemáticas Financieras para la licenciatura en Actuaria y Ciencia de Datos. 

*Alexa Moreno López*

*Licenciatura en Actuaría y Ciencia de Datos*

Es posible cargar las funciones realizadas por medio del siguiente comando pegandolo en la consola de su workspace. 
```{r}
source("https://raw.githubusercontent.com/Alexa-MorenoLop/Funciones-Anualidades-Vencidas/refs/heads/main/FuncionesAnualidadesVencidas.R")
```

**Anualidades Vencidas**

Las anualidades son una serie de pagos periodicos realizados a lo largo de una operación financiera, estos pagos son de utilidad para solvertar un saldo acumulado o mejor conocido co,o Valor Futuro (VF).
Para esto, podemos reconocer de gran utilidad una ecuación derivada de una serie de calculos:

*Fórmula de Valor Futuro (VF) dada una suma de T anualidades, una tasa de interés del periodo r*

1. $$VF=A*[(1+r)^T-1/r]$$

De esta fórmula general se derivan despejes para obtener algún valor desconocido según aquellos datos con los que contamos, tales son los siguientes casos:

*Fórmula para encontrar el valor de Anualidad (A) conociendo Valor Futuro (VF), tasa de interés del periodo (r) y el número de pagos o anualidades (T)*

2. $$Anualidad=(VF/(1+r)^T-1)/r)$$

*Fórmula para identificar el número de plazos (T) al conocer  el Valor Futuro (VF), tasa de interés del periodo (r) y el monto de Anualidad (A)*

3. $$PlazosT= log((VF*r)/A+1)/log(1+r)$$

*Forma en la que se obtiene el valor de interes del periodo (r), conociendo Valor Futuro (VF), número de plazos (T) y el monto de Anualidad (A)*






Para una mayor representación y entendimiento de estas funciones y su utilidad se tomará un ejemplo en el cual se despejará cada uno de los valores.

Se nos proporciona el siguiente problema a resolver:

*"Un inversionista realiza un pago mensual de $1,200.00 al final de cada mes durante 5 años en los cuales paga una tasa de interés del 6% anual compuesto mensualmente.
¿Cuál es el valor futuro de esta inversión?"*

Comencemos utilizando la Fórmula con el caso 1, es decir, buscamos VF.

Para esto, antes debemos identificar los datos de nuestro problema para facilitar la computación al momento de llevarla a cabo.

$Anualidad(A)$= $1,200.00

$Número de pagos (T)$= 12 meses * 5 años = 60 

$InteresesAnualizados(i)$= 6% = 0.06

$InteresesPeriodo(r)$= 6%/12 = 0.5% = 0.005

**Cálculo del Valor Futuro (VF)**
```{r}
source("https://raw.githubusercontent.com/Alexa-MorenoLop/Funciones-Anualidades-Vencidas/refs/heads/main/FuncionesAnualidadesVencidas.R")


resultadoVF=VF(A=12000,r=0.005,t=60)

resultadoVF

```



