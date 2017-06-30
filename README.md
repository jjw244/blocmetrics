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
3  Add the following code inside the pages which you desire to keep track of. Place this code on the bottom. This example has the event name "About Page View". Please feel free to choose a name that best describes the page you are placing this code:
ex. js snippet:
```
<script type="text/javascript">
     $(document).on("ready page:load", function () {
        blocmetrics.report("About Page");
      })
</script>
```
4  On Blocmetrics, under your registered application, you should see the events count change as your site gets viewed.
