/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\");\n\nAsteroid.COLOR = \"grey\";\nAsteroid.RADIUS = 20;\nAsteroid.VEL_MAX = 10;\nAsteroid.VEL_MIN = 5;\n\nAsteroid.prototype.isWrappable = false;\n\nfunction Asteroid(attr) {\n    MovingObject.call(this, {\n        pos: attr.pos,\n        vel: Util.randomVec(Asteroid.VEL_MAX * Math.random() + Asteroid.VEL_MIN),\n        color: Asteroid.COLOR,\n        radius: Asteroid.RADIUS,\n        game: attr.game\n    });\n}\n\nUtil.inherits(Asteroid, MovingObject);\n\nAsteroid.prototype.collideWith = function(otherObject){\n    if (otherObject instanceof Ship) {\n        Ship.prototype.relocate();\n    }\n};\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/bullet.js":
/*!***********************!*\
  !*** ./src/bullet.js ***!
  \***********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\n\nBullet.VEL = 100;\n// Bullet.COLOR = Util.getRandomColor();\nBullet.RADIUS = 5;\nBullet.prototype.isWrappable = false;\n\nfunction Bullet (attr){\n    MovingObject.call(this,{\n        pos: attr.pos,\n        vel: attr.vel.map( function(el){return el * Bullet.VEL} ),\n        color: Util.getRandomColor(),\n        radius: Bullet.RADIUS,\n        game: attr.game\n    })\n}\n\nUtil.inherits(Bullet,MovingObject);\n\nmodule.exports = Bullet;\n\n\n\n//# sourceURL=webpack:///./src/bullet.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\");\nconst Bullet = __webpack_require__(/*! ./bullet.js */ \"./src/bullet.js\")\n\nGame.DIM_X = 1000;\nGame.DIM_Y = 600;\nGame.NUM_ASTEROIDS = 0;\n\nfunction Game() {\n    this.ship = new Ship({pos: this.randomPosition(), game: this});\n    this.asteroids = [];\n    this.bullets = [];\n\n    while (this.asteroids.length < Game.NUM_ASTEROIDS) {\n        this.add(new Asteroid({pos: this.randomPosition(), game: this}));\n    }\n\n}\n\nGame.prototype.add = function (obj){\n    switch (obj.constructor){\n        case Bullet:\n            this.bullets.push(obj);\n            break;\n        case Asteroid:\n            this.asteroids.push(obj);\n            break;\n    }\n};\n\n\nGame.prototype.randomPosition = function () {\n    return [Math.random() * Game.DIM_X, Math.random() * Game.DIM_Y];\n};\n\nGame.prototype.draw = function (ctx) {\n    ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);\n    this.allObjects().forEach(function (el) {\n        el.draw(ctx);\n    });\n};\n\nGame.prototype.moveObjects = function () {\n    this.allObjects().forEach(function (el) {\n        el.move();\n    });\n};\n\nGame.prototype.warp = function (pos) {\n    return [pos[0] % Game.DIM_X, pos[1] % Game.DIM_Y];\n};\n\nGame.prototype.checkCollisions = function() {\n    const that = this;\n    \n    // that.allObjects().forEach(function (el, idx){\n    //     for (let i = idx + 1; i < that.allObjects().length; i++){\n    //         if (el.isCollidedWith(that.allObjects()[i])){\n    //             // alert(\"COLLISION\");\n    //         }\n    //     }   \n    // })\n}\n\nGame.prototype.step = function(){\n    this.moveObjects();\n    this.checkCollisions();\n}\n\nGame.prototype.remove = function(obj){\n    let idx;\n    switch (obj.constructor){\n        case Bullet:\n            idx = this.bullets.indexOf(obj);\n            this.bullets.splice(idx,1);\n            break;\n        case Asteroid:\n            idx = this.asteroids.indexOf(obj);\n            this.asteroids.splice(idx,1);\n            break;\n    }\n};\n\nGame.prototype.allObjects = function(){\n    return this.asteroids.concat(this.ship).concat(this.bullets);\n}; \n\n\nGame.prototype.isOutOfBounds = function(pos){\n    return (pos[0] < 0 || pos[0] > this.DIM_X || pos[1] < 0 || pos[1] > this.DIM_Y)\n}\nmodule.exports = Game;\n\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\nfunction GameView(ctx) {\n    this.ctx = ctx;\n    this.game = new Game();\n}\n\nGameView.prototype.start = function () {\n    const that = this;\n    this.bindKeyHandlers();\n    setInterval(function(){\n        that.game.step();\n        that.game.draw(that.ctx);\n    },200);\n    \n};\n\nGameView.prototype.bindKeyHandlers = function(){\n    const that = this;\n    key('w', function(){that.game.ship.power([0,-1])})\n    key('s', function(){that.game.ship.power([0,1])})\n    key('a', function(){that.game.ship.power([-1,0])})\n    key('d', function(){that.game.ship.power([1,0])})\n    key('space', function(){that.game.ship.fireBullet()})\n\n};\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("console.log(\"Webpack is working!\")\n\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\")\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\")\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\")\n\nwindow.MovingObject = MovingObject\nwindow.Asteroid = Asteroid\n\n\nwindow.addEventListener('DOMContentLoaded', (event) => {\n    const canvas = document.getElementById(\"game-canvas\");\n    const ctx = canvas.getContext(\"2d\");\n    const game_view = new GameView(ctx);\n    game_view.start();\n    // const mo = new MovingObject({\n    //     pos: [30, 30],\n    //     vel: [10, 10],\n    //     radius: 5,\n    //     color: \"#00FF00\"\n    // });\n    // mo.draw(ctx);\n\n    // const as = new Asteroid({pos: [50,50]});\n    // as.draw(ctx);\n\n\n});\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\n\nMovingObject.prototype.isWrappable = true;\n\nfunction MovingObject(attr){\n    this.pos = attr.pos;\n    this.vel = attr.vel;\n    this.radius = attr.radius;\n    this.color = attr.color;\n    this.game = attr.game\n}\n\nMovingObject.prototype.draw = function (ctx){\n    ctx.beginPath();\n    ctx.arc(\n        this.pos[0],\n        this.pos[1],\n        this.radius,\n        0,\n        2 * Math.PI,\n        false);\n    ctx.fillStyle = this.color;\n    ctx.fill();\n}\n\nMovingObject.prototype.move = function(){\n    this.pos[0] += this.vel[0];\n    this.pos[1] += this.vel[1];\n    // this.pos = this.game.warp(this.pos);\n    console.log(this);\n    console.log(this.game.allObjects());\n    if (this.game.isOutOfBounds(this.pos)){\n        if (this.isWrappable){\n            this.pos = this.game.warp(this.pos);\n        } else {\n            this.game.remove(this);\n        }\n    }\n}\n\nMovingObject.prototype.isCollidedWith = function(otherObject){\n    return Util.getDistance(this.pos, otherObject.pos) < (this.radius + otherObject.radius);\n}\n\nMovingObject.prototype.collideWith = function(otherObject){};\n\n\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Bullet = __webpack_require__(/*! ./bullet.js */ \"./src/bullet.js\");\n\nShip.RADIUS = 10;\nShip.COLOR = \"red\";\n\nfunction Ship(attr) {\n    MovingObject.call(this, {\n        pos: attr.pos,\n        vel: [0, 0],\n        color: Ship.COLOR,\n        radius: Ship.RADIUS,\n        game: attr.game,\n    });\n}\n\nUtil.inherits(Ship, MovingObject);\n\nShip.prototype.relocate = function () {\n    this.vel = [0, 0];\n    this.pos = this.game.randomPosition();\n};\n\nShip.prototype.power = function (impulse) {\n    this.vel[0] += impulse[0];\n    this.vel[1] += impulse[1];\n};\n\nShip.prototype.fireBullet = function () {\n    const bullet = new Bullet({\n        pos: this.pos,\n        vel: this.vel,\n        game: this.game,\n    });\n    this.game.add(bullet);\n};\n\nmodule.exports = Ship;\n\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = {\n    inherits(childClass, parentClass){\n        function Surrogate(){};\n        Surrogate.prototype = parentClass.prototype;\n        childClass.prototype = new Surrogate();\n        childClass.prototype.constructor = childClass;\n    },\n\n    // Return a randomly oriented vector with the given length.\n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n      // Scale the length of a vector by the given amount.\n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    },\n\n    getRandomColor() {\n        let letters = '0123456789ABCDEF';\n        let color = '#';\n        for (let i = 0; i < 6; i++) {\n          color += letters[Math.floor(Math.random() * 16)];\n        }\n        return color;\n    },\n    \n    getDistance(posOne, posTwo){\n        return Math.sqrt((posOne[0] - posTwo[0])**2 + (posOne[1] - posTwo[1])**2);\n\n    }\n};\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ });