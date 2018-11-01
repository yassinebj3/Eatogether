<!DOCTYPE html>
<html>
<head>
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
  width: 500px;
  padding: 20% 0 0;
  margin: auto;
}
.form {
  position: relative;
  float: right ;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #4CAF50;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #43A047;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}
body {
 background-image: url("img.jpg"); /* fallback for old browsers */
  background-size: cover ;
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;      
}

/*#profile, #logout { display:none; }*/

</style>
<body>

<!--<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/fr_FR/sdk.js#xfbml=1&version=v3.1&appId=717842305245487&autoLogAppEvents=1';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>-->

<script>

 
  function statusChangeCallback(response) {
  
    if (response.status === 'connected') {
    	console.log('Logged in and authenticated');
   
    //	 window.location.href="Connexion?acces_token="+ response.authResponse.accessToken;
    
    //	setElements(true);
  
    } else {
    	console.log('NOT Logged');
    //	setElements(false);
    //	FB.login();
    	
   //   document.getElementById('status').innerHTML = 'Please log ' +
    //    'into this app.';
    }
    
  }
  
/*  function setElements(isLoggedIn){
	  
	  if(isLoggedIn){
          document.getElementById('fb_btn').style.display = 'none';
          document.getElementById('profile').style.display = 'block';
          document.getElementById('logout').style.display = 'block';
         
        } else {
          document.getElementById('fb_btn').style.display = 'block';
          document.getElementById('profile').style.display = 'none';
       document.getElementById('logout').style.display = 'none';
         
        }
	  
  }*/
  
  function test(){	
	  FB.getLoginStatus(function(response) {
	     
		  if (response.status === 'connected') {
			  window.location.href="Connexion?acces_token="+ response.authResponse.accessToken;}
		  
	    });
	  

  }

 
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
    FB.init({
      appId      : '717842305245487',
      cookie     : true,    
      xfbml      : true, 
      version    : 'v3.1' 
    });

    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });

  };

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
  
  
  function logout(){
	  FB.logout();
	/*  FB.logout( function(response){
		  setElements(false);
	  });*/
  }

 
/*  function testAPI() {
   
    FB.api('/me?fields=id,name,email,birthday,gender', function(response) {
     if(response && !response.error){
    	 
    	 alert("C BONNNNN");
     }
   
     
     
    });
  }*/
</script>


<!--   <div  class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="true"></div> 
-->

<div id="profile">

    <div  class="fb-login-button" scope="public_profile,email,user_birthday,user_gender" data-onlogin="test();" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="true"></div> 

</div>

<!-- 
<a id="logout" href="#" onclick="logout();" > Deconnexion </a> 

 <fb:login-button 
  id="fb_btn"
  scope="public_profile,email,user_birthday,user_gender"
  onlogin="checkLoginState();">
</fb:login-button> 
 -->

<div class="login-page">
  <div class="form">
    <form class="login-form" method="post" action="Connexion" id="cnx">
      <input type="text" id="pseudo" name="pseudo" placeholder="E-mail" required="true"/>
      <input type="password" id="password" name="password" placeholder="Mot de Passe" required="true"/>
      <button>login</button>
      <p class="message">Not registered? <a href="inscription.jsp">Create an account</a></p>
    </form>
  </div>
</div>
</body>
</html>