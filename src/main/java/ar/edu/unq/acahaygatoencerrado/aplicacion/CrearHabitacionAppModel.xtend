package ar.edu.unq.acahaygatoencerrado.aplicacion

import ar.edu.unq.acahaygatoencerrado.dominio.AdministradorSistema
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class CrearHabitacionAppModel {
	
	Laberinto laberintoSeleccionado
	AdministradorSistema administrador
	String nombreHabitacion
	Habitacion habitacion
	
	new(AdministradorSistemaAppModel model) {
		
		administrador = model.administrador
		laberintoSeleccionado = model.laberintoSeleccionado
		habitacion = new Habitacion()
	}
	
	def agregarHabitacion() {
		habitacion.nombre = nombreHabitacion
		administrador.agregarHabitacion(laberintoSeleccionado, habitacion)
	}
}