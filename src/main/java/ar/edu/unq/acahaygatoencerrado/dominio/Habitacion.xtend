package ar.edu.unq.acahaygatoencerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import java.util.List
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Habitacion {
	
	String nombre
	Boolean esFinal
	Boolean esInicial
	List<Accion> acciones = new ArrayList<Accion>
	
	new (String nombre){
		if(esUnaHabitacionValida(nombre)){
			this.nombre = nombre
			esFinal = false
			esInicial = false
		} else{
			throw new Exception("Nombre de Habitacion invalido")
		  }
}
	
	new() {
		esFinal = false
		esInicial = false
	}

	
	def esUnaHabitacionValida(String nombreHabitacion) {
		!nombreHabitacion.empty && !nombreHabitacion.toCharArray.get(0).equals(" ")
	}
}
