##Blocmetrics

An analytics service and reporting tool that can be used with web apps to track user activity.

##To Register and Track Your Applications

1  Sign up for Blocmetrics and register your website to track.

2  Add the following javascript code to the application you want to track:
    - Add this to app/assets/application.js:
```
blocmetrics = {};
blocmetrics.report = function(eventName){
  var event = {event: { name: eventName }};
  var request = new XMLHttpRequest();
  request.open("POST", "https://yourapp.com/api/events", true);
  request.setRequestHeader('Content-Type', 'application/json');
  request.send(JSON.stringify(event));
};
```
3  Add the following javascript code to application.js.  This triggers an event everytime someone signs-up, .user-sign-up class was added to the sign-up link in application.html.erb.
ex. js snippet:
```
$(document).on('turbolinks:load', function () {
  $('.user_sign_up').click(function() {
    console.log("testing");
    blocmetrics.report("user signed up");
  });
});
```
4  On Blocmetrics, under your registered application, you should see the events count change as your site gets viewed.
