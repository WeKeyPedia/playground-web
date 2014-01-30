angular.module('users.actives', [])

.controller('usersActiveListCtrl', [
  '$scope'
  '$location'
  '$resource'
  '$rootScope'
  '$http'
  'users'

($scope, $location, $resource, $rootScope, $http, users)->
  $scope.users = users.users

  $scope.go_to_user = (id)->
    users.go_to_user id
])