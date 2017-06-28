import { combineReducers } from "redux";
import { routerReducer } from "react-router-redux";

import apps from "reducers/apps";
import ws from "reducers/ws";


export default combineReducers({
  routing: routerReducer,
  apps,
  ws
});
