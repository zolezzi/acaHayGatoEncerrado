package Dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Jugador {
	
	Inventario inventario
	public ServidorDeLaberintos servidorDeLaberintos
	Habitacion habitacionActual
	

	def solicitarLaberintos(){
		servidorDeLaberintos.laberintosDisponibles()
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
		var cond = false
		for(elemento : inventario.items){
			cond = cond || item.nombre == elemento.nombre
		}
		return cond
	}
	
	def quitar(Item item) {
		for(elemento : inventario.items){
			if(elemento.nombre == item.nombre){
				inventario.items.remove(elemento)
			}
		}
	}
}
