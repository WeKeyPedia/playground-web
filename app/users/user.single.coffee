angular.module('user.controller', [ 'users.service' ])

.controller('userFullCtrl', [
  '$scope'
  '$location'
  '$resource'
  '$rootScope'
  '$http'
  '$routeParams'
  'users'

($scope, $location, $resource, $rootScope, $http, $routeParams, users)->
  $scope.user = {}
  $scope.users = users.users

  $scope.$watchCollection 'users', ()=>
    for u in users.users
      if u.userId == $routeParams['userId']
        _($scope.user).extend u
])