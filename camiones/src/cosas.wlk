object knightRider{
	method peso() = 500
	
	method nivelPeligrosidad() = 10
}

object bumblebee{
	var tipo = "auto"
	
	method transformar(nuevoTipo){
		tipo = nuevoTipo
	}
	
	method peso() = 800
	
	method nivelPeligrosidad(){
		return if (tipo == "auto") 15 else 30
	}
}

object paqueteDeLadrillos{
	var cantLadrillos
	
	method cantLadrillos(cantidad){
		cantLadrillos = cantidad
	}
	
	method peso() = 2 * cantLadrillos
	
	method nivelPeligrosidad() = 2
}

object arenaAGranel{
	var peso
	
	method cantidadArena(cantidad){
		peso = cantidad
	}
	
	method peso() = peso
	
	method nivelPeligrosidad() = 1
}

object bateriaAntiaerea{
	var estaConMisiles = true
	
	method quitarMisiles(){
		estaConMisiles = false
	}
	
	method peso(){
		return if (estaConMisiles) 300 else 200
	}
	
	method nivelPeligrosidad(){
		return if (estaConMisiles) 100 else 0
	}
}

object contenedorPortuario{
	var property cosas = #{}
	
	method agregarCosa(cosa){
		cosas.add(cosa)
	}
	
	method quitarCosa(cosa){
		cosas.remove(cosa)
	}
	
	method peso() = 100 + cosas.sum({cosa => cosa.peso()})
	
	method objetoMasPeligroso(){
		return cosas.max({producto => producto.nivelPeligrosidad()})
	}
	
	method nivelPeligrosidad(){
		return if (cosas.isEmpty()) 0 else self.objetoMasPeligroso().nivelPeligrosidad() 
	}
}

object residuosRadioactivos{
	var peso
	
	method asignarPeso(cantidad){
		peso = cantidad
	}
	
	method peso() = peso
	
	method nivelPeligrosidad() = 200
}

class EmbalajeDeSeguridadEstandar{
	var cosasEmbaladas = #{}
	
	method asignarCosa(cosa){
		cosasEmbaladas.add(cosa)
	}
	
	method peso() = cosasEmbaladas.sum({cosa => cosa.peso()})
	
	method nivelPeligrosidad(){
		return (cosasEmbaladas.max({cosa => cosa.nivelPeligrosidad()})).nivelPeligrosidad()
	}
}

class EmbalajeDeSeguridadLiviano inherits EmbalajeDeSeguridadEstandar{
	override method nivelPeligrosidad(){
		return if (cosasEmbaladas.sum({cosa => cosa.peso()}) < 200) 0 else super()
	}
}

class EmbalajeDeSeguridadBolsaDeAserrin inherits EmbalajeDeSeguridadEstandar{
	var cantAserrin
	
	method cantidadAserrin(cantidad){
		cantAserrin = cantidad
	}
	
	override method peso() = super() + cantAserrin
	
	override method nivelPeligrosidad(){
		return super() - (10 * cantAserrin)
	}
}