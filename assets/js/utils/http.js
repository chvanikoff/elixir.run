import fetch from "isomorphic-fetch";
import { polyfill } from "es6-promise";


const defaultHeaders = {
  "Accept": "application/json",
  "Content-Type": "application/json",
};

function buildHeaders(token) {
  return {
    ...defaultHeaders,
    token
  };
}

export function httpGet(url, token) {
  return fetch(url, {
    headers: buildHeaders(token),
    credentials: 'same-origin'
  })
  .then(checkStatus)
  .then(parseJSON);
}

export function httpPost(url, data, token) {
  const body = JSON.stringify(data);

  return fetch(url, {
    method: 'post',
    headers: buildHeaders(token),
    body: body,
    credentials: 'same-origin'
  })
  .then(checkStatus)
  .then(parseJSON);
}

export function checkStatus(response) {
  if (response.status >= 200 && response.status < 300) {
    return response;
  } else {
    var error = new Error(response.statusText);
    error.response = response;
    throw error;
  }
}

export function parseJSON(response) {
  return response.json();
}

