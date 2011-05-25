jQuery(function() {
  var faye = new Faye.Client('http://localhost:9292/faye');
  var urlTemp = location.href.substring(location.href.indexOf('/courses/') + 9);
  faye.subscribe("/"+urlTemp+"/new", function(data) {
    eval(data);
  });
});
