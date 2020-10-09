import React from 'react'
import { Link } from 'react-router-dom'; 

// class Greeting extends React.Component {
//   constructor(props) {
//     super(props)
//   }

//   render () {
//     <div>
//       Welcome {this.props.currentUser.username}
//       <button onClick={this.props.logout}>Logout</button>
//     </div>

//   }

// }


const Greeting = ({currentUser, logout}) => {
  // debugger
  if (!currentUser){
    return (
      <div>
         <h2>Please Log in</h2>
         <Link to="/signup">Sign Up</Link>
         <br/>
         <Link to="/login">Login</Link>
      </div>
    )
  } else {
      return (

      <div>
         <h2>Welcome {currentUser.username}</h2>
        <button onClick={logout}>Logout</button>
      </div>
      )
  }
  

}

export default Greeting;