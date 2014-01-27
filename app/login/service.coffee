angular.module('login.service', [])

.factory('login', ($http, $cookieStore)->
  service =
    me: {}
    
    signed_on: false
    oauth_token: ""

    init: ()->
      if $cookieStore.get("me")
        _(@me).extend $cookieStore.get("me")
        @oauth_token = $cookieStore.get("oauth_token")
        @oauth_token.signed_on = true

    in: ()->
      # console.log "log me in mothafucka !"

      additionalParams =
        callback: (result)=>
          if (result['status']['signed_in'])

            @oauth_token = result['access_token']
            @signed_on = true

            userId = "me"

            params =
              params:
                access_token: result['access_token']

            $http.get("https://www.googleapis.com/plus/v1/people/#{userId}", params)
              .success (data)=>
                _(@me).extend data

                $cookieStore.put "me", data
                $cookieStore.put "oauth_token", @oauth_token

          else
            console.log "ko"

      gapi.auth.signIn(additionalParams)

  service.init()

  service
)