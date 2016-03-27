package Dominio

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ServidorDeLaberintos {
	
	List<AdministradorSistema> administradores = new ArrayList<AdministradorSistema>
	List<Laberinto> laberintos = new ArrayList<Laberinto>
	
	
	def laberintosDisponibles(){
		var List<Laberinto> laberintosDisponibles = new ArrayList<Laberinto>()
		for (laberinto : laberintos){
			if(laberinto.estaDisponible()){
				laberintosDisponibles.add(laberinto)
			}
		}
		return (laberintosDisponibles)
	}	
}
