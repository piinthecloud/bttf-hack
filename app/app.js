'use strict';

// Declare app level module which depends on views, and components
angular.module('myApp', [
  'ngRoute',
  'myApp.home',
  'myApp.form',
  'myApp.version',
  'ui.bootstrap'
]).
config(['$routeProvider', function($routeProvider) {
  $routeProvider.otherwise({redirectTo: '/home'});
  // Closes the Responsive Menu on Menu Item Click
  $('.navbar-toggle').click(function() {
      console.log("test")
      $("#bs-example-navbar-collapse-1").toggle();
  });
}]);
