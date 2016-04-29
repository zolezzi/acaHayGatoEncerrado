package ar.edu.unq.acahaygatoencerrado.aplicacion

import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import ar.edu.unq.acahaygatoencerrado.dominio.AdministradorSistema
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class AdministradorLaberintosAppModel {
	
	AdministradorSistema administrador
	Laberinto laberintoSeleccionado
	String nombreLaberinto
	
	new(AdministradorSistemaAppModel model) {
		
		administrador = model.administrador
		laberintoSeleccionado = model.laberintoSeleccionado
	}
	
	def agregarLaberinto(){
		laberintoSeleccionado = new Laberinto => [
			nombre = nombreLaberinto
		]
		administrador.agregarLaberinto(laberintoSeleccionado)
	}
}