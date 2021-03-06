// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require handlebars
//= require ember
//= require ember-data
//= require ember-validations-1.0.0.beta.1
//= require_self
//= require app
// require ember-data-factory-1.0.0.min.js
// require ember-easyForm-1.0.0.beta.1

Ember.FEATURES['query-params'] = true;

App = Ember.Application.create({
  ready: function() {
    Ember.run.next(this, function(){
      $(document).foundation();
    });
  }
});

App.ApplicationAdapter = DS.ActiveModelAdapter.extend({
  namespace: 'api'
})
App.ApplicationSerializer = DS.ActiveModelSerializer.extend()
