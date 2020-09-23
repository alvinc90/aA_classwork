const Game = require("./game.js");

function GameView(ctx) {
    this.ctx = ctx;
    this.game = new Game();
}

GameView.prototype.start = function () {
    const that = this;
    this.bindKeyHandlers();
    setInterval(function(){
        that.game.step();
        that.game.draw(that.ctx);
    },200);
    
};

GameView.prototype.bindKeyHandlers = function(){
    const that = this;
    key('w', function(){that.game.ship.power([0,-1])})
    key('s', function(){that.game.ship.power([0,1])})
    key('a', function(){that.game.ship.power([-1,0])})
    key('d', function(){that.game.ship.power([1,0])})
    key('space', function(){that.game.ship.fireBullet()})

};

module.exports = GameView;