import * as actionTypes from './actionTypes';

export const authStart = () => {
  return {
    type: actionTypes.AUTH_START
  }
}

export const authSuccess = (data) => {
  return {
    type: actionTypes.AUTH_SUCCESS,
    authData: data
  }
}

export const authFails = (error) => {
  return {
    type: actionTypes.AUTH_FAIL,
    error: error,
  }
}

// Async

export const auth = (email, password) =>{
  return dispatch => {
    dispatch(authStart());
    fetch()
  }
}