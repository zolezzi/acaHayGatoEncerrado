package testDominio

import org.junit.Test
import org.junit.Before
import Dominio.ServidorDeLaberintos
import org.junit.Assert

class TestServidorDeLaberintos {

	ServidorDeLaberintos servidor
	
	@Before
	def void setUp(){

		servidor = new ServidorDeLaberintos
	}

	@Test
	def testServidorSinLaberintosDisponibles(){
		
		Assert.assertTrue(servidor.laberintosDisponibles.empty)
	}
}