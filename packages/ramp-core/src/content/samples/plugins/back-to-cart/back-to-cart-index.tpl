<!DOCTYPE html>
<html lang="en">

<head>
        <meta charset="utf-8" />
        <meta content="width=device-width,initial-scale=1" name="viewport" />
        <title>Plugin: Back to cart</title>

        <style>
            body {
                display: flex;
                flex-direction: column;
            }

            .myMap {
                height: 100%;
            }
        </style>

        <% for (var index in htmlWebpackPlugin.files.css) { %>
        <% if (webpackConfig.output.crossOriginLoading) { %>
            <link rel="stylesheet" href="<%= htmlWebpackPlugin.files.css[index] %>" integrity="<%= htmlWebpackPlugin.files.cssIntegrity[index] %>" crossorigin="<%= webpackConfig.output.crossOriginLoading %>"/>
        <% } else { %>
            <link rel="stylesheet" href="<%= htmlWebpackPlugin.files.css[index] %>" />
        <% } %>
    <% } %>
    </head>

<body>

    <div class="myMap"
            id="sample-map"
            is="rv-map"
            class="myMap"

            data-rv-config="config.rcs.[lang].json"
            data-rv-langs='["en-CA", "fr-CA"]'
            data-rv-service-endpoint="http://section917.cloudapp.net:8000/"
            data-rv-keys=""
            data-rv-wait="true"
            rv-plugins="BackToCart" >
         <noscript>
            <p>This interactive map requires JavaScript. To view this content please enable JavaScript in your browser or download a browser that supports it.<p>

            <p>Cette carte interactive nécessite JavaScript. Pour voir ce contenu, s'il vous plaît, activer JavaScript dans votre navigateur ou télécharger un navigateur qui le prend en charge.</p>
        </noscript>
    </div>

    <script src="https://cdn.polyfill.io/v2/polyfill.min.js?features=default,Object.entries,Object.values,Array.prototype.find,Array.prototype.findIndex,Array.prototype.values,Array.prototype.includes,HTMLCanvasElement.prototype.toBlob,String.prototype.repeat,String.prototype.codePointAt,String.fromCodePoint,NodeList.prototype.@@iterator,Promise,Promise.prototype.finally"></script>

    <% for (var index in htmlWebpackPlugin.files.js) { %>
        <% if (webpackConfig.output.crossOriginLoading) { %>
            <script src="<%= htmlWebpackPlugin.files.js[index] %>" integrity="<%= htmlWebpackPlugin.files.jsIntegrity[index] %>" crossorigin="<%= webpackConfig.output.crossOriginLoading %>"></script>
        <% } else { %>
            <script src="<%= htmlWebpackPlugin.files.js[index] %>"></script>
        <% } %>
    <% } %>

    <script>
            const baseUrl = window.location.href.split('?')[0] + '?keys={RV_LAYER_LIST}';

            /* // Example of programmatically setting the catalogue URL
            RZ.mapAdded.subscribe(function(mapi) {
                backToCart.setCatalogueUrl('sample-map', baseUrl);
            });*/

            function queryStringToJSON(q) {
                var pairs = q.search.slice(1).split('&');
                var result = {};
                pairs.forEach(function(pair) {
                    pair = pair.split('=');
                    result[pair[0]] = decodeURIComponent(pair[1] || '');
                });
                return JSON.parse(JSON.stringify(result));
            }
            // grab & process the url
            var queryStr = queryStringToJSON(document.location);
            var keys = queryStr.keys;
            if (keys) {
                // turn keys into an array, pass them to the map
                var keysArr = keys.split(',');
                RV.getMap('sample-map').restoreSession(keysArr);
            } else {
                var bookmark = queryStr.rv;
                RV.getMap('sample-map').initialBookmark(bookmark);
            }
        </script>

</body>

</html>
