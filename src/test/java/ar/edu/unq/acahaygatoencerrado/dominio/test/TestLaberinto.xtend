package ar.edu.unq.acahaygatoencerrado.dominio.test

import org.junit.Assert
import org.junit.Before
import org.junit.Test
import org.junit.Rule
import org.junit.rules.ExpectedException
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion
import ar.edu.unq.acahaygatoencerrado.dominio.CreadorDeLaberintos

class TestLaberinto {

	Laberinto laberinto
	Habitacion habitacionInicial
	Habitacion habitacionFinal
	CreadorDeLaberintos administrador

	@Before
	def void setUp(){
		
		laberinto = new Laberinto("U.S.C.S.S. Nostromo")
		habitacionInicial = new Habitacion("Cocina")
		habitacionFinal = new Habitacion("Patio")
		administrador = new CreadorDeLaberintos
	}

	@Rule
	public ExpectedException thrown = ExpectedException.none()
	
	@Test (expected = Exception)
	def testNoSePuedeCrearLaberintoSinNombre(){
		
		new Laberinto ("")	
		Assert.fail("Nombre de Laberinto invalido") 
	}
	
	@Test
	def testLaberintoRecienInicializadoNoEstaDisponible(){		
		
		Assert.assertFalse(laberinto.estaDisponible)
	}
}