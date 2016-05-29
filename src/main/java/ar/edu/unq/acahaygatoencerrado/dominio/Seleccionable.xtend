package ar.edu.unq.acahaygatoencerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Seleccionable {

	int id = this.hashCode
	String nombre
}