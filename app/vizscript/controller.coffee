angular.module('code.forms', [ 'code.service' ])

.controller('CodeFormsCtrl', [
  '$scope'
  '$location'
  '$resource'
  '$rootScope'
  'dataset'
  'code'

($scope, $location, $resource, $rootScope, dataset, code) ->

  $scope.data = dataset.data

  $scope.code = code

  $scope.code.css = """
    /* your CSS code goes there */
  """
  
  $scope.code.js = """
    // your js code goes there

    console.log("dataset", data)
  """
  
  $scope.code.html = """
    <!-- your html code goes there -->
    <canvas id="mycanvas"></canvas>
  """

  console.log "code is ready"
  $scope.$emit "code:ready"

  @compile = ()->
    console.log "trying to compile !"


    chroot = ()=>
      window = null
      data = $scope.data

      try
        eval $scope.code.js
        $("#editor-js").css("border-color", "green");
      catch error
        $("#editor-js").css("border-color", "red");

        console.log "error", error

    chroot()

  $scope.$on "code:compile", ()=>
    @compile()

  $scope.$watchCollection "data", ()=>
    @compile()

  $scope.$on "load.css", (e, css)=>
    $scope.code.css = css

  $scope.$on "load.js", (e, js)=>
    $scope.code.js = js

  $scope.$on "load.html", (e, html)=>
    $scope.code.html = html

  $scope.$watch "code.css", ()=>
    $rootScope.$emit("code:css", $scope.code.css)
    @compile()

  $scope.$watch "code.js", ()=>
    $rootScope.$emit("code:js", $scope.code.js)
    @compile()

  $scope.$watch "code.html", ()=>
    $rootScope.$emit("code:html", $scope.code.html)
    @compile()

  

  dataset.get()
])