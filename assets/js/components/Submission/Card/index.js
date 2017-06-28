import React from "react";
import { connect } from "react-redux";

export default class SubmissionCard extends React.Component {
  render() {
    return <div className="app card has-text-centered" onClick={this.props.onClick}>
      <div className="card-content description">
        <div className="title is-4">
          You are author of a great app written with Elixir? Or you know one? That's awesome! As long as
          the app has source code publicly available, don't hesitate to submit it and it will
          appear on the list in the soonest time possible!
        </div>
      </div>
      <div className="card-footer">
        <div className="card-footer-item">
          <image src="/images/add.png" />
        </div>
      </div>
    </div>;
  }
};

