import React from "react";


export default class Footer extends React.Component {
  render() {
    return <footer className="footer">
      <div className="container">
        <div className="content has-text-centered">
          <p className="title is-4">
            &copy; 2017 <strong>Elixir.run</strong> by <a href="https://github.com/chvanikoff">Chvanikoff</a>
          </p>
          <p className="title is-4">
            Made with <a href="https://elixir-lang.org">Elixir</a> and <a href="https://facebook.github.io/react/">React</a>
          </p>
          <p>
            <a className="icon" href="https://github.com/chvanikoff/elixir.run">
              <i className="fa fa-github"></i>
            </a>
          </p>
        </div>
      </div>
    </footer>;
  }
};

