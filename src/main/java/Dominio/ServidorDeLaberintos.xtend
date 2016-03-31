package Dominio

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ServidorDeLaberintos {
	
	List<AdministradorSistema> administradores = new ArrayList<AdministradorSistema>
	List<Laberinto> laberintos = new ArrayList<Laberinto>
	
	
	def List<Laberinto> laberintosDisponibles(){
		var List<Laberinto> laberintos = new ArrayList<Laberinto>()
		
		for (laberinto : laberintos){
			if(laberinto.estaDisponible()){
				laberintos.add(laberinto)
			}
		}
		return (laberintos)
	}	
}
