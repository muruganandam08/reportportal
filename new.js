const express = require('express');
const _ = require('lodash');

const app = express();
const port = 3000;

// Middleware with a potential bug: Missing next() call
app.use((req, res, next) => {
  console.log('Request received');
  // Missing next() call here, causing the request to hang
});

// Route handler with a bug: Using deprecated method
app.get('/', (req, res) => {
  const response = _.join(['Hello', 'World'], ' ');
  res.send(response);
});

// Function with an unused variable
function unusedVariableExample() {
  var unusedVar = 42; // This variable is declared but never used
}

// Potential security issue: Hardcoded sensitive data
const secretKey = 'mySuperSecretKey'; // This should not be hardcoded

// Another potential security issue: Using eval()
app.get('/execute', (req, res) => {
  const code = req.query.code;
  eval(code); // Using eval() is dangerous and should be avoided
  res.send('Code executed');
});

// Listening on the specified port
app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});

// Example of a function with a bug: Incorrect logic
function faultyLogic(a, b) {
  // This should return a - b, but it returns a + b
  return a + b;
}

// Calling the faulty function
console.log(`Faulty logic result: ${faultyLogic(5, 3)}`); // This will print 8 instead of 2

module.exports = app;
