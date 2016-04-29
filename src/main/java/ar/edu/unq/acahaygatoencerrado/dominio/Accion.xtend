package ar.edu.unq.acahaygatoencerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.Collection

@Observable
@Accessors
abstract class Accion extends Seleccionable{

	def void accionar(Jugador jugador)
	
	def Collection<Item> itemAgarrable(){
		#[]
	}
}