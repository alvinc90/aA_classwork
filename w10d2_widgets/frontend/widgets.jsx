import ReactDOM from 'react-dom';
import React from 'react';
import Clock from './clock';
import Tabs from './tabs';
// import Weather from './weather';
// import Autocomplete from './autocomplete';

const tabs = [{title: "one", content: "I am the first"}, {title: "two", content: "second pane here"}, {title: "three", content: "third pane here"}]
const Widgets = () => {
    return (
        <div className = "widgets">
         
              <h1>Clock</h1> <Clock />
              <h1>Tabs</h1> <Tabs banana={tabs}/>
              {/* <h1>Weather</h1> <Weather />
              <h1>Autocomplete</h1 ><Tabs /> */}
        </div> 
    )
}; 

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root"); 

  ReactDOM.render(<Widgets />, root);

})