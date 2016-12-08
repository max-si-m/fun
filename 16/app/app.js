var React = require('react');
var ReactDOM = require('react-dom');

var ToppingsContainer = require('./components/ToppingsContainer');

var App = React.createClass({
  render: function () {
    return (
      <div>
        <Header />

        <ToppingsContainer />
      </div>
    );
  }
});

var Header = React.createClass({
  render: function () {
    return (
      <div className='col-md-8 col-md-offset-2'>
        <h1>Add toppings</h1>
      </div>
    );
  }
});

ReactDOM.render(<App />, document.getElementById('app'))
