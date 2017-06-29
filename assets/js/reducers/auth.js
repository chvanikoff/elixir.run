const initialState = {
  token: null,
  login: {
    error: false,
    processing: false
  }
};

export default function reducer(state = initialState, action = {}) {
  switch (action.type) {
    case "AUTH_LOGIN":
      return {
        ...state,
        login: {
          ...state.login,
          error: false,
          processing: true
        }
      };
    case "AUTH_LOGIN_OK":
      return {
        ...state,
        login: {
          ...state.login,
          error: false,
          processing: false
        },
        token: action.token
      };
    case "AUTH_LOGIN_ERROR":
      return {
        ...state,
        login: {
          ...state.login,
          error: true,
          processing: false
        }
      }
    case "AUTH_LOGOUT":
      return initialState;
    default:
      return state;
  }
};
