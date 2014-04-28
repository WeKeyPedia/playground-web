angular.module('dataset.service', [])

.factory('dataset', ($http, $q)->
  service =
    data: []
    pages: []
    days: {}
    loaded: false

    get: (query, cb)->
      @loaded = true

      console.log "yo ! service !"

      if(query is not undefined or query != "")
        query = "?#{query}"
      else
        query = ""

      $http.get("http://api.wekeypedia.net/visits#{query}")
        .success (data)=>
          @data.length = 0

          for d in data
            u = d.page

            t = u
            t = t.split "/"
            t = t[t.length - 1]
            t = t.replace /_/g, " "
            t = decodeURIComponent t

            d.title = t
            
            d.url = d.page
            d.userId = d.user

            @data.push d

          if cb then cb()

    group_by_day: ()->
      groups = _(@data).groupBy (d)->
        dt = new Date d.time
        comparator = " "+dt.getFullYear() + dt.getMonth() +  dt.getDate()
        comparator

      # console.log groups

      _(groups).each (value, key, list)=>
        @days[key] = value


    compute: ()->
      @pages.length = 0

      res = _(@data).unique(false, (d)->
        return d.url
      )

      for p in res
        @pages.push p

      # console.log @pages.length

    message: "coucou"

  service
)