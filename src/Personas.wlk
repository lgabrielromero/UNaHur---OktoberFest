import Marcas.*
import Carpas.*

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
	
	method quiereEntrar(carpa){
		return self.leGustaMarca(carpa.marca()) and (self.musicaTradicional() == carpa.musicaTradicional()) 
	}
	
	method puedeEntrar(carpa){
		return self.quiereEntrar(carpa) and carpa.dejaIngresar()
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
}