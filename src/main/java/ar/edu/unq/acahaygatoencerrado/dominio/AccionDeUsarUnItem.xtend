package ar.edu.unq.acahaygatoencerrado.dominio


class AccionDeUsarUnItem extends Accion {
	Item item
	Item otroItem
	Habitacion habitacionALaCualIr
	
	new(Item item, Item otroItem) {
		this.nombre = "Usar " + item.nombre + " para obtener " + otroItem.nombre
		this.item = item
		this.otroItem = otroItem
	}
	
	new(Item item, Habitacion habitacionALaCualIr) {
		this.nombre = "Usar " + item.nombre + " para ir a " + habitacionALaCualIr.nombre
		this.item = item
		this.habitacionALaCualIr = habitacionALaCualIr
	}
	
	override accionar(Jugador jugador) {
		if(jugador.tiene(item)){
			jugador.quitar(item)
//			this.accionarAux(jugador)
		}
	}
/*	
	def accionarAux(Jugador jugador) {
		if(nombre.contains("Agarrar")){
			jugador.inventario.agregar(accion.itemAgarrable())
		} else {
			jugador.habitacionActual.acciones.add(accion)
		}
		jugador.habitacionActual.acciones.remove(this)
	}
	
	override itemAgarrable(){
		accion.itemAgarrable()
	}
*/
}