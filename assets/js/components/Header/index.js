import React from "react";


export default class Header extends React.Component {
  render() {
    return <div className="hero is-custom is-bold">
      <div className="hero-body has-text-centered">
        <div className="container">
          <image src="/images/logo.png" className="logo" />
          <p className="title is-1">Collection of open source applications powered by Elixir</p>
        </div>
      </div>
    </div>;
  }
};

