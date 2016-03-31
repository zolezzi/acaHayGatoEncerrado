package testDominio

import Dominio.Inventario
import Dominio.ServidorDeLaberintos
import Dominio.Habitacion
import Dominio.Laberinto
import org.junit.Test
import org.junit.Before
import Dominio.Jugador
import org.junit.Assert

class TestJugador {
	
	Jugador jugador
	Inventario inventario
	ServidorDeLaberintos servidorDeLaberintos
	Habitacion habitacionActual
	Laberinto laberinto1
	Laberinto Laberinto2
	
	
	@Before
	def void setUp(){
		servidorDeLaberintos = new ServidorDeLaberintos()
		jugador = new Jugador()
		
	}
	
	@Test
	def testDadoUnJugadorQueSolicitaLaberintoYElServidorDeLaberintoNoTieneLaberintosRegistradosEntoncesRetorna0(){
		jugador.servidorDeLaberintos = servidorDeLaberintos
		Assert.assertEquals(jugador.servidorDeLaberintos.laberintos.size,0)
	}
	
	@Test
	def testDadoUnJugadorQueSolicitaUnLaberintoAlServidoQueTieneRegistradoUnLaberintoEntoncesRetorna1(){
		jugador.servidorDeLaberintos = servidorDeLaberintos
		servidorDeLaberintos.laberintos.add(laberinto1)
		
		Assert
		
	}
	
}