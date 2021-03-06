angular.module('playground', [ 'ngSanitize'])

.controller('PlaygroundCtrl', [
  '$scope'
  '$routeParams'
  '$location'
  '$resource'
  '$rootScope'
  '$sce'
  '$http'
  'code'
  'login'

($scope, $routeParams, $location, $resource, $rootScope, $sce, $http, code, login)->
  $scope.hide_code = true
  $scope.hide_dataset = true
  $scope.not_logged = true
  $scope.me_is_owner = false

  $scope.code = code
  $scope.srv_login = login

  $scope.is_saving = false

  $scope.$watchCollection "srv_login.me", ()->
    if login.me.id
      $scope.not_logged = false

      if $scope.code.userId == login.me.id or code.userId == undefined
        $scope.me_is_owner = true
      else
        $scope.me_is_owner = false

    else 
      $scope.not_logged = true


  $scope.$watch "code.html", ()=>
    $scope.codeHtml = $sce.trustAsHtml(code.html)

  $scope.$watch "code.css", ()=>
    $scope.codeCss = $sce.trustAsCss(code.css)

  $scope.codeHtml = $sce.trustAsHtml(code.html)
  $scope.codeCss = $sce.trustAsCss(code.css)

  #   $scope.codeHtmlRaw = html

  # $rootScope.$on 'code:js', (e, js)->
  #   $scope.codeJs = js

  # $rootScope.$on 'code:css', (e, css)->
  #   $scope.codeCss = css

  $scope.toggle = (elt)->
    console.log "yolo"
    $scope["hide_"+elt] = if not $scope["hide_"+elt] then true else false

  $scope.render = ()->
    code.compile()

  $scope.load = (viz_id)->
    # console.log "loading viz: #{viz_id}"
    # console.log "http://api.wkpdz.11d.im/visualizations/#{viz_id}"

    $http.get("http://api.wkpdz.11d.im/visualizations/#{viz_id}")
      .success (r)->
        code.load r

  if ($routeParams.vizId)
    $scope.load $routeParams.vizId

  $scope.login = ()->
    login.in()

  $scope.save = ()->
    $scope.is_saving = true

    viz_info =
      userId: login.me.id
      css: code.css
      js: code.js
      html: code.html

    if $routeParams.vizId == "new"
      $http.post("http://api.wkpdz.11d.im/visualizations",viz_info)
        .then (r)->
          $location.path "/playground/#{r.data.id}"
          $scope.is_saving = false
    else
      viz_id = $routeParams.vizId

      $http.put("http://api.wkpdz.11d.im/visualizations/#{viz_id}", viz_info)
        .then (r)->
          $scope.is_saving = false


])