<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width,initial-scale=1" name="viewport">
        <title>title</title>

        <style>

            _body:after {
                position: fixed;
                content: "";
                width: 50%;
                height: 50%;
                top: 0;
                right: 0;
                border: 1px solid darkorange;
            }

            .myMap {
                border: 1px solid black;
                margin: 50px;
                position: relative;
            }

            ._myMap:after {
                position: absolute;
                content: "";
                width: 50%;
                height: 50%;
                top: 0;
                right: 0;
                border: 1px solid darkgreen;
            }

            .row {
                display: flex;
                height: 650px;
            }

            .one {
                height: 700px;
            }

            .two {
                flex: 2;

            }

            .three {
                flex: 3;
            }

        </style>
    </head>

    <body>
        <div class="myMap one" is="rv-map" rv-config='config-all.en.json'>
            <noscript>
                <p>This interactive map requires JavaScript. To view this content please enable JavaScript in your browser or download a browser that supports it.<p>

                <p>Cette carte interactive nécessite JavaScript. Pour voir ce contenu, s'il vous plaît, activer JavaScript dans votre navigateur ou télécharger un navigateur qui le prend en charge.</p>
            </noscript>
        </div>

        <div class="row">
            <div class="myMap two" is="rv-map" rv-config="config.fr-CA.json">
                <noscript>
                    <p>This interactive map requires JavaScript. To view this content please enable JavaScript in your browser or download a browser that supports it.<p>

                    <p>Cette carte interactive nécessite JavaScript. Pour voir ce contenu, s'il vous plaît, activer JavaScript dans votre navigateur ou télécharger un navigateur qui le prend en charge.</p>
                </noscript>
            </div>

            <div class="myMap three" is="rv-map" rv-config="config.en-CA.json">
                <noscript>
                    <p>This interactive map requires JavaScript. To view this content please enable JavaScript in your browser or download a browser that supports it.<p>

                    <p>Cette carte interactive nécessite JavaScript. Pour voir ce contenu, s'il vous plaît, activer JavaScript dans votre navigateur ou télécharger un navigateur qui le prend en charge.</p>
                </noscript>
            </div>
        </div>

        <script src="https://cdn.polyfill.io/v2/polyfill.min.js?features=default,Object.entries,Object.values,Array.prototype.find,Array.prototype.findIndex,Array.prototype.values,Array.prototype.includes,HTMLCanvasElement.prototype.toBlob,String.prototype.repeat,String.prototype.codePointAt,String.fromCodePoint,NodeList.prototype.@@iterator,Promise,Promise.prototype.finally"></script>

    </body>

</html>
