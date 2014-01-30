'use strict'

ace.config.set('workerPath', '/')

# Declare app level module which depends on filters, and services
App = angular.module('app', [
  'ngCookies'
  'ngResource'
  'ngRoute'
  'view.wall'

  'home'
  'menu'

  'login'
  'login.service'

  'playground'
  'playground.list'

  'code.forms'

  'pages.controller'
  'page.controller'

  'dataset.controller'
  'dataset.service'

  'users.service'
  'users.actives'

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
    .when('/', { templateUrl: '/home.html'})

    .when('/login', { templateUrl: '/partials/login.html'})

    .when('/playground', { templateUrl: '/playgroundList.html'})
#    .when('/playground/new', { templateUrl: '/playground.html'})
    .when('/playground/:vizId', { templateUrl: '/playground.html'})

    .when('/page/:pageURL*', { templateUrl: '/page.html'})

    
    .when('/modules_test/dataset', { templateUrl: '/partials/dataset.html'})
    .when('/modules_test/code', { templateUrl: '/partials/code.html'})
    .when('/modules_test/menu', { templateUrl: '/partials/menu.html'})

    .when('/wall', {templateUrl: '/partials/wall.html'})

#    .otherwise({redirectTo: ''})

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