package Dominio

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Inventario {
	List<Item> items = new  ArrayList<Item>()
	
	
	def agregar(Item item){
		if(this.chequear){
			items.add(item)
		}	
	} 
	
	def chequear(){
		items.size() < 15
	}

	def quitar(Item item){
		items.remove(item)
	}
	
}
