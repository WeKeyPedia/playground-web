'use strict'

# Declare app level module which depends on filters, and services
App = angular.module('app', [
  'ngCookies'
  'ngResource'
  'ngRoute'
  'view.wall'
  'login'
  'login.service'
  'menu'
  'playground'
  'playground.list'
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

    .when('/playground', { templateUrl: '/playgroundList.html'})
#    .when('/playground/new', { templateUrl: '/playground.html'})
    .when('/playground/:vizId', { templateUrl: '/playground.html'})
    
    .when('/modules_test/dataset', { templateUrl: '/partials/dataset.html'})
    .when('/modules_test/code', { templateUrl: '/partials/code.html'})
    .when('/modules_test/menu', { templateUrl: '/partials/menu.html'})

    .when('/wall', {templateUrl: '/partials/wall.html'})

    .otherwise({redirectTo: '/login'})

  $locationProvider.html5Mode(true)
])

App.directive('btnLoading',()->
  mydir = (scope, element, attrs)->
    scope.$watch ()->
      scope.$eval attrs.ngDisabled
    , (newVal)->
      if newVal
        return undefined
      else
        return scope.$watch ()->
          scope.$eval(attrs.btnLoading)
        , (loading)->
          
          if loading
            return element.button("loading")

          element.button("reset")

  return mydir
)