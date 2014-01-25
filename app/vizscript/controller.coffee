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

  @compile = ()->
    console.log "trying to compile !"

    $rootScope.$emit("code:html", $scope.code.html)

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

  $rootScope.$on "code:compile",
    @compile()

  $scope.$watchCollection "data", ()=>
    @compile()

  $scope.$watch "code.js", ()=>
    @compile()

  $scope.$watch "code.html", ()=>
    @compile()

  dataset.get()
])