import { push } from "react-router-redux";

import { httpGet } from "utils/http";
import wsActions from "actions/ws";


const actions = {
  login: (params) => {
    return (dispatch, getState) => {
      const { ws } = getState();
      dispatch({ type: "AUTH_LOGIN_PROCESSING" });
      ws.channels.auth
        .push("login", params)
        .receive("ok", ({ token }) => {
          dispatch({ type: "AUTH_LOGIN_OK", token: token });
          dispatch(wsActions.init());
          httpGet("/api/session/set", token).then(() => {
            dispatch(push("/"));
          });
        })
        .receive("error", (response) => {
          dispatch({ type: "AUTH_LOGIN_ERROR" });
        });
    }
  },
};

export default actions;
