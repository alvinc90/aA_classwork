class FollowToggle {

    //when somebody is making a new follow-toggle instance, they will pass in a jQuery object

    constructor($el) { //naming an argument, $=== jQuery object
        
        this.userId = $el.data(user-id); 
        this.followState = $el.data(initial-follow-state);

    }


    render() {

        if (this.followState === "unfollowed") {
            $(".follow-toggle").append("Follow!");
        }

        else if (this.followState === "followed") {
            $(".follow-toggle").append("Unfollow!");
        }

    }

}

module.exports = FollowToggle;