angular.module('pages.controller', [ 'pages.service' ])

.controller('pagesListCtrl', [
  '$scope'
  '$location'
  '$resource'
  '$rootScope'
  'pages'
  'login'

($scope, $location, $resource, $rootScope, pages, login)->
  $scope.pages = pages.pages

  $scope.visited_by_me = (page)->
    _(page.readers).contains(login.me.id)
])