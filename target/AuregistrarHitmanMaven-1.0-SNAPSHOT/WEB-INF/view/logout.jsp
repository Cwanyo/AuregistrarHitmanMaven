<%-- 
    Document   : logout
    Created on : Apr 11, 2017, 9:01:58 PM
    Author     : C.wan_yo
--%>
<h1>Bye</h1>
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

