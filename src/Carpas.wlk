import Marcas.*

class Carpa{
    var property limite = 0
    var property musicaTradicional = false
    var property marca = null 
    var cantidadGente = 0
    
    method cantidadGente(){
    	return cantidadGente
    }
    
    method agregarGente(){
    	cantidadGente +=1
    }
    
    method dejaIngresar(){
    	return self.cantidadGente() <= self.limite()
    }

    method cantidadEbriosEmpedernidos(personas){
   return 	personas.jarrasCompradas().count({personas.jarrasCompradas().capacidad()>= 1})
   }
   

}


