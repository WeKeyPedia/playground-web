'use strict'

# Declare app level module which depends on filters, and services
App = angular.module('app', [
  'ngCookies'
  'ngResource'
  'ngRoute'
  'view.wall'
  'login'
  'login.service'
  'playground'
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
    .when('/login', { templateUrl: '/partials/login.html'})

    .when('/playground', { templateUrl: '/playground.html'})
    .when('/playground/:vizId', { templateUrl: '/playground.html'})
    .when('/dataset', { templateUrl: '/partials/dataset.html'})
    .when('/code', { templateUrl: '/partials/code.html'})

    .when('/wall', {templateUrl: '/partials/wall.html'})

    .otherwise({redirectTo: '/login'})

  $locationProvider.html5Mode(true)
])
