<%-- 
    Document   : index
    Created on : Apr 4, 2017, 8:59:38 PM
    Author     : C.wan_yo
--%>

<div class="g-signin2" data-width="300" data-height="50" data-longtitle="true" data-onsuccess="onSignIn" data-theme="dark" data-prompt="select_account"></div>
<br>
<img src="${userPicture}" class="img-circle"> 
<p>
    [Authority Account]<br>
    id : auteacher1111111@gmail.com<br>
    pass : 1412auteacher<br>
    
    [Student Account]<br>
    id : austudent1111111@gmail.com<br>
    pass : 1412austudent<br>
</p>
<script>
    //google callback. This function will redirect to our login servlet
    function onSignIn(googleUser) {
        var profile = googleUser.getBasicProfile();
        console.log('ID: ' + profile.getId());
        console.log('Name: ' + profile.getName());
        console.log('Image URL: ' + profile.getImageUrl());
        console.log('Email: ' + profile.getEmail());
        console.log('id_token: ' + googleUser.getAuthResponse().id_token);

        var redirectUrl = 'Login';

        //using jquery to post data dynamically
        var form = $('<form action="' + redirectUrl + '" method="post">' +
                '<input type="hidden" name="id_token" value="' +
                googleUser.getAuthResponse().id_token + '" />' +
                '</form>');
        $('body').append(form);
        form.submit();
    }

</script>