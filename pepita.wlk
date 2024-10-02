import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.at(0,2)

	method image() {
		 if (self.estaEnElNido()){
			return "pepita-grande.png"
		 }  else if(silvestre.position()==self.position()){
			return "pepita-gris.png"
		 }else{
			return "pepita.png"
		 }
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
		self.vola(position.distance(nuevaPosicion))
		position = nuevaPosicion
	}

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		return position == nido.position()
	}
	
	
	method estaEnElSuelo() {
		return position.y() == 0 
	}

}