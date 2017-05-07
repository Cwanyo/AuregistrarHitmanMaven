<%-- 
    Document   : index
    Created on : Apr 4, 2017, 8:59:38 PM
    Author     : C.wan_yo
--%>
<style>
    body {
        background-color: #737373;
    }
</style>

<div class="container" style="position: absolute;
     left: 30%;
     top: 35%;
     width: 1100px;
     height: 500px;
     margin-top: -100px; /* half of you height */
     margin-left: -200px; /* half of you width */">

    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-default">
                <div class="panel-heading" style="background-color: #403535;background-color: #4d4d4d;">
                    <h3 class="panel-title" style="color: white;">Please Sign In</h3>
                </div>
                <div class="panel-body">
                    <form role="form">
                        <fieldset>
                            <div class="g-signin2" data-width="300" data-height="50" data-longtitle="true" data-onsuccess="onSignIn" data-theme="dark" data-prompt="select_account"></div>
                            <br>
                            <p>
                                [Authority Account]<br>
                                id : auteacher1111111@gmail.com<br>
                                pass : 1412auteacher<br>

                                [Student Account]<br>
                                id : austudent1111111@gmail.com<br>
                                pass : 1412austudent<br>
                            </p>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

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