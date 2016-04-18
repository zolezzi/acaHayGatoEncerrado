package ar.edu.unq.acahaygatoencerrado.dominio.test

import ar.edu.unq.acahaygatoencerrado.dominio.Accion
import ar.edu.unq.acahaygatoencerrado.dominio.AdministradorSistema
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion
import ar.edu.unq.acahaygatoencerrado.dominio.Item
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import org.eclipse.xtend.lib.annotations.Accessors
import org.junit.Assert
import org.junit.Before
import org.junit.Test

@Accessors
class testAdministradorSistema {
	
	AdministradorSistema administrador
	Laberinto nostromo
	Habitacion comedor
	Habitacion capsulaDeEscape
	Habitacion puerto
	Item servilleta
	Accion irACapsula
	
	@Before
	def void setUp(){
		
		administrador = new AdministradorSistema ()
	}
	
	def administradorConUnLaberinto(){
		
		administrador.crearLaberinto("U.S.C.S.S. Nostromo")
		nostromo = administrador.laberintos.get(0)
	}
	def administradorConUnLaberintoConUnaHabitacion(){
		
		this.administradorConUnLaberinto
		var habitacion = new Habitacion("comedor")
		administrador.agregarHabitacion(nostromo,habitacion)
		comedor = nostromo.habitaciones.get(0)
	}
	def administradorConUnLaberintoConDosHabitaciones(){
		
		this.administradorConUnLaberintoConUnaHabitacion
		var habitacion = new Habitacion("Capsula de Escape")
		administrador.agregarHabitacion(nostromo,habitacion)
		capsulaDeEscape = nostromo.habitaciones.get(1)
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

	@Test
	def testAdministradorSistemaConUnLaberintoCreaUnaHabitacionEnElMismoEntoncesElLaberintoTieneUnaHabitacion(){
		
		this.administradorConUnLaberintoConUnaHabitacion
		
		Assert.assertEquals(nostromo.habitaciones.size,1)
	}
	
	@Test
	def testAdministradorSistemaConUnLaberintoQueTieneUnaHabitacionCuandoLeAgregaOtraHabitacionMasElLaberintoTieneDosHabitaciones(){
		
		this.administradorConUnLaberintoConDosHabitaciones
		
		Assert.assertEquals(nostromo.habitaciones.size,2)
	}
	
	@Test
	def testAdministradorSistemaConUnLaberintoConDosHabitacionesCuandoEliminaUnaDeEllasElLaberintoTieneUnaHabitacion(){
		
		this.administradorConUnLaberintoConDosHabitaciones
		administrador.eliminarHabitacion(nostromo,capsulaDeEscape)
		
		Assert.assertEquals(nostromo.habitaciones.size,1)
	}
	
	@Test
	def testAdministradorSistemaConUnLaberintoConDosHabitacionesHabilitaElLaberintoEntoncesElLaberintoNoEstaDisponible(){
		
		this.administradorConUnLaberintoConDosHabitaciones
		administrador.habilitar(nostromo)
		
		Assert.assertFalse(nostromo.estaDisponible)
	}
}