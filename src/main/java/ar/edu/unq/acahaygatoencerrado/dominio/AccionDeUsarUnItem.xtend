package ar.edu.unq.acahaygatoencerrado.dominio

import com.fasterxml.jackson.annotation.JsonIgnore

class AccionDeUsarUnItem extends Accion {
	
	@JsonIgnore
	Item itemNecesario
	@JsonIgnore
	Item itemResultante
	@JsonIgnore
	Habitacion habitacionALaCualIr
	
	new(Item item, Item otroItem) {
		this.nombre = "Usar " + item.nombre + " para obtener " + otroItem.nombre
		this.itemNecesario = item
		this.itemResultante = otroItem
	}
	
	new(Item item, Habitacion habitacionALaCualIr) {
		this.nombre = "Usar " + item.nombre + " para ir a " + habitacionALaCualIr.nombre
		this.itemNecesario = item
		this.habitacionALaCualIr = habitacionALaCualIr
	}
	
	override accionar(Jugador jugador) {
		jugador.quitar(itemNecesario)
		if(itemResultante!=null){
			jugador.inventario.agregar(itemResultante)
			jugador.habitacionActual.acciones.remove(this)
		} else {
			jugador.habitacionActual.crearAccionDeIrAOtraHabitacion(habitacionALaCualIr)
			jugador.habitacionActual.acciones.remove(this)
			jugador.cambiarHabitacion(habitacionALaCualIr)
		}
	}

	override itemAgarrable(){
		if(itemResultante!=null){
			return #[itemResultante]
		} else {
			return #[]
		}
	}
	
	override estaDisponible(Jugador jugador){
		jugador.tiene(itemNecesario)
	}
}