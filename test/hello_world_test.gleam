import gleam/should

pub fn syntax_test() {
  // NOTE about list destructuring
  let [x] = [5]
  should.equal(x, 5)
}
