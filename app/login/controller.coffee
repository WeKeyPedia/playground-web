angular.module('login', ["ngSanitize"])

.controller('loginCtrl', [
  '$scope'
  '$location'
  '$resource'
  '$rootScope'
  '$http'
  'login'

($scope, $location, $resource, $rootScope, $http, login)->

  $scope.me = ""

  $scope.srvlogin = login

  $scope.$watchCollection "srvlogin.me",()->
    $scope.me = angular.toJson($scope.srvlogin.me, true)

  $scope.login = ()->
    login.in()

  $scope.logout = ()->
    login.out()
])