import Marcas.*
import Personas.*

class Carpa{
    var property limite = 0
    var property musicaTradicional = false
    var property marca = null
    var property cantidadGente = 0
    var property personasDentro = []
    
    method cantidadGente(){
    	return cantidadGente
    }
    
    method agregarGente(persona){
    	cantidadGente +=1
    	personasDentro.add(persona)
    }
//SEGUNDA PARTE - 6
    method dejaIngresar(persona){
    	return self.cantidadGente() < self.limite() and not persona.estaEbrio()
    }
    
//SEGUNDA PARTE - 10
    method cantidadEbriosEmpedernidos(){
    	return personasDentro.count({c => c.esEbrioEmpedernido()})
    }

//SEGUNDA PARTE - 9
    method servirJarra(persona, capacidad){
    	if(self.personasDentro().any(persona)){
    		const jarraVendida = new Jarra()
    		jarraVendida.capacidad(capacidad)
    		jarraVendida.marca(self.marca())
    		persona.comprarJarra(jarraVendida)
    	}
    	else{throw new MyException()}
    }
}
