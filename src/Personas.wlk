import Marcas.*
import Carpas.*

//PERSONAS

class MyException inherits wollok.lang.Exception {}

class Persona{
	var property peso = 0
	const jarrasCompradas = []
	var property musicaTradicional = false
	var property aguante = 0
	var property nacionalidad = ""
	
	method comprarJarra(jarra){
		jarrasCompradas.add(jarra)	
	}
	
	method jarrasCompradas(){
		return jarrasCompradas
	}

//PRIMERA PARTE - 2
	method alcoholIngerido(){
		return jarrasCompradas.sum({j => j.alcoholTotal()})
	}

//PRIMERA PARTE - 3
	method estaEbrio(){
		return self.alcoholIngerido() * peso > aguante
	}

	method leGustaMarca(marca){return true}

//SEGUNDA PARTE - 5	
	method quiereEntrar(carpa){
		return self.leGustaMarca(carpa.marca()) and (self.musicaTradicional() == carpa.musicaTradicional()) 
	}

//SEGUNDA PARTE - 7
	method puedeEntrar(carpa){
		return self.quiereEntrar(carpa) and carpa.dejaIngresar(self)
	}
//SEGUNDA PARTE - 8
	method entrarACarpa(carpa){
		if (self.puedeEntrar(carpa)){carpa.agregarGente(self)}
		else{throw new MyException()}
	}
	
	method esEbrioEmpedernido(){
		return self.jarrasCompradas().all({c => c.capacidad() > 1})
	}

//SEGUNDA PARTE - 11
	method esPatriota(){
		return jarrasCompradas.all({c => c.marca().origen() == self.nacionalidad() })
	}

}

//PRIMERA PARTE - 4

class Belga inherits Persona{
	override method nacionalidad() = "Belgica"
	override method leGustaMarca(marca){
		return marca.lupulo() > 4
	}
}

class Checo inherits Persona{
	override method nacionalidad() = "Checoslovaquia"
	override method leGustaMarca(marca){
		return marca.graduacion() > 4
	}
}

class Aleman inherits Persona{
	override method nacionalidad() = "Alemania"
	override method leGustaMarca(marca){
		return true
	}
	override method quiereEntrar(carpa){  // Requerimientos - segunda parte : item 5
		return super(carpa) and carpa.cantidadGente().even()
	}
}
