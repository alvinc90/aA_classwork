const FollowToggle = require("./follow_toggle");


$(document).ready(function () {
    console.log("ready!");

    let $eles = $("button.follow-toggle");

    // "button.follow-toggle"


    $eles.each(function (index, $el) {

        new FollowToggle($el);

       //turning each button into the followtoggle class
        console.log("Hello");

    });

    // FollowToggle
});

// document.ready()
//import any other files that we make in the frontend folder, so that webpack can take it