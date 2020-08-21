<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>

    <xsl:template match="/">
        <html lang="en">
            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <title>TV</title>
                <link rel="shortcut icon" href="assets/logo.png" />
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous" />
                <link rel="stylesheet" href="assets/site.css" />
            </head>
            <body>
                <xsl:apply-templates select="document('channels.xml')/table"/>
                <script src="https://cdn.jsdelivr.net/npm/hls.js@latest"/>
                <script src="assets/index.js"/>
                <script>
                    <![CDATA[
                    document.write('<script src="http://' + (location.host || 'localhost').split(':')[0] + ':35729/livereload.js?snipver=1"></' + 'script>')
                    ]]>
                </script>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="table">
        <div class="row row-no-gutters">
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="row">
        <div class="col-xs-4">
            <div class="embed-responsive embed-responsive-16by9">
                <video
                    controls="true"
                    class="embed-responsive-item"
                    muted="true"
                    autoplay="true"
                    poster="{poster}"
                    title="{name}"
                    src="{url}">
                    <source src="{url}"/>
                </video>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>
