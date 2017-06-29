import { combineReducers } from "redux";
import { routerReducer } from "react-router-redux";

import submission from "reducers/submission";
import auth from "reducers/auth";
import apps from "reducers/apps";
import ws from "reducers/ws";


export default combineReducers({
  routing: routerReducer,
  submission,
  auth,
  apps,
  ws
});
