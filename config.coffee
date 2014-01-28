exports.config =
  # See docs at http://brunch.readthedocs.org/en/latest/config.html.
  conventions:
    assets:  /^app\/assets\//
#    ignored: /^(app\/styles\/bootstrap|app\/styles\/overrides|(.*?\/)?[_]\w*)/
  modules:
    definition: false
    wrapper: false
  paths:
    public: '_public'
  files:
    javascripts:
      joinTo:
        'js/app.js': /^app/
        'js/vendor.js': /^(bower_components|vendor)/
      order:
        before: [
          "bower_components"
        ]
    stylesheets:
      joinTo:
        'css/vendor.css': /^(vendor|bower_components)/
        'css/app.css': /^(app)/
      order:
        before: [
          'bower_components/bootstrap/dist/css/bootstrap.css'
          'app/styles/app.less'
        ]

  # minify: true
