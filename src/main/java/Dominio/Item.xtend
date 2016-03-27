package Dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Item {
	
	String nombre
	
	new(String nombre) {
		this.nombre = nombre
	}
	
}
