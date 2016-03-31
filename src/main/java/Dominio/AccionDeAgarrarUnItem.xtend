package Dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AccionDeAgarrarUnItem extends Accion{
	
	Item itemAgarrable
	
	new(String nombreItem) {
		
		this.nombre = "Agarrar " + nombreItem
		itemAgarrable = new Item => [
			nombre = nombreItem
		]
	}
	
	override accionar(Jugador jugador) {
		jugador.inventario.agregar(itemAgarrable)
		jugador.habitacionActual.acciones.remove(this)
	}
	
	override itemAgarrable() {
		itemAgarrable
	}
}
