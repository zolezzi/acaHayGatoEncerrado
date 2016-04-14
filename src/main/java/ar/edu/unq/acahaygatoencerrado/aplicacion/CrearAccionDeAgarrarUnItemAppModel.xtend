package ar.edu.unq.acahaygatoencerrado.aplicacion

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import ar.edu.unq.acahaygatoencerrado.dominio.AdministradorSistema
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion
import ar.edu.unq.acahaygatoencerrado.dominio.Item
import org.uqbar.commons.utils.Observable

@Accessors
@Observable

class CrearAccionDeAgarrarUnItemAppModel {
	
	Laberinto laberintoSeleccionado
	AdministradorSistema administrador
	Habitacion habitacionSeleccionada
	String nombreItem
	Item itemNuevo
	

	new(CrearAccionAppModel model) {
		administrador = model.administrador
		laberintoSeleccionado = model.laberintoSeleccionado
		habitacionSeleccionada = model.habitacionSeleccionada
		itemNuevo = new Item()
	}
	
	def agregarItem() {
		administrador.crearAccionDeAgarrarUnElemento(laberintoSeleccionado, habitacionSeleccionada, nombreItem)
	}
	
}