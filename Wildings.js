function Wildings() {
    this._power = new Int(0);
}

Wildings.prototype.CONST_INCREASE_IN_FORCE = 2;
Wildings.prototype.OFFENSIVE_FORCE = 12;

Wildings.prototype.getPower = function(){
    return this._power;
}

Wildings.prototype.setPower = function(power){
    try{
        this._power = power;
    }
    catch (err){
        alert('Возникла непредвиденная ошибка, сила одичалых не была изменена. Ошибка: ' + err);
    }
}

Wildings.prototype.powerGrow = function(){
    this.setPower(this.getPower + this.CONST_INCREASE_IN_FORCE)
}

Wildings.prototype.wildingsOffensive = function(power){
    return power; //Куда отправлять сигнал пока не ясно
}

Wildings.prototype.checkAmountForce = function(){
    if (this.getPower === Wildings.prototype.OFFENSIVE_FORCE) {
       this.wildingsOffensive(this.getPower)
    }
}
