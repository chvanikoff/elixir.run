import React from "react";
import { connect } from "react-redux";

import App from "components/App";


class Main extends React.Component {
  render() {
    const apps = this.props.apps;
    // There's no guarantee "apps" object contain all the apps sorted so we sort
    // it by id, apps with bigger id (newest) comes first
    const sorted_apps_ids = Object.keys(apps).sort((a, b) => {
      return b - a;
    });
    return <div className="container">
      <div className="columns is-multiline">
        {sorted_apps_ids.map((app_id) => {
          return <App key={`app_${app_id}`} app={apps[app_id]} />
        })}
      </div>
    </div>;
  }
};

const mapStateToProps = (state) => ({
  apps: state.apps.list
});

export default connect(mapStateToProps)(Main);

