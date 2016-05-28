package ar.edu.unq.acahaygatoencerrado.dominio

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import static org.uqbar.commons.model.ObservableUtils.*

@Observable
@Accessors
class CreadorDeLaberintos {
	
	List<Laberinto> laberintos = new ArrayList<Laberinto>

	def eliminarLaberinto(Laberinto laberinto) {
		laberintos.remove(laberinto)
		firePropertyChanged(this, "laberintos")	
	}

	def agregarLaberinto(Laberinto laberinto) {
		laberintos.add(laberinto)
		firePropertyChanged(this, "laberintos")
	}
}