package ar.edu.unq.acahaygatoencerrado.aplicacion

import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion
import ar.edu.unq.acahaygatoencerrado.dominio.Item
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Observable
@Accessors
class CrearAccionDeUsarUnItemAppModel {
	
	Laberinto laberinto
	Habitacion habitacion
	Item itemRequeridoParaUsar
	List<Item> itemsAgarrables
	
	new(CrearAccionAppModel model) {
		laberinto = model.laberintoSeleccionado
		habitacion = model.habitacionSeleccionada
		itemRequeridoParaUsar = new Item
//		itemsAgarrables = laberinto.getItemsAgarrables
	}
	
	def agregarAccion() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
}