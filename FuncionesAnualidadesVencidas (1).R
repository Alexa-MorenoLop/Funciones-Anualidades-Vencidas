
#Calculo del Valor Final (VF)
 ##Conociendo A,r,T

#Se crea una función VF basada en la fórmula general de Valor Futuro

VF=function(A,r,t){
  
  VFsalida= A*((((1+r)^t)-1)/r)
  
  return(VFsalida)
}

#Calculo de Anualidad (A)
 ##Conociendo VF,r,T

#Se crea una función Anualidad basada en un despeje de A en la fórmula gral. de VF

Anualidad=function(VF,r,t){
  A= (VF/((((1+r)^t)-1)/r))
  return(A)
}

#Calculo de Número de Plazos (T)
##Conociendo VF,r,A

#Se crea una función Tplazos basada en un despeje de T en la fórmula gral. de VF

Tplazos=function(VF,r,A){
  Tp= ((log(((VF*r)/A)+1))/log(1+r))
  return(Tp)
}

#Calculo de la Tasa del Periodo(r)
##Conociendo VF,T,A

TasaPeriodo=function(VF,A,t,paro=10*(10^-18)){
  
  r=0.01
  iteraciones=0
  
  izquierda=VF/A
  derecha=(((1+r)^t)-1)/r
  diferencia=izquierda-derecha
  
  if (diferencia>0){
    # Cuando la r inicial es menor a lo deseado:  
    # Algoritmo de alza de tasa:
    
    iteraciones=0
    r0=r
    while (diferencia>0){
      r1=r  
      iteraciones=iteraciones+1  
      r=r*1.01
      
      izquierda=VF/A
      derecha=(((1+r)^t)-1)/r
      diferencia=izquierda-derecha
      cat("\f")
      print(paste0("Iteración de alza tasa:",iteraciones))
      
      r2=r
      
    }  
    
    
    
    #diferencia1=diferencia
    diferenciaTasa=r-r0
    diferencia=paro
    # algoritmo de la bisección:    
    while (abs(diferenciaTasa)>paro){
      
      iteraciones=iteraciones+1
      r=(r1+r2)/2    
      
      izquierda=VF/A
      derecha=(((1+r)^t)-1)/r
      diferencia=izquierda-derecha
      
      if (diferencia>0){
        r1=r1
        r2=r
        
      } else {
        r2=r2  
        r1=r
        
      }
      diferenciaTasa=r-r0
      r0=r
      cat("\f")
      print(paste0("Iteración de bisección: ",iteraciones))
    }
    
  } else {
    # Cuando la r inicial es mayor a lo deseado:  
    # Algoritmo de bajada de tasa:
    iteraciones=0
    r0=r
    while (diferencia<0){
      r2=r 
      iteraciones=iteraciones+1  
      r=r/1.01
      
      izquierda=VF/A
      derecha=(((1+r)^t)-1)/r
      diferencia=izquierda-derecha
      
      cat("\f")
      print(paste0("Iteración de baja de tasa:",iteraciones))
      
      r1=r
      
    }  
    
    
    #diferencia1=diferencia
    diferenciaTasa=r-r0
    r0=r
    
    diferencia=paro  
    # algoritmo de la bisección:      
    while (abs(diferenciaTasa)>paro){
      iteraciones=iteraciones+1
      r=(r1+r2)/2    
      
      izquierda=VF/A
      derecha=(((1+r)^t)-1)/r
      diferencia=izquierda-derecha
      
      if (diferencia>0){
        r1=r
        r2=r2
        
      } else {
        r2=r  
        r1=r1
        
      }
      
      diferenciaTasa=r-r0
      r0=r
      
      cat("\f")
      print(paste0("Iteración de biseccción:",iteraciones))
    }
    
    
    
  }
  return(r)
}


#Calculo del Valor Actual (VA)
##Conociendo A,r,T

#Se crea una función VA basada en la fórmula general de anualidades conociendo VA

VA=function(A,r,t){
  VAsalida=A*((1-((1+r)^-t))/r)
  return(VAsalida)
}

#Calculo de Anualidad(A) conociendo VA
##Conociendo VA,r,T

#Se crea una función AnualidadVA basada en un despeje de A en la fórmula gral. conociendo VA

AnualidadVA=function(VA,r,t){
  AVA= (VA/(1-((1+r)^-t)/r))
  return(AVA)
}

#Calculo de Número de Plazos (T) conociendo VA
##Conociendo VA,r,A

#Se crea una función TplazosVA basada en un despeje de T en la fórmula gral. de anualidades conociendo VA

TplazosVA=function(VF,r,A){
  TpVA= (-log(1-(VA*(r)/A))/log(1+r))
  return(TpVA)
}

#Calculo de la Tasa del Periodo(r) conociendo VA
##Conociendo VA,T,A

TasaPeriodoVA=function(VA,A,t,paro=10*(10^-18)){
  
  r=0.001
  iteraciones=0
  
  izquierda=VA/A
  derecha=(1-((1+r)^-t))/r
  diferencia=izquierda-derecha
  
  if (diferencia<0){
    # Cuando la r inicial es menor a lo deseado:  
    # Algoritmo de alza de tasa:
    
    iteraciones=0
    r0=r
    while (diferencia<0){
      r1=r  
      iteraciones=iteraciones+1  
      r=r*1.01
      
      izquierda=VA/A
      derecha=(1-((1+r)^-t))/r
      diferencia=izquierda-derecha
      cat("\f")
      print(paste0("Iteración de alza tasa:",iteraciones))
      
      r2=r
      
    }  
    

    #diferencia1=diferencia
    diferenciaTasa=r-r0
    diferencia=paro
    # algoritmo de la bisección:    
    while (abs(diferenciaTasa)>paro){
      
      iteraciones=iteraciones+1
      r=(r1+r2)/2    
      
      izquierda=VA/A
      derecha=derecha=(1-((1+r)^-t))/r
      diferencia=izquierda-derecha
      
      if (diferencia>0){
        r1=r1
        r2=r
        
      } else {
        r2=r2  
        r1=r
        
      }
      diferenciaTasa=r-r0
      r0=r
      cat("\f")
      print(paste0("Iteración de bisección: ",iteraciones))
    }
    
  } else {
    # Cuando la r inicial es mayor a lo deseado:  
    # Algoritmo de bajada de tasa:
    iteraciones=0
    r0=r
    while (diferencia>0){
      r2=r 
      iteraciones=iteraciones+1  
      r=r/1.01
      
      izquierda=VA/A
      derecha=(1-((1+r)^-t))/r
      diferencia=izquierda-derecha
      cat("\f")
      print(paste0("Iteración de baja de tasa:",iteraciones))
      
      r1=r
      
    }  
    
    
    #diferencia1=diferencia
    diferenciaTasa=r-r0
    r0=r
    
    diferencia=paro  
    # algoritmo de la bisección:      
    while (abs(diferenciaTasa)>paro){
      iteraciones=iteraciones+1
      r=(r1+r2)/2    
      
      izquierda=VA/A
      derecha=(1-((1+r)^-t))/r
      diferencia=izquierda-derecha
      
      if (diferencia>0){
        r1=r
        r2=r2
        
      } else {
        r2=r  
        r1=r1
        
      }
      
      diferenciaTasa=r-r0
      r0=r
      
      cat("\f")
      print(paste0("Iteración de biseccción:",iteraciones))
    }
    
  }
  
  return(r)
}
