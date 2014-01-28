angular.module('code.forms', [ 'code.service', 'ui.ace' ])

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

  $scope.code_visible = "javascript"

  if $scope.code.loaded == false
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

  $scope.$on "code:compile", ()=>
    code.compile()

  $scope.$watchCollection "data", ()=>
    code.compile()

  $scope.$watch "code.css", ()=>
    code.compile()

  $scope.$watch "code.js", ()=>
    code.compile()

  $scope.$watch "code.html", ()=>
    code.compile()

  $scope.mode = (mode)->
    $scope.code_visible = mode  

  dataset.get()
])