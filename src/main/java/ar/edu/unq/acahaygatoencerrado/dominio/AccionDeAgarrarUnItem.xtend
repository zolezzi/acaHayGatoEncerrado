package ar.edu.unq.acahaygatoencerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AccionDeAgarrarUnItem extends Accion{
	
	Item itemAgarrable
	
	new(String nombreItem) {
		if(esUnNombreValido(nombreItem)){
			this.nombre = "Agarrar " + nombreItem
			itemAgarrable = new Item =>[nombre = nombreItem]
		}else{
			throw new Exception("Nombre de Item invalido")
		}
		
	}
	
	def esUnNombreValido(String nombreItem) {
		!nombreItem.empty && !nombreItem.toCharArray.get(0).equals(" ")}
	
	
	override accionar(Jugador jugador) {
		jugador.inventario.agregar(itemAgarrable)
		jugador.habitacionActual.acciones.remove(this)
	}
	
	override itemAgarrable() {
		#[itemAgarrable]
	}
}
