import React from "react";
import { connect } from "react-redux";


class Main extends React.Component {
  render() {
    return <div className="container">
      <div className="columns is-multiline">
      </div>
    </div>;
  }
};

const mapStateToProps = (state) => ({
});

export default connect(mapStateToProps)(Main);

