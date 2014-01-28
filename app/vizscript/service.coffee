angular.module('code.service', [ "dataset.service" ])

.factory('code', ($http, $q, dataset)->
  service =
    userId: undefined
    html: ""
    js: ""
    css: ""
    data: dataset.data
    is_rendering: false

    loaded: false

    load: (scripts)->
      @loaded = true

      @js = scripts.js
      @css = scripts.css
      @html = scripts.html

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

      if cb
        cb()

  service
)