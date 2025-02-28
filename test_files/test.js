class ExampleClass {
  constructor(name) {
    this.name = name;
  }

  greet() {
    return `Hello from ${this.name}`;
  }
}

function exampleFunction(param) {
  return `Processing ${param}`;
}

const example = new ExampleClass('Test');
console.log(example.greet());
