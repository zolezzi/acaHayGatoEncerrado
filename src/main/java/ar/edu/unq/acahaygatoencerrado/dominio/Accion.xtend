package ar.edu.unq.acahaygatoencerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
abstract class Accion {
	
 	String nombre

	def void accionar(Jugador jugador)
	
	def Item itemAgarrable(){}
}
