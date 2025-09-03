object pepe {
    var categoria = cadete
    var bonoDeResultado = bonoNulo
    var bonoDePresentismo = bonoNulo
    var cantFaltas = 0
	method recategorizar(_categoria){
        categoria = _categoria
    }
    method asignarBonoDeResultado(unBono){
        bonoDeResultado = unBono
    }
    method asignarBonoDePresentismo (unBono){
        bonoDePresentismo = unBono
    }
    method sueldoNeto(){
        return categoria.neto()
    }
    method sueldo(){
        return (self.sueldoNeto() + bonoDeResultado.valorPara(self) + 
                bonoDePresentismo.valorPara(self))
    }
    method categoria(){
        return categoria
    }
    method asignarFaltas(faltas){
        cantFaltas = faltas
    }
    method cantidadFaltas(){
        return cantFaltas
    }
}

//Getters se necesita cuando un objeto exterior necesita acceder a un dato

object cadete {
    method neto(){
        return 20000
    }
}

object gerente {
    method neto(){
        return 15000
    }
}

object bonoPorResultadoPorcentual{
    method valorPara(empleado){
        return empleado.sueldoNeto() * 0.10
    }
}

object bonoPorResultadoFijo{
    method valorPara(empleado){
        return 800
    }
}

object bonoNulo{
    method valorPara(empleado){
        return 0
    }
}

object bonoPorPresentismoNormal{
    method valorPara(empleado){
        if(empleado.cantidadFaltas() == 0){
            return 2000
        }else if (empleado.cantidadFaltas() == 1){
            return 1000
            }else {
                return 0
            }
        }
}

object bonoPorPresentismoAjuste {
    method valorPara(empleado){
        if(empleado.cantidadFaltas() >= 1){
            return 0
        }else{
            return 100
        }
    }
}

object bonoPorPresentismoDemagogico{
    method valorPara(empleado){
        if(empleado.sueldoNeto() < 18000){
            return 500
        }else {
            return 300
        }
    }
}

object sofia {
    var categoria = cadete
    const bonoDeResultado = bonoNulo
    method sueldo () {
        return self.sueldoNeto() + bonoDeResultado.valorPara(self)
    }
    method sueldoNeto(){
        return (categoria.neto() * 1.3)
    }
    method recategorizar(_categoria){
        categoria = _categoria
    }
    method categoria (){
        return categoria
    }
}

object vendedor{
    var aumento = false
    method neto (){
        if(aumento){
            return 16000 * 1.25
        }else {
            return 16000 
    } 
}

    method activarAumentoPorMuchasVentas(){
        aumento = true
    }

    method desactivarAumentoPorMuchasVentas(){
        aumento = false
    }
}

object medioTiempo {
    var categoria = cadete
    method categoriaBase(_categoria){
        categoria = _categoria
    }
    method categoria (){
        return categoria
    }

}

object roque {
    const bonoDeResultado = bonoNulo
    method sueldoNeto(){
        return 28000
    }
    method sueldo(){
        return self.sueldoNeto() + bonoDeResultado.valorPara(self)
                + 9000
    }
}

object ernesto {
    var compañero = pepe
    const bonoDePresentismo = bonoNulo
    method compañero (){
        return compañero
    }
    method cambiarCompañero(_compañero){
        compañero = _compañero
    }
    method sueldoNeto(){
        return compañero.sueldoNeto()
    }
    method sueldo (){
        return self.sueldoNeto() + bonoDePresentismo.valorPara(self)
    }
    method cantidadFaltas(){
        return 0
    }
}

// PROPERTY Asigna getters y setters automaticamente
//Responsabilidad: que resuelve
//Requerimiento: que pide el sistema
//Precalculo : Calcular algo antes de tiempo

//Decorator