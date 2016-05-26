package ar.edu.unq.acahaygatoencerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import com.fasterxml.jackson.annotation.JsonIgnoreProperties

@Accessors
@JsonIgnoreProperties("acciones")
class Jugador {
	
	String nombre
	Inventario inventario
	Habitacion habitacionActual
	
	def jugarLaberinto(Laberinto laberinto){
		inventario = new Inventario
		laberinto.inicializarPartida(this)		
	}
	
	def setHabitacionActual(Habitacion habitacion) {
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