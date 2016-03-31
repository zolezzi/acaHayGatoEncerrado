package testDominio

import org.junit.Before
import Dominio.AdministradorSistema
import org.junit.Test
import org.junit.Assert
import Dominio.Laberinto
import Dominio.Habitacion

class testAdministradorSistema {
	
	AdministradorSistema administrador
	Laberinto nostromo
	Habitacion comedor
	Habitacion capsulaDeEscape
	
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
		administrador.agregarHabitacion(nostromo,"Comedor")
		comedor = nostromo.habitaciones.get(0)
	}
	def administradorConUnLaberintoConDosHabitaciones(){
		
		this.administradorConUnLaberintoConUnaHabitacion
		administrador.agregarHabitacion(nostromo,"Capsula de Escape")
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
	def testAdministradorSistemaConUnLaberintoConDosHabitacionesMarcaAUnaComoInicialYOtraComoFinalYLuegoHabilitaElLaberintoEntoncesElLaberintoEstaDisponible(){
		
		this.administradorConUnLaberintoConDosHabitaciones
		administrador.marcarHabitacionComoInicial(comedor)
		administrador.marcarHabitacionComoFinal(capsulaDeEscape)
		administrador.habilitar(nostromo)
		
		Assert.assertTrue(nostromo.estaDisponible)
	}
	
	@Test
	def testAdministradoSistemaConUnLaberintoConDosHabitacionesHabilitaElLaberintoEntoncesElLaberintoNoEstaDisponible(){
		
		this.administradorConUnLaberintoConDosHabitaciones
		administrador.habilitar(nostromo)
		
		Assert.assertFalse(nostromo.estaDisponible)
	}
}