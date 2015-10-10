var QuoteList = React.createClass({

  getInitialState(){
    return {
      quotes: this.props.quotes
    }
  },

  componentDidMount(){
    this.subscribeToCable();
  },

  subscribeToCable(){
    var component = this;
    App.cableSubscription = App.cable.subscriptions.create("QuoteNotificationChannel", {
      received(data) {
        var currentQuotes = component.state.quotes;
        currentQuotes.push(data)
        component.setState({quotes: currentQuotes})
      },
    });
  },

  render() {
    return <div>
      <h1>Quotes: {this.state.quotes.length}</h1>

      {this.state.quotes.sort(function(a, b){return b.id - a.id}).map(function(quote){
          return <Quote quote={quote} key={quote.id}></Quote>
        })
      }

    </div>;
  }
});
