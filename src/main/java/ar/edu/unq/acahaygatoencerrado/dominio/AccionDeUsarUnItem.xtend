package ar.edu.unq.acahaygatoencerrado.dominio


class AccionDeUsarUnItem extends Accion {
	Item item
	Accion accion
	
	new(Item item, Accion accion) {
		this.nombre = "Usar " + item.nombre + " para " + accion.nombre
		this.item = item
		this.accion = accion
	}
	
	override accionar(Jugador jugador) {
		if(jugador.tiene(item)){
			jugador.quitar(item)
			this.accionarAux(jugador)
		}
	}
	
	def accionarAux(Jugador jugador) {
		if(nombre.contains("Agarrar")){
			jugador.inventario.agregar(accion.itemAgarrable())
		} else {
			jugador.habitacionActual.acciones.add(accion)
		}
		jugador.habitacionActual.acciones.remove(this)
	}
}
