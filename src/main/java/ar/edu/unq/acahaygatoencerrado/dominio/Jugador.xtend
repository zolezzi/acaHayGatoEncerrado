package ar.edu.unq.acahaygatoencerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class Jugador {

	Integer id = this.hashCode
	String nombre
	Inventario inventario
	Habitacion habitacionActual
	List<Accion> accionesDisponibles = new ArrayList<Accion>
	
	def jugarLaberinto(Laberinto laberinto){
		inventario = new Inventario
		laberinto.inicializarPartida(this)		
	}

	def hacerAccion(Accion accion){
		accion.accionar(this)
	}

	def hacerAccion(Integer idAccion){
		var Accion a
		for(accion : habitacionActual.acciones){
			if(accion.id == idAccion){
				a = accion
			}
		}
		hacerAccion(a)
		setAccionesDisponibles
	}

	def cambiarHabitacion(Habitacion habitacion) {
		this.habitacionActual = habitacion
		setAccionesDisponibles
	}
	
	def setAccionesDisponibles(){
		accionesDisponibles = new ArrayList<Accion>
		for(accion : habitacionActual.acciones){
			if(accion.estaDisponible(this)){
				accionesDisponibles.add(accion)
			}
		}
	}

	def tiene(Item item) {
		return inventario.items.exists[it | it.nombre == item.nombre]
	}
	
	def quitar(Integer idItem) {
		inventario.quitar(idItem)
		setAccionesDisponibles
	}
}