angular.module('pages.service', [ 'dataset.service'])

.factory('pages', ($http, dataset)->
  service=
    pages: []

    init: ()->
      dataset.get "", ()=>
        coll = _(dataset.data).unique (step)->
          step.url

        for p in coll
          page =
            url: p.url

          @pages.push page

  service.init()

  service
)