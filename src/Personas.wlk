import Marcas.*
import Carpas.*
/*prueba*/
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
	
	method alcoholIngerido(){
		return jarrasCompradas.sum({j => j.alcoholTotal()})
	}
	
	method estaEbrio(){
		return self.alcoholIngerido() * peso > aguante
	}
	
	method gustoEnCervezas(marca){
		var leGusta = false
		if (nacionalidad == "belga"){
			leGusta = marca.lupulo() > 4
		} 
		else if (nacionalidad == "checo"){
			leGusta = marca.graduacion() > 8
		}
		else if (nacionalidad == "aleman"){
			leGusta = true
		}
		return leGusta
	}

	method quiereEntrar(carpa){
		return (self.gustoEnCervezas(carpa.marca())) and (self.musicaTradicional() == carpa.musicaTradicional()) 
	}
	
	method puedeEntrar(carpa){
		return self.quiereEntrar(carpa)and carpa.dejaIngresar()
	}
	
	method entrarALaCarpa(carpa){
   	if (self.puedeEntrar(carpa)){carpa.agregarGente()}
   }
}

class PersonaAlemana inherits Persona{
	override method quiereEntrar(carpa){
		return super(carpa) and carpa.cantidadGente().even()
	}
}
