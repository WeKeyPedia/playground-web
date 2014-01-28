angular.module('code.service', [ "dataset.service" ])

.factory('code', ($http, $q, dataset)->
  service =
    userId: undefined
    html: ""
    js: ""
    css: ""
    data: dataset.data
    is_rendering: false

    compile: (cb)->
      @is_rendering = true

      chroot = ()=>
        window = null
        data = @data

        try
          eval @js
        catch error
          console.log "error", error

      chroot()
      @is_rendering = false

  service
)