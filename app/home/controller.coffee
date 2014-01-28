angular.module('home', [])

.controller('homeCtrl', [
  '$scope'
  '$location'
  '$resource'
  '$rootScope'
  '$http'
  'login'

($scope, $location, $resource, $rootScope, $http, login)->
  $scope.login = login

  console.log "home"

])