App.TodosRoute = Ember.Route.extend({
  setupController: function (controller) {
    controller.set('content', App.Todo.find());
  }
});
