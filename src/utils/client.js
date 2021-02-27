var axios = require("axios");

const API_URL = "http://service.covid-face.com";

var axiosInstance = axios.create({
  baseURL: API_URL,
});

module.exports = axiosInstance;
