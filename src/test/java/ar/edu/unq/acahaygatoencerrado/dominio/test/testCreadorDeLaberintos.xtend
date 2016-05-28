package ar.edu.unq.acahaygatoencerrado.dominio.test

import ar.edu.unq.acahaygatoencerrado.dominio.Accion
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion
import ar.edu.unq.acahaygatoencerrado.dominio.Item
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import org.eclipse.xtend.lib.annotations.Accessors
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import ar.edu.unq.acahaygatoencerrado.dominio.CreadorDeLaberintos

@Accessors
class testCreadorDeLaberintos {
	
	CreadorDeLaberintos administrador
	Laberinto nostromo
	Habitacion comedor
	Habitacion capsulaDeEscape
	Habitacion puerto
	Item servilleta
	Accion irACapsula
	
	@Before
	def void setUp(){
		
		administrador = new CreadorDeLaberintos
	}
	
	def administradorConUnLaberinto(){
		
		administrador.agregarLaberinto(nostromo)
	}

	@Test
	def testAdministradorSistemaCreaUnLaberintoEntoncesTieneUnLaberinto(){
		
		this.administradorConUnLaberinto

		Assert.assertEquals(administrador.laberintos.size,1)
	}
	
	@Test
	def testAdministradorSistemaEliminaUnLaberintoEntoncesQuedaSinLaberintos(){
		
		this.administradorConUnLaberinto
		
		administrador.eliminarLaberinto(nostromo)
		
		Assert.assertTrue(administrador.laberintos.empty)
	}
}