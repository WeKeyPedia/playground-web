angular.module('code.service', [])

.factory('code', ($http, $q)->
  service =
    userId: undefined
    html: ""
    js: ""
    css: ""

  service
)