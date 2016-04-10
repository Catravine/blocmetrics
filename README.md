##Blocmetrics: an analytics service to track events on websites.

###Save the trackin' data for viewin' lata.

Made with my mentor at [Bloc](http://bloc.io).

Live: [Heroku Deployment](https://mighty-eyrie-26757.herokuapp.com/).

###Register your Application

[Sign up](https://mighty-eyrie-26757.herokuapp.com/) and then 'Register New App',
and enter your app's name and url to add your app to Blocmetrics' list of
registered domains.

###Generate Event request snippet:

copy this code into your `app/assets/javascripts/application.js` file:

```javascript
// Blocmetrics event request
var blocmetrics = {};
blocmetrics.report = function(eventName) {
  var event = {event: { name: eventName}};
  var request = new XMLHttpRequest();
  request.open("POST", "https://mighty-eyrie-26757.herokuapp.com/api/events", true);
  request.setRequestHeader('Content-Type', 'application/json');
  request.send(JSON.stringify(event));
};
```
put this event report in your `<head>`

```javascript
<script>
window.onload = function() {
  blocmetrics.report('eventName');
};
</script>
```

**or** in an html element:

```html
<h1 onload="function() {
  blocmetrics.report('eventName');
};">A Specific Page</h1>
```

Change **eventName** to a meaningful... event name
