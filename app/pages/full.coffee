angular.module('page.controller', [ 'page.service' ])

.controller('pageFullCtrl', [
  '$scope'
  '$location'
  '$resource'
  '$rootScope'
  '$routeParams'
  'page'

($scope, $location, $resource, $rootScope, $routeParams, page)->
  $scope.page = page

  page.get $routeParams.pageURL

])