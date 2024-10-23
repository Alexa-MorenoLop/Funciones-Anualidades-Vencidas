# Funciones-Anualidades-Vencidas
El siguiente trabajo contiene las funciones programadas en R utilizadas en el tema Anualidades Vencidas de Matemáticas Financieras para la licenciatura en Actuaria y Ciencia de Datos. 

*Alexa Moreno López*

*Licenciatura en Actuaría y Ciencia de Datos*

Es posible cargar las funciones realizadas por medio del siguiente comando pegandolo en la consola de su workspace. 
```{r}
source("https://raw.githubusercontent.com/Alexa-MorenoLop/Funciones-Anualidades-Vencidas/refs/heads/main/FuncionesAnualidadesVencidas.R")
```
##Anualidades Vencidas

Las anualidades son una serie de pagos periodicos realizados a lo largo de una operación financiera, estos pagos son de utilidad para solvertar un saldo acumulado o mejor conocido co,o Valor Futuro (VF).
Para esto, podemos reconocer de gran utilidad una ecuación derivada de una serie de calculos:

*Fórmula de Valor Futuro (VF) dada una suma de T anualidades, una tasa de interés del periodo r*

$$VF=A*[((1+r)^T-1)/r]$$

De esta fórmula general se derivan despejes para obtener algún valor desconocido según aquellos datos con los que contamos, tales son los siguientes casos:

*Fórmula para encontrar el valor de Anualidad (A) conociendo Valor Futuro (VF), tasa de interés del periodo (r) y el número de pagos o anualidades (T)*

$$Anualidad=(VF/((((1+r)^t)-1)/r))$$







