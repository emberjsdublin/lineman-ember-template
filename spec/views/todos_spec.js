describe('Todos', function() {
  beforeEach(function() {
    this.controller = App.TodosController.create();
    Em.run.sync();
  });

  afterEach(function() {
    this.controller.destroy();
  });

  it("shows the list of todos", function() {
    expect($('.todos').length).toBe(1);
  });
});
