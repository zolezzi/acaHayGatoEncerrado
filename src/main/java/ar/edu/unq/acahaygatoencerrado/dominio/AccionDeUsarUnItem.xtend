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
		}
	}
	
	override itemAgarrable(){
		if(otroItem!=null){
			return #[otroItem]
		} else {
			return #[]
		}
	}
}