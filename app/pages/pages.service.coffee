angular.module('pages.service', [ 'dataset.service'])

.factory('pages', ($http, dataset)->
  service=
    pages: []

    init: ()->
      dataset.get "", ()=>
        coll = _(dataset.data).reduce (m, step)->
          if m[step.url]
            m[step.url].hits = m[step.url].hits + 1
            m[step.url].last_view = step.time
            
            m[step.url].readers.push step.userId

          else
            m[step.url] =
              url: step.url
              hits: 1
              readers: [ step.userId ]
              last_view: step.time

          m
        , {}

        for p in _(coll).toArray()
          @pages.push p

        for page in @pages
          page.readers_number = _(page.readers).unique().length


  service.init()

  service
)