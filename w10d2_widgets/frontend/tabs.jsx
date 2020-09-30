import React from 'react'; 

class Tabs extends React.Component {
    constructor (props) {
        super(props); 
        this.state = { tabsIndex: 0 };
    }
  render () {

    return(
      <div>
        <ul>
            {this.props.banana.map( (tab) => {
             return <h1>{tab.title}</h1>
             } )}

        </ul>
      </div >
    )
  }
}
 
  // this.props.tabs 

export default Tabs; 