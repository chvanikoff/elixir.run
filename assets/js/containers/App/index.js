import React from "react";

import Header from "components/Header";
import Footer from "components/Footer";


export default class AppContainer extends React.Component {
  render() {
    return <div className="react-app">
      <Header />
      <div className="main-container">
        {this.props.children}
      </div>
      <Footer />
    </div>;
  }
};
