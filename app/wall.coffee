angular.module('view.wall', [])

.controller("WallCtrl", [
  '$scope'
  '$location'
  '$resource'
  '$rootScope'
  'dataset'

($scope, $location, $resource, $rootScope, dataset)->

  $scope.keywords = dataset.data
  $scope.pages = dataset.pages

  dataset.get "", ()->
    dataset.compute()

#  dataset.get '{"$limit":50}'
])