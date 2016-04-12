package ar.edu.unq.acahaygatoencerrado.dominio.test

import org.junit.Before
import org.junit.Test
import org.junit.Assert
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.acahaygatoencerrado.dominio.AdministradorSistema
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion
import ar.edu.unq.acahaygatoencerrado.dominio.Item
import ar.edu.unq.acahaygatoencerrado.dominio.Accion
import ar.edu.unq.acahaygatoencerrado.dominio.AccionDeIrHabitacion

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
		var habitacion = new Habitacion("comnedor")
		administrador.agregarHabitacion(nostromo,habitacion)
		comedor = nostromo.habitaciones.get(0)
	}
	def administradorConUnLaberintoConDosHabitaciones(){
		
		this.administradorConUnLaberintoConUnaHabitacion
		var habitacion = new Habitacion("Capsula de Escape")
		administrador.agregarHabitacion(nostromo,habitacion)
		capsulaDeEscape = nostromo.habitaciones.get(1)
	}

	def administradorConUnLaberintoHabilitadoConDosHabitaciones(){
		
		this.administradorConUnLaberintoConDosHabitaciones
		administrador.marcarHabitacionComoInicial(comedor)
		administrador.marcarHabitacionComoFinal(capsulaDeEscape)
		administrador.habilitar(nostromo)
	}
	
	def administradorConUnLaberintoHabilitadoConTresHabitaciones(){
		
		this.administradorConUnLaberintoHabilitadoConDosHabitaciones
		var habitacion = new Habitacion("Puerto")
		administrador.agregarHabitacion(nostromo,habitacion)
		puerto = nostromo.habitaciones.get(2)
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
		
		this.administradorConUnLaberintoHabilitadoConDosHabitaciones
		
		Assert.assertTrue(nostromo.estaDisponible)
	}
	
	@Test
	def testAdministradorSistemaConUnLaberintoConDosHabitacionesHabilitaElLaberintoEntoncesElLaberintoNoEstaDisponible(){
		
		this.administradorConUnLaberintoConDosHabitaciones
		administrador.habilitar(nostromo)
		
		Assert.assertFalse(nostromo.estaDisponible)
	}

	//Testeo Creación de Acciones
	@Test
	def testAdministradorSistemaConUnLaberintoHabilitadoConTresHabitacionesAgregaDosAccionesEnLaHabitacionInicial(){
		
		this.administradorConUnLaberintoHabilitadoConTresHabitaciones
		administrador.crearAccionDeIrAOtraHabitacion(nostromo,comedor,puerto)
		administrador.crearAccionDeAgarrarUnElemento(nostromo,comedor,"Servilleta con contraseña escrita")
		
		Assert.assertEquals(comedor.acciones.size,2)
		Assert.assertEquals(comedor.acciones.get(0).nombre,"Ir a Puerto")
		Assert.assertEquals(comedor.acciones.get(1).nombre,"Agarrar Servilleta con contraseña escrita")
	}
	
	@Test
	def testAdministradorSistemaConLaberintoHabilitadoConTresHabitacionesAgregaDosAccionesEnLaHabitacionInicialYUnaDeUsarUnItemEnOtraHabitacion(){
		
		this.administradorConUnLaberintoHabilitadoConTresHabitaciones
		administrador.crearAccionDeIrAOtraHabitacion(nostromo,comedor,puerto)
		administrador.crearAccionDeAgarrarUnElemento(nostromo,comedor,"Servilleta con contraseña escrita")
		servilleta = comedor.acciones.get(1).itemAgarrable
		
		irACapsula = new AccionDeIrHabitacion(capsulaDeEscape)
		
		administrador.crearAccionDeIrAOtraHabitacion(nostromo,puerto,comedor)
		administrador.crearAccionDeUsarItem(nostromo,puerto,servilleta,irACapsula)
		
		Assert.assertEquals(puerto.acciones.size,2)
		Assert.assertEquals(puerto.acciones.get(0).nombre,"Ir a Comedor")
		Assert.assertEquals(puerto.acciones.get(1).nombre,"Usar Servilleta con contraseña escrita para Ir a Capsula de Escape")
	}
}
		