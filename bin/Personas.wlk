import Marcas.*

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
}