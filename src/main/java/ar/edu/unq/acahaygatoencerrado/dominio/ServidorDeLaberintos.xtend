package ar.edu.unq.acahaygatoencerrado.dominio

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ServidorDeLaberintos {
	List<AdministradorSistema> administradores = new ArrayList<AdministradorSistema>
	List<Laberinto> laberintos = new ArrayList<Laberinto>
	
	def getLaberintosDisponibles() {
		this.filtarLaberintoDisponibles()
		this.getTodosLosLaberintos()
	}	
	
	// No entendi bien que es lo q hace pero asi queda mas Xtend
	// se puede retornar solo [administradores.forEach(admin | laberintos.addAll(admin.laberintos))] pero me parecio mas claro poner laberintos
	def getTodosLosLaberintos() {
		administradores.forEach(admin | laberintos.addAll(admin.laberintos))
			laberintos
	}

	def filtarLaberintoDisponibles() {
		laberintos.filter[it.disponibilidad]
	}
}
