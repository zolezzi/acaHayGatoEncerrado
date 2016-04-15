package ar.edu.unq.acahaygatoencerrado.aplicacion

import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion
import ar.edu.unq.acahaygatoencerrado.dominio.Item
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import ar.edu.unq.acahaygatoencerrado.dominio.Accion
import ar.edu.unq.acahaygatoencerrado.dominio.AdministradorSistema

@Observable
@Accessors
class CrearAccionDeUsarUnItemAppModel {
	
	AdministradorSistema administrador
	Laberinto laberinto
	Habitacion habitacion
	Item itemRequeridoParaUsar
	List<Item> itemsAgarrables
	Accion accionARealizarAlUsarElItem
	CrearAccionAppModel appModel
	
	new (CrearAccionAppModel model) {
		appModel = model
		administrador = model.administrador
		laberinto = model.laberintoSeleccionado
		habitacion = model.habitacionSeleccionada
		itemRequeridoParaUsar = new Item
		itemsAgarrables = laberinto.getItemsAgarrables
	}

	def agregarAccion() {
		administrador.crearAccionDeUsarItem(laberinto,habitacion,itemRequeridoParaUsar,accionARealizarAlUsarElItem)
	}
}