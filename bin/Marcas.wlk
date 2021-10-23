
class Marca{
	var property lupulo = 0
	var property origen = ""
}



class MarcaCervezaRubia inherits Marca{
	var property graduacion = 0
}



class MarcaCervezaNegra inherits Marca{
	var porcentajeGraduacionReglamentaria = 0
	
	method graduacion(){
		return porcentajeGraduacionReglamentaria.min(lupulo * 2)
	}
	
	method actualizarGraduacionReglamentaria(porcentaje){
		porcentajeGraduacionReglamentaria = porcentaje
	}
}



class MarcaCervezaRoja inherits MarcaCervezaNegra{
	override method graduacion(){
		return super() * 1.25
	}
}



class Jarra{
	var property capacidad
	var property marca
	
	method alcoholTotal(){
		return (marca.graduacion() * 0.01) * capacidad
	}
}