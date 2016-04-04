package ar.edu.unq.acahaygatoencerrado.dominio

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ServidorDeLaberintos {
	
	List<AdministradorSistema> administradores = new ArrayList<AdministradorSistema>
	List<Laberinto> laberintos = new ArrayList<Laberinto>
	
	
	def List<Laberinto> getLaberintosDisponibles(){
		var List<Laberinto> laberintos = new ArrayList<Laberinto>()
		laberintos = this.getTodoLosLaberinto()		
		this.filtarLaberintoDisponibles()
		return (laberintos)
	}	
	
	def List<Laberinto> getTodoLosLaberinto(){
		for(administrador : administradores){
			laberintos.addAll(administrador.laberintos)
		}
		return laberintos
	}

	def List<Laberinto> filtarLaberintoDisponibles(){
		var List<Laberinto> list
		for(laberinto : laberintos){
			if(laberinto.disponibilidad){
				list.add(laberinto)
			}
		}
		return list
	}
}
