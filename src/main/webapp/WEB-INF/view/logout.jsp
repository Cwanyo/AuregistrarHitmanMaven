<%-- 
    Document   : logout
    Created on : Apr 11, 2017, 9:01:58 PM
    Author     : C.wan_yo
--%>

<style>
    body {background-color: #737373;}
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
                <div class="panel-body">
                    <h1 class="text-center">BYE</h1>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    function onLoad() {
        gapi.load('auth2', function () {
            gapi.auth2.init().then(() => {
                console.log('init.');
                var auth2 = gapi.auth2.getAuthInstance();
                auth2.signOut().then(function () {
                    console.log('User signed out.');
                    window.location.replace("index.jsp");
                });
            });
        });
    }

</script>

