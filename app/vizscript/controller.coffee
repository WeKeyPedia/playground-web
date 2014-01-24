angular.module('code.forms', [])

.controller('CodeFormsCtrl', [
  '$scope'
  '$location'
  '$resource'
  '$rootScope'
  'dataset'

($scope, $location, $resource, $rootScope, dataset) ->

  $scope.data = dataset.data

  $scope.code =
    css: """
      /* your CSS code goes there */
      """
    js: """
      // your js code goes there

      console.log("dataset", data)

      dew
      """
    html: """
      <!-- your html code goes there -->

      <canvas></canvas>
      """

  @compile = ()->

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

  $scope.$watchCollection "data", ()=>
    @compile()

  $scope.$watch "code.js", ()=>
    @compile()

  dataset.get()
])