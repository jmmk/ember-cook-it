#= require application
#= require_tree .
#= require_self

document.write '<div id="ember-testing-container"><div id="ember-testing"></div></div>'
document.write '<style>#ember-testing-container { position: absolute; background: white; bottom: 0; right: 0; width: 640px; height: 384px; overflow: auto; z-index: 9999; border: 1px solid #ccc; } #ember-testing { zoom: 50%; }</style>'

App.rootElement = '#ember-testing'
App.ApplicationAdapter = DS.FixtureAdapter.extend
  queryFixtures: (records, query, type) ->
    return records.filter (record) ->
      for key in query
        if !query.hasOwnProperty(key)
          continue
        value = query[key]
        if record[key] != value
          return false
      return true

App.setupForTesting()
App.injectTestHelpers()

(exports ? this).exists = (selector) ->
  return !!find(selector).length

(exports ? this).hasContent = (content) ->
  return !!find('*:contains(' + content + ')').length
