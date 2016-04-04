package testDominio

import Dominio.Laberinto
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import Dominio.Habitacion
import org.junit.Rule
import org.junit.rules.ExpectedException
import Dominio.AdministradorSistema

class TestLaberinto {

	Laberinto laberinto
	Habitacion habitacionInicial
	Habitacion habitacionFinal
	AdministradorSistema administrador
	
	
	@Before
	def void setUp(){
		
		laberinto = new Laberinto("U.S.C.S.S. Nostromo")
		habitacionInicial = new Habitacion("Cocina")
		habitacionFinal = new Habitacion("Patio")
		administrador = new AdministradorSistema
	}
	
	
		
	@Rule
	public ExpectedException thrown = ExpectedException.none()
	
	@Test (expected = Exception)
	def testLaberintoSinNombre(){
		
		new Laberinto ("")	
		thrown.expectMessage("Nombre de Laberinto invalido") 
	}
	
	@Test
	def testLaberintoRecienInicializadoNoEstaDisponible(){		
		
		Assert.assertFalse(laberinto.estaDisponible)
	}
	
	@Test
	def testLaberintoConUnaHabitacionInicialYUnaFinalEstaDisponible(){
		
		administrador.marcarHabitacionComoFinal(habitacionFinal)
		administrador.marcarHabitacionComoInicial(habitacionInicial)
		
		laberinto.habitaciones.add(habitacionInicial)
		laberinto.habitaciones.add(habitacionFinal)

		administrador.habilitar(laberinto)
				
		Assert.assertTrue(laberinto.estaDisponible)
	}
	
	@Test
	def testDadoUnLaberintoQueTieneUnaHabitacionInicialYDosHabitacionesMasLeConsultoSiLaInicialEsLaSeteada(){
		
		administrador.marcarHabitacionComoInicial(habitacionInicial)
		administrador.agregarHabitacion(laberinto, "Baño")
		administrador.agregarHabitacion(laberinto, "Pieza")
		laberinto.habitaciones.add(habitacionInicial)
		
		Assert.assertEquals(laberinto.habitacionInicial, habitacionInicial)
		Assert.assertTrue(laberinto.chequearInicio)
	}


}