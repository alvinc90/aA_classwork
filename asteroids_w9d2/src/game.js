const Asteroid = require("./asteroid.js");
const Ship = require("./ship.js");
const Bullet = require("./bullet.js")

Game.DIM_X = 1000;
Game.DIM_Y = 600;
Game.NUM_ASTEROIDS = 0;

function Game() {
    this.ship = new Ship({pos: this.randomPosition(), game: this});
    this.asteroids = [];
    this.bullets = [];

    while (this.asteroids.length < Game.NUM_ASTEROIDS) {
        this.add(new Asteroid({pos: this.randomPosition(), game: this}));
    }

}

Game.prototype.add = function (obj){
    switch (obj.constructor){
        case Bullet:
            this.bullets.push(obj);
            break;
        case Asteroid:
            this.asteroids.push(obj);
            break;
    }
};


Game.prototype.randomPosition = function () {
    return [Math.random() * Game.DIM_X, Math.random() * Game.DIM_Y];
};

Game.prototype.draw = function (ctx) {
    ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
    this.allObjects().forEach(function (el) {
        el.draw(ctx);
    });
};

Game.prototype.moveObjects = function () {
    this.allObjects().forEach(function (el) {
        el.move();
    });
};

Game.prototype.warp = function (pos) {
    return [pos[0] % Game.DIM_X, pos[1] % Game.DIM_Y];
};

Game.prototype.checkCollisions = function() {
    const that = this;
    
    // that.allObjects().forEach(function (el, idx){
    //     for (let i = idx + 1; i < that.allObjects().length; i++){
    //         if (el.isCollidedWith(that.allObjects()[i])){
    //             // alert("COLLISION");
    //         }
    //     }   
    // })
}

Game.prototype.step = function(){
    this.moveObjects();
    this.checkCollisions();
}

Game.prototype.remove = function(obj){
    let idx;
    switch (obj.constructor){
        case Bullet:
            idx = this.bullets.indexOf(obj);
            this.bullets.splice(idx,1);
            break;
        case Asteroid:
            idx = this.asteroids.indexOf(obj);
            this.asteroids.splice(idx,1);
            break;
    }
};

Game.prototype.allObjects = function(){
    return this.asteroids.concat(this.ship).concat(this.bullets);
}; 


Game.prototype.isOutOfBounds = function(pos){
    return (pos[0] < 0 || pos[0] > this.DIM_X || pos[1] < 0 || pos[1] > this.DIM_Y)
}
module.exports = Game;
