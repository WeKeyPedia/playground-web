angular.module('code.service', [])

.factory('code', ($http, $q)->
  service =
    html: ""
    js: ""
    css: ""

  service
)