import Marcas.*
import Carpas.*

class MyException inherits wollok.lang.Exception {}

class Persona{
	var property peso = 0
	const jarrasCompradas = []
	var property musicaTradicional = false
	var property aguante = 0
	
	method comprarJarra(jarra){
		jarrasCompradas.add(jarra)	
	}
	
	method jarrasCompradas(){
		return jarrasCompradas
	}
	
	method alcoholIngerido(){
		return jarrasCompradas.sum({j => j.alcoholTotal()})
	}
	
	method estaEbrio(){
		return self.alcoholIngerido() * peso > aguante
	}
	
	method leGustaMarca(marca){return true}
	
	mmethod entrarALaCarpa(carpa){// Requerimientos - segunda parte : item 5
   	if (self.puedeEntrar(carpa)){carpa.agregarGente()}else {self.error("Error")}
   }
	}
	
	method puedeEntrar(carpa){ // Requerimientos - segunda parte : item 7
		return self.quiereEntrar(carpa) and carpa.dejaIngresar()
	}
	
	method entrarACarpa(carpa){ // Requerimientos - segunda parte : item 8
		if (self.puedeEntrar(carpa)){carpa.agregarGente(self)}
		else{throw new MyException()}
	}
	
	 method estaEnLaCarpa(carpa){
   	return self.puedeEntrar(carpa)
   }
}

class Belga inherits Persona{
	override method leGustaMarca(marca){
		return marca.lupulo() > 4
	}
}

class Checo inherits Persona{
	override method leGustaMarca(marca){
		return marca.graduacion() > 4
	}
}

class Aleman inherits Persona{
	override method leGustaMarca(marca){
		return true
	}
	override method quiereEntrar(carpa){  // Requerimientos - segunda parte : item 5
		return super(carpa) and carpa.cantidadGente().even()
	}
}
