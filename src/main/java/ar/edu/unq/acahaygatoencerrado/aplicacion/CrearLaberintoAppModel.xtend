package ar.edu.unq.acahaygatoencerrado.aplicacion

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import ar.edu.unq.acahaygatoencerrado.dominio.AdministradorSistema

@Observable
@Accessors
class CrearLaberintoAppModel {
	Laberinto laberinto
	AdministradorSistema administrador 
	
	new(AdministradorSistema administrador){
		this.administrador = administrador
		laberinto = new Laberinto
	}
	
	def agregarLaberinto(){
		administrador.laberintos.add(laberinto)
	}
	
	
}