const MovingObject = require("./moving_object");
const Util = require("./utils");

Bullet.VEL = 100;
// Bullet.COLOR = Util.getRandomColor();
Bullet.RADIUS = 5;
Bullet.prototype.isWrappable = false;

function Bullet (attr){
    MovingObject.call(this,{
        pos: attr.pos,
        vel: attr.vel.map( function(el){return el * Bullet.VEL} ),
        color: Util.getRandomColor(),
        radius: Bullet.RADIUS,
        game: attr.game
    })
}

Util.inherits(Bullet,MovingObject);

module.exports = Bullet;

