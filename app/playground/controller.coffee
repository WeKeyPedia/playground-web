angular.module('playground', [])

.controller('PlaygroundCtrl', [
  '$scope'
  '$location'
  '$resource'
  '$rootScope'

($scope, $location, $resource, $rootScope, dataset) ->

  $scope.hide_code = true
  $scope.hide_dataset = true

  $scope.toggle = (elt)->
    $scope["hide_"+elt] = if not $scope["hide_"+elt] then true else false

])