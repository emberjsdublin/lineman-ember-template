describe('a single todo', function() {
  var todo;
  beforeEach(function() {
    todo = App.Todo.createRecord({name: 'first todo', done: false});
  });

  it('should have a name and a done flag', function() {
    expect(todo.get('name')).toBe('first todo');
    expect(todo.get('done')).not.toBeTruthy();
  });
});
