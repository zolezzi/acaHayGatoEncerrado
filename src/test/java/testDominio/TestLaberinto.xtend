package testDominio

import Dominio.Laberinto
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestLaberinto {

	Laberinto laberinto
	
	@Before
	def void setUp(){
		
		laberinto = new Laberinto("U.S.C.S.S. Nostromo")

	}
	
	@Test
	def testLaberintoRecienInicializadoNoEstaDisponible(){
		
		Assert.assertFalse(laberinto.estaDisponible)
	}
	
	@Test
	def testLaberintoConUnaHabitacionInicialYUnaFinalEstaDisponible(){
		
		//testearAdministradorSistemaAntes
		
		Assert.assertTrue(laberinto.estaDisponible)
	}
}