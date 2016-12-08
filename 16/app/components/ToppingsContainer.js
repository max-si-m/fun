var React = require('react');

var ToppingsContainer = React.createClass({
  getInitialState: function() {
    return {
      toppingsList: [
        { name: 'Pepperoni', price: 0.50 },
        { name: 'Italian Sausage', price: 0.60 },
        { name: 'Ham', price: 0.70 },
        { name: 'Bacon', price: 0.70 },
        { name: 'Extra Cheese', price: 1.50 },
        { name: 'Stuffed Crust', price: 1.50 }
      ],
      totalChecked: 0,
    }
  },

  onChildChanged: function(state, value) {
    var newTotal = this.state.totalChecked + (state ? value : -value);
    this.setState({ totalChecked: newTotal });
  },

  render: function() {
    var item_list = this.state.toppingsList.map((item, i) => {
      return <ToppingItem
                price={item.price}
                name={item.name}
                id={i}
                key={i}
                callbackParent={this.onChildChanged}/>
    });

    return (
      <div className='col-md-8 col-md-offset-2'>
        <div className='react_item_container'>
          <ul>
            {item_list}
          </ul>
        </div>

        <p className="totalToppings">
          <strong>Total toppings:
            <span className="totalToppingsValue">${this.state.totalChecked}</span>
          </strong>
        </p>
      </div>
    );
  }
});

var ToppingItem = React.createClass({
  onChanged: function(event) {
    var value = parseFloat(event.target.value)
    var state = event.target.checked

    this.props.callbackParent(state, value);
  },

  render: function() {
    return (
      <div>
        <div className='col-md-2'>
          <input type="checkbox" onChange={this.onChanged} value={this.props.price} id={'ch' + this.props.id} />
        </div>
        <div className='col-md-4'>
          <label>{this.props.name} +${this.props.price}</label>
        </div>
      </div>
    );
  }
});

module.exports = ToppingsContainer;
