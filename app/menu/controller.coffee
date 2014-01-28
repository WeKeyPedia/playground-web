angular.module('menu', [])

.controller('menuCtrl', [
  '$scope'
  '$location'
  '$resource'
  '$rootScope'
  '$http'
  'login'

($scope, $location, $resource, $rootScope, $http, login)->
  $scope.login = login
])