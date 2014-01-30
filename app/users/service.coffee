angular.module('users.service', [ 'dataset.service'])

.factory('users', ($rootScope, $http, dataset)->
  service =
    scope: $rootScope.$new()
    users: []

    init: ()->
      @scope.data = dataset.data

      @scope.$watchCollection 'data', ()=>
        @users.length = 0

        users = _(@scope.data).reduce (m, data)->
          if m[data.userId]
            m[data.userId].pages_readed = m[data.userId].pages_readed + 1
            m[data.userId].last_read= data.time
          else
            user=
              id: data.userId
              pages_readed: 1
              last_read: data.time

            m[data.userId]=user

          m
        , {}

        params =
          params:
            key: "AIzaSyDhfR1q7sI1xTjTSUJs7PDWoxi7oQVRIX0"

        # console.log users

        for u in _(users).toArray()
          $http.get("https://www.googleapis.com/plus/v1/people/#{u.id}", params)
            .success (data)=>
              user =
                userId: data.id
                pages_readed: users[data.id].pages_readed
                last_read: users[data.id].last_read
                name: data.displayName
                profile_pic: data.image.url

              @users.push user

    get: ()->
      # lol

  service.init()

  service
)