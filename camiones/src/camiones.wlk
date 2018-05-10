object camion{
	var property tara = 1000
	var carga = #{} 
	var pesoMaximo = 2500
	
	method cargar(cosa){
		carga.add(cosa)
	}
	
	method descargar(cosa){
		carga.remove(cosa)
	}
	
	method pesoTotal(){
		return tara + carga.sum({cosa => cosa.peso()})
	}
	
	method excedidoDePeso(){
		return (self.pesoTotal() > pesoMaximo)
	}
	
	method objetosPeligrosos(n){
		return carga.filter({cosa => cosa.nivelPeligrosidad() > n})
	}
	
	method objetosMasPeligrososQue(_cosa){
		return carga.filer({cosa => cosa.nivelPeligrosidad() > _cosa.nivelPeligrosidad()})
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return carga.any({cosa => cosa.nivelPeligrosidad() > nivelMaximoPeligrosidad})
	}
}