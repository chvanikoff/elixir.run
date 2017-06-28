import React from "react";
import { Route, Switch, IndexRoute } from "react-router";

import AppContainer from "containers/App";
import Main from "components/Main";
import Login from "components/Login";


export default (<AppContainer>
  <Switch>
    <Route exact path="/" component={Main} />
    <Route exact path="/login" component={Login} />
  </Switch>
</AppContainer>);
