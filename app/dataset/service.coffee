angular.module('dataset.service', [])

.factory('dataset', ($http, $q)->
  service =
    data: []
    pages: []
    days: {}

    get: (query, cb)->

      console.log "yo ! service !"

      if(query is not undefined or query != "")
        query = "?#{query}"
      else
        query = ""

      $http.get("http://api.wkpdz.11d.im/steps#{query}")
        .success (data)=>
          for d in data
            u = d.url

            t = u
            t = t.split "/"
            t = t[t.length - 1]
            t = t.replace /_/g, " "
            t = decodeURIComponent t

            d.title = t

            @data.push d

          if cb then cb()

    group_by_day: ()->
      groups = _(@data).groupBy (d)->
        dt = new Date d.time
        comparator = " "+dt.getFullYear() + dt.getMonth() +  dt.getDate()
        comparator

      console.log groups

      _(groups).each (value, key, list)=>
        @days[key] = value


    compute: ()->
      @pages.length = 0

      res = _(@data).unique(false, (d)->
        return d.url
      )

      for p in res
        @pages.push p

      console.log @pages.length

    message: "coucou"

  service
)