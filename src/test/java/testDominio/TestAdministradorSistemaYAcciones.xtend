package testDominio

import org.junit.Before
import Dominio.Habitacion

class TestAdministradorSistemaYAcciones extends testAdministradorSistema {

	Habitacion puerto

	@Before
	override void setUp(){
		super.setUp
		
		administrador.agregarHabitacion(nostromo,"Puerto")
		puerto = nostromo.habitaciones.get(2)
		
		administrador.marcarHabitacionComoInicial(comedor)
		administrador.marcarHabitacionComoFinal(capsulaDeEscape)
		administrador.habilitar(nostromo)
	}
}