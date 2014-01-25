angular.module('playground', [ 'ngSanitize'])

.controller('PlaygroundCtrl', [
  '$scope'
  '$location'
  '$resource'
  '$rootScope'
  '$sce'

($scope, $location, $resource, $rootScope, $sce) ->

  $scope.hide_code = true
  $scope.hide_dataset = true
  $scope.codeHtml = ""

  $rootScope.$on 'code:html', (e, html)->
    $scope.codeHtml = $sce.trustAsHtml(html)

  console.log $scope

  $scope.toggle = (elt)->
    $scope["hide_"+elt] = if not $scope["hide_"+elt] then true else false

  $scope.render = ()->
    console.log "trying to compile !"
    $scope.$broadcast("code:compile")

])