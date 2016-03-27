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
		this.nombre = nombre
		esFinal = false
		esInicial = false
	}
}
