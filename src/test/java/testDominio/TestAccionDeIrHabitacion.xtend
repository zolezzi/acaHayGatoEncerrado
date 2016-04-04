package testDominio

import org.junit.Test
import Dominio.AccionDeIrHabitacion
import Dominio.Jugador
import Dominio.Habitacion
import org.junit.Before
import org.junit.Assert

class TestAccionDeIrHabitacion {
	
	AccionDeIrHabitacion irAlBanho
	
	Jugador jugador
	Habitacion banho
	
	@Before
	def void setUp(){
		
		banho = new Habitacion ("Baño")
		
		irAlBanho = new AccionDeIrHabitacion(banho)
		
		jugador = new Jugador
	}
	
	@Test
	def testAccionDeIrHabitacionSeAccionaConUnJugadorEntoncesLaHabitacionActualDelMismoEsLaHabitacionDeLaAccion(){
		
		irAlBanho.accionar(jugador)
		
		Assert.assertEquals(jugador.habitacionActual,irAlBanho.habitacion)
	}
}