import React from 'react'; 

class Clock extends React.Component {
    constructor() {
        super(); 
        this.state = { date: new Date()}
        this.tick = this.tick.bind(this)
    }
//this.state = { city: "", listings: [] };


tick() {
    this.setState({date: new Date()})
  }

componentDidMount() {
  this.intervalId = setInterval(this.tick, 1000)
}

componentWillUnmount() {
    clearInterval(this.intervalId); 
}

render() {
  this.hours = this.state.date.getHours();
  this.minutes = this.state.date.getMinutes();
  this.seconds = this.state.date.getSeconds();

    return(
        <div className= "clock">
        <h1 id="time">Time: {this.hours}:{this.minutes}:{this.seconds}</h1>
        <h1 id="date">Date: {this.state.date.toDateString()}</h1>
        </div> 
    )

}
}


export default Clock; 



