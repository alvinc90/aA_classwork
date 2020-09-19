class Clock {
    constructor() {
        // 1. Create a Date object.
        const banana = new Date(); 
        // 2. Store the hours, minutes, and seconds.
        this.hours = banana.getHours();
        this.minutes = banana.getMinutes();
        this.seconds = banana.getSeconds();
        // 3. Call printTime.
        this.printTime();
        // 4. Schedule the tick at 1 second intervals.
        setInterval(this._tick.bind(this), 1000);
        // setInterval(() => this._tick(), 1000);
        
        // fat arrow => will oook into the scope, 
        // will preserve the this for the contents of this function
    }
        // this._yar = this._yar.bind(this)
 
    printTime() {
        // Format the time in HH:MM:SS
        // Use console.log to print it.
        // console.log(getTime()); 
        console.log(`HH: ${this.hours} MM:${this.minutes} SS:${this.seconds}`);
        
    }

    _tick() {
        // 1. Increment the time by one second.
        this.seconds += 1; 
        if (this.seconds === 60) {
            this.seconds = 0;
            this.minutes += 1;
        }
        if (this.minutes === 60) {
            this.minutes = 0;
            this.hours += 1;
        }
        if (this.hours === 24) {
            this.hours = 0;
        }
        // 2. Call printTime.
        // console.log(this);
        this.printTime();
    }

}

apple = new Clock 
// apple.printTime(); 

