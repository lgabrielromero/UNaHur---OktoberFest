class Marca{
	var property tipo = ""
	var property lupulo = 0
	var property origen = ""
	var property graduacionReglamentaria = 0
	var graduacion = 0
	
	method graduacion(){
		return graduacion
	}
	
	method graduacion(cant){
		if(self.tipo() == "rubia"){
			graduacion = cant
		}
		else if(self.tipo() == "negra"){
			graduacion = graduacionReglamentaria.min(self.lupulo() * 2)
		}
		else if(self.tipo() == "roja"){
			graduacion = graduacionReglamentaria.min(self.lupulo() * 2)
			graduacion *= 1.25
		}
	}
}

class Jarra{
	var property capacidad
	var property marca
	
	method alcoholTotal(){
		return (marca.graduacion() * 0.01) * capacidad
	}
}