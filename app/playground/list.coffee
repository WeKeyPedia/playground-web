angular.module('playground.list', [])

.controller('playgroundListCtrl', [
  '$scope'
  '$location'
  '$resource'
  '$rootScope'
  '$http'
  'login'

($scope, $location, $resource, $rootScope, $http, login)->

  $scope.me = ""

  $scope.visualizations = []

  $scope.srvlogin = login

  $scope.$watchCollection "srvlogin.me",()->
    if login.me.id
      extra =
        params:
          userId: login.me.id

      $http.get("http://api.wkpdz.11d.im/visualizations", extra)
        .success (result)->
          $scope.visualizations.length = 0

          for v in result
            $scope.visualizations.push v


  $scope.login = ()->
    login.in()
])