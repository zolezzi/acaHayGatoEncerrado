package ar.edu.unq.acahaygatoencerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Accion {
	
 	String nombre

	def void accionar(Jugador jugador)
	
	def Item itemAgarrable(){}
}
