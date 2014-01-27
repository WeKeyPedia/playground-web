exports.config =
  # See docs at http://brunch.readthedocs.org/en/latest/config.html.
  conventions:
    assets:  /^app\/assets\//
    ignored: /^(bower_components\/bootstrap-less(-themes)?|app\/styles\/overrides|(.*?\/)?[_]\w*)/
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
        # 'mode-javascript.js': "bower_components/ace-builds/src-min-no-conflict/mode-javascript.js"
        # 'mode-css.js': /^bower_components\/ace-builds\/mode-css/
        # 'mode-html.js': /^bower_components\/ace-builds\/mode-html/
    stylesheets:
      joinTo:
        'css/app.css': /^(app|vendor|bower_components)/
      order:
        before: [
          'app/styles/app.less'
        ]
        after: [
          'app/dataset/dataset.less'
        ]

    # templates:
    #   joinTo:
    #     'js/dontUseMe' : /^app/ # dirty hack for Jade compiling.

  # plugins:
  #   jade:
  #     pretty: yes # Adds pretty-indentation whitespaces to output (false by default)
  #   jade_angular:
  #     modules_folder: 'partials'
  #     locals: {}

  # Enable or disable minifying of result js / css files.
  # minify: true
