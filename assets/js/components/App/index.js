import React from "react";
import { connect } from "react-redux";

export default class App extends React.Component {
  render() {
    const app = this.props.app;
    const image_url = app.image_url === null
      ? "/images/icon.png"
      : app.image_url;
    return <div className="column is-3 app-column">
      <div className="app card has-text-centered">
        <div className="card-content">
          <div className="title is-4">
            {app.name}
          </div>
        </div>
        <div className="card-image">
          <figure className="image">
            <img src={image_url} />
          </figure>
        </div>
        <div className="card-content description">
          <div className="content">
            {app.description}
          </div>
        </div>
        <div className="card-footer">
          <a target="_blank" className="card-footer-item" href={app.demo_url}>
            <i className="icon fa fa-external-link" aria-hidden="true"></i>
            Demo
          </a>
          <a target="_blank" className="card-footer-item" href={app.source_url}>
            <i className="icon fa fa-github"></i>
            Source
          </a>
        </div>
      </div>
    </div>;
  }
};

