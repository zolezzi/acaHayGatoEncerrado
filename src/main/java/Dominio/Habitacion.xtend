package Dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import java.util.List

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

	
	def esUnaHabitacionValida(String nombreHabitacion) {
		!nombreHabitacion.empty && !nombreHabitacion.toCharArray.get(0).equals(" ")
	}
}