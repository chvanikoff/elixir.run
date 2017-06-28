import React from "react";
import { connect } from "react-redux";
import { Link } from "react-router-dom";


class Login extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      password: ""
    };
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  render() {
    return <section className="login is-fullheight is-dark is-bold">
      <div className="hero-body">
        <div className="container">
          <div className="columns is-vcentered">
            <div className="column is-4 is-offset-4">
              <div className="box">
                <p className="control">
                  <input className="input" type="password" placeholder="password" onChange={this.handleChange} />
                </p>
                <hr />
                <div className="field is-grouped">
                  <p className="control">
                    <button className="button is-primary" onClick={this.handleSubmit}>Login</button>
                  </p>
                  <p className="control">
                    <Link className="button is-default" to="/">Cancel</Link>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>;
  }

  handleChange(event) {
    this.setState({ password: event.target.value });
  }

  handleSubmit(event) {
    event.preventDefault();

    console.log(this.state.password);
  }
};

const mapStateToProps = (state) => ({
});

export default connect(mapStateToProps)(Login);
