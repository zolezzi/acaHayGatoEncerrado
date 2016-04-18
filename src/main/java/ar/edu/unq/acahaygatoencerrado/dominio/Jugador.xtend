package ar.edu.unq.acahaygatoencerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Jugador {
	
	Inventario inventario
	public ServidorDeLaberintos servidorDeLaberintos
	Habitacion habitacionActual
	

	def solicitarLaberintos(){
		servidorDeLaberintos.getLaberintosDisponibles()
	}
	
	def jugarLaberinto(Laberinto laberinto){
		inventario = new Inventario
		laberinto.inicializarPartida(this)		
	}
	
	def setHabitacionInicial(Habitacion habitacion) {
		habitacionActual = habitacion
	}
	
	def getAcciones(){
		habitacionActual.getAcciones
	}

	def hacerAccion(Accion accion){
		accion.accionar(this)
	}
	
	def cambiarHabitacion(Habitacion habitacion) {
		this.habitacionActual = habitacion
	}
	
	def tiene(Item item) {
		return inventario.items.exists[it | it.nombre == item.nombre]
	}
	
	def quitar(Item item) {
		for(elemento : inventario.items){
			if(elemento.nombre == item.nombre){
				inventario.items.remove(elemento)
			}
		}
	}
}