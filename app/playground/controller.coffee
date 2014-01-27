angular.module('playground', [ 'ngSanitize'])

.controller('PlaygroundCtrl', [
  '$scope'
  '$routeParams'
  '$location'
  '$resource'
  '$rootScope'
  '$sce'
  '$http'

($scope, $routeParams, $location, $resource, $rootScope, $sce, $http) ->

  $scope.hide_code = true
  $scope.hide_dataset = true

  $scope.codeHtml = ""
  $scope.codeJs = ""
  $scope.codeCss = ""

  $rootScope.$on 'code:html', (e, html)->
    $scope.codeHtml = $sce.trustAsHtml(html)
    $scope.codeHtmlRaw = html

  $rootScope.$on 'code:js', (e, js)->
    $scope.codeJs = js

  $rootScope.$on 'code:css', (e, css)->
    $scope.codeCss = css

  $scope.toggle = (elt)->
    console.log "yolo"
    $scope["hide_"+elt] = if not $scope["hide_"+elt] then true else false

  $scope.render = ()->
    $scope.$broadcast("code:compile")

  $scope.load = (viz_id)->
    # console.log "loading viz: #{viz_id}"
    # console.log "http://api.wkpdz.11d.im/visualizations/#{viz_id}"

    $http.get("http://api.wkpdz.11d.im/visualizations/#{viz_id}")
      .success (r)->
        console.log r

        $scope.$broadcast "load.html", r.html
        $scope.$broadcast "load.css", r.css
        $scope.$broadcast "load.js", r.js

  if ($routeParams.vizId)
    $scope.load $routeParams.vizId

  $scope.save = ()->
    viz_info =
      css: $scope.codeCss
      js: $scope.codeJs
      html: $scope.codeHtmlRaw

    console.log viz_info

    if ($routeParams.vizId)
      viz_id = $routeParams.vizId

      $http.put "http://api.wkpdz.11d.im/visualizations/#{viz_id}", viz_info     
    else
      $http.post("http://api.wkpdz.11d.im/visualizations",viz_info)
        .then (r)->
          $location.path "/playground/#{r.data.id}"
])