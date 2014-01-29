angular.module('pages.controller', [ 'pages.service' ])

.controller('pagesListCtrl', [
  '$scope'
  '$location'
  '$resource'
  '$rootScope'
  'pages'

($scope, $location, $resource, $rootScope, pages)->
  $scope.pages = pages.pages
])