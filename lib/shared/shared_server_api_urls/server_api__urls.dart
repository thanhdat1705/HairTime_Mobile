//server local
//const URLSERVER = "http://192.168.1.77:9000";
// const URLSERVER = "http://192.168.43.45:9000";
//const URLSERVER = "http://192.168.43.45:9000";
// const URLSERVER = "http://192.168.137.1:9000";
//server test
//const URLSERVER = "https://places-information-backend.herokuapp.com";
//server main

const URLSERVER = "https://places-information-backend.azurewebsites.net";

const APIUSERAUTHORIZE = URLSERVER + '/api/Accounts/SocialAuthentication';
const APIGETUSERPROFILE = URLSERVER + '/api/Accounts/Profile';
const APIUPDATEUSERPROFILE = URLSERVER + '/api/Accounts/ProfileUpdate';
const APISEARCHFIELD = URLSERVER + '/api/Fields/searching';
const APISEARCHPROVINCE = URLSERVER + '/api/Provinces/searching';
