/**
 * Initializes the Piece with its color.
 */
function Piece (color) {
    this.color = color; 
}

/**
 * Returns the color opposite the current piece.
 */
Piece.prototype.oppColor = function () {
    if (this.color != "white") {
        return "white"; 
    }
    else {
        return "black";
    } 
};

/**
 * Changes the piece's color to the opposite color.
 */
Piece.prototype.flip = function () {
    let temp = this.color;
    this.color = this.oppColor();
    this.oppColor = temp;
    return this.color;
};

/**
 * Returns a string representation of the string
 * based on its color.
 */
Piece.prototype.toString = function () {
    return this.color.charAt(0).toUpperCase();
};

module.exports = Piece;

// "(W)" "(B)"
