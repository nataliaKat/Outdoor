<%-- 
    Document   : test
    Created on : 25 Ιουλ 2019, 8:06:27 μμ
    Author     : kat26
--%>

<%@page contentType="text/html" pageEncoding="windows-1253"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1253">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
   <body>
    <h1>Fetch API</h1>
    <div id="output"></div>

    <script>
        const URL = "http://localhost:8080/Outdoor/json";
        fetch(URL).then(handleResponse).then(handleJSON);
        function handleResponse( response ){
            //Get response body, convert to JSON object and return as a promise
            return response.json();
        }

        function handleJSON(json) {
            const output = document.querySelector("#output");
//             output.innerHTML = json.length + " "; 
//             output.innerHTML += json instanceof Array;
//             output.innerHTML = json;
//             output.innerHTML = JSON.stringify(json);
            console.log(json); 
            
//            let cheap = json.filter(product =>
//            product.price < 100);
//            
//            
//            cheap.map(function(entry) {
//                output.innerHTML += `<p>${entry.name} : ${entry.price}$</p>`;
                 output.innerHTML += `img width="100" src = "${entry.imgUrl}"`
//                // output.innerHTML += typeof cheap;
//                
//                // output.innerHTML += `${entry}`.cheap;
//                Object.keys[entry];
//            });


        }
    </script>
        
    </body>
</html>
