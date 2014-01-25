angular.module('dataset.controller', [])

.controller('DatasetCtrl', [
  '$scope'
  '$location'
  '$resource'
  '$rootScope'
  'dataset'

($scope, $location, $resource, $rootScope, dataset) ->

  console.log "yo ! man"

  $scope.$watch('$location.path()', (path) ->
    $scope.activeNavId = path || '/'
  )

  $scope.data = dataset.data
  $scope.days = dataset.days

  # $scope.data = _(dataset.data).reduce((memo, data)->
  #   if(memo[data] is undefined)
  #     memo[data] = 
  #       title: data.title
  #       url: data.url
  #       count: 0

  #   memo[data].count += 1
  # , [])

  $scope.load = ()->
    dataset.get "", ()->
      dataset.group_by_day()

      # console.log $scope.days

  $scope.load()

])