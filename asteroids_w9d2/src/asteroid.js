const Util = require("./utils.js");
const MovingObject = require("./moving_object");
const Ship = require("./ship.js");

Asteroid.COLOR = "grey";
Asteroid.RADIUS = 20;
Asteroid.VEL_MAX = 10;
Asteroid.VEL_MIN = 5;

Asteroid.prototype.isWrappable = false;

function Asteroid(attr) {
    MovingObject.call(this, {
        pos: attr.pos,
        vel: Util.randomVec(Asteroid.VEL_MAX * Math.random() + Asteroid.VEL_MIN),
        color: Asteroid.COLOR,
        radius: Asteroid.RADIUS,
        game: attr.game
    });
}

Util.inherits(Asteroid, MovingObject);

Asteroid.prototype.collideWith = function(otherObject){
    if (otherObject instanceof Ship) {
        Ship.prototype.relocate();
    }
};

module.exports = Asteroid;