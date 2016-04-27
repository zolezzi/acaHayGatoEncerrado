package ar.edu.unq.acahaygatoencerrado.dominio

class AccionDeUsarUnItem extends Accion {
	
	Item itemNecesario
	Item resultante
	Habitacion habitacionALaCualIr
	
	new(Item item, Item otroItem) {
		this.nombre = "Usar " + item.nombre + " para obtener " + otroItem.nombre
		this.itemNecesario = item
		this.resultante = otroItem
	}
	
	new(Item item, Habitacion habitacionALaCualIr) {
		this.nombre = "Usar " + item.nombre + " para ir a " + habitacionALaCualIr.nombre
		this.itemNecesario = item
		this.habitacionALaCualIr = habitacionALaCualIr
	}
	
	override accionar(Jugador jugador) {
		if(jugador.tiene(itemNecesario)){
			jugador.quitar(itemNecesario)
		}
	}
	
	override itemAgarrable(){
		if(resultante!=null){
			return #[resultante]
		} else {
			return #[]
		}
	}
}