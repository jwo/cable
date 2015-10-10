var Quote = React.createClass({

  getInitialState(){
    return {
      quote: this.props.quote
    }
  },

  render() {
    return <div>
      <blockquote>{this.state.quote.body}</blockquote>
      <cite>this.state.quote.user.username - {this.state.quote.id}</cite>
    </div>;
  }
});
