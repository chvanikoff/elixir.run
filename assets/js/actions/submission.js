const actions = {
  submit: (params) => {
    return (dispatch, getState) => {
      const { ws } = getState();
      dispatch({ type: "SUBMISSION_PROCESSING" });
      ws.channels.apps
        .push("submit", params)
        .receive("ok", () => {
          dispatch({ type: "SUBMISSION_OK" });
        })
        .receive("error", (response) => {
          dispatch({ type: "SUBMISSION_ERROR", errors: response.errors });
        });
    }
  }
};

export default actions;
