<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>

    <xsl:template match="/">
        <html lang="en">
            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous" />
            </head>
            <body style="background: black;">
                <xsl:apply-templates />
            </body>
        </html>
    </xsl:template>

    <xsl:template match="channels">
        <div class="row row-no-gutters">
            <xsl:for-each select="channel">
                <div class="col-md-4">
                    <xsl:apply-templates select="."/>
                </div>
            </xsl:for-each>
        </div>
    </xsl:template>

    <xsl:template match="channel">
        <div class="embed-responsive embed-responsive-16by9">
            <video
                controls="true"
                class="embed-responsive-item mejs__player"
                data-mejsoptions=''>
                <xsl:attribute name="data-mejsoptions">
                    <![CDATA[ {"alwaysShowControls": "true"} ]]>
                </xsl:attribute>
                <source>
                    <xsl:attribute name="src">
                        <xsl:value-of select="@url"/>
                    </xsl:attribute>
                </source>
            </video>
        </div>
    </xsl:template>
</xsl:stylesheet>
