import comidas.*
import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.origin()

method cuantaEnergia() = "Energia " +energia 

method image() {
   return if (self.estaEnElNido()){
		game.say(self, "GANASTE! WIII")
		game.schedule(2000, { game.stop() })
		"pepita-grande.png"
   }else if (self.position()==silvestre.position() or self.estaCansada()){
	 	if (self.position()==silvestre.position()){
			game.say(self, "PERDISTE! WIII")
			game.schedule(0000, { game.stop() })
		}
		"pepita-gris.png"
   } else {
	"pepita.png"
   }
	}//

	method come(comida) {
		game.say(self, self.cuantaEnergia())
		energia = energia + comida.energiaQueOtorga()	
	}

	method vola(kms) {
    energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {

		if (nuevaPosicion.x().between(0, game.width() - 1) && nuevaPosicion.y().between(0, game.height() - 1) 
		) {
			if (self.estaCansada()) {
			game.schedule(0000, { game.stop() })
			
			} else {
	
				self.vola(position.distance(nuevaPosicion))
				position = nuevaPosicion
				
			}
		}
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

	 method bajar() {
        if (position.y()  > 0 && energia != 0) { 
            position = game.at(position.x(), position.y() - 1) 
			
        }
    }

}