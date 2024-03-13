function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    
    apiURL: 'https://conduit-api.bondaracademy.com/api'
  }
  if (env == 'dev') {
    config.username = 'afaraaz@gmail.com'
    config.userpassword = 'test123'

  } 
  
  if (env == 'qa') {

    config.username = 'kar1@test.com'
    config.userpassword = 'Karate123'
    // customize
  }

  var accessToken = karate.callSingle('classpath:helpers/CreateToken.feature', config).authToken
  karate.configure('headers',{Authorization: 'Token ' + accessToken })

  return config;
}