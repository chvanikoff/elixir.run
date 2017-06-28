const initialState = {
  processing: false,
  success: false,
  errors: []
};

export default function reducer(state = initialState, action = {}) {
  switch (action.type) {
    case "SUBMISSION_PROCESSING":
      return {
        ...state,
        processing: true,
        success: false,
        errors: []
      };
    case "SUBMISSION_OK":
      return {
        ...state,
        processing: false,
        success: true,
        errors: []
      };
    case "SUBMISSION_ERROR":
      return {
        ...state,
        processing: false,
        success: false,
        errors: action.errors
      }
    default:
      return state;
  }
};

