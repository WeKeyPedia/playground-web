'use strict'

# Declare app level module which depends on filters, and services
App = angular.module('app', [
  'ngCookies'
  'ngResource'
  'ngRoute'
  'view.wall'
  'code.forms'
  'dataset.controller'
  'dataset.service'
  # 'app.controllers'
  # 'app.directives'
  # 'app.filters'
  # 'app.services'
  # 'partials'
])

App.config([
  '$routeProvider'
  '$locationProvider'

($routeProvider, $locationProvider, config) ->

  $routeProvider

    .when('/dataset', { templateUrl: '/partials/dataset.html'})
    .when('/code', { templateUrl: '/partials/code.html'})
    .when('/wall', {templateUrl: '/partials/wall.html'})

    # .when('/todo', {templateUrl: '/partials/todo.html'})
    # .when('/view1', {templateUrl: '/partials/partial1.html'})
    # .when('/view2', {templateUrl: '/partials/partial2.html'})

    # # Catch all
    .otherwise({redirectTo: '/wall'})

  # Without server side support html5 must be disabled.
  $locationProvider.html5Mode(false)
])
