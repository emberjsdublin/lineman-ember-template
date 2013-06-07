###
Exports an object that defines
 all of the configuration needed by the projects'
 depended-on grunt tasks.

You can find the parent object in: node_modules/lineman/config/application.js
###

_ = require("underscore")
config = require(process.env['LINEMAN_MAIN']).config

config.application.appTasks.common = _(config.application.appTasks.common).reject (n) -> n == "handlebars"

module.exports = config.extend 'application',
  # Override application configuration here. Common examples follow in the comments.

  #  API Proxying
  #
  #  During development, you'll likely want to make XHR (AJAX) requests to an API on the same
  #  port as your lineman development server. By enabling the API proxy and setting the port, all
  #  requests for paths that don't match a static asset in ./generated will be forwarded to
  #  whatever service might be running on the specified port.
  #
  #  server: {
  #    apiProxy: {
  #      enabled: true,
  #      host: 'localhost',
  #      port: 3000
  #    }
  #  }

  prependTasks:
    common: ["ember_handlebars"]

  loadNpmTasks: ['grunt-ember-handlebars']

  ember_handlebars:
    options:
      processName: (name) -> name.match(/app\/templates\/([^.]*)/)[1]
    compile:
      files:
        "generated/template/handlebars.js": "<%= files.template.handlebars %>"

  watch:
    handlebars:
      tasks: ["ember_handlebars:compile"]
