angular.module('page.service', [ 'dataset.service'])

.factory('page', ($http, dataset)->
  service =
    title: ""
    url: ""

    stats:
      readers: 0

    recommandations: {}
    alternatives: {}

    init: ()->
      # dataset.get { url: @url }

    get: (url)->
      @url = url

      u = url

      t = u
      t = t.split "/"
      t = t[t.length - 1]
      t = t.replace /_/g, " "
      t = decodeURIComponent t

      @title = t


  service.init()

  service
)