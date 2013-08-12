<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="toolkit.xsl"/>
<xsl:include href="date-time-advanced.xsl" />
<xsl:include href="navigation.xsl"/>

<xsl:output method="xml"
    doctype-public="XSLT-compat"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
    omit-xml-declaration="yes"
    encoding="UTF-8"
    indent="yes" />


<xsl:param name="cookie-username" />

<xsl:template match="/">

  <html lang="en">
  <head>
    <xsl:choose>
      <xsl:when test="$page-title = 'Home' or $page-title = 'Error'">
        <title>Dapper &#38; Wise Roasters · Bravely roasting coffee in the suburbs of Portland, OR</title>
      </xsl:when>
      <xsl:otherwise>
        <title>
          <xsl:if test="$title != ''">
            <xsl:variable name="title-spaced">
              <xsl:choose>
                <xsl:when test="number($title)">
                  <xsl:text>Page </xsl:text>
                  <xsl:value-of select="$title" />
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="string-replace-all">
                    <xsl:with-param name="text" select="$title" />
                    <xsl:with-param name="replace" select="'-'" />
                    <xsl:with-param name="by" select="' '" />
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            <xsl:call-template name="TitleCase">
              <xsl:with-param name="text" select="translate(normalize-space($title-spaced),
          'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')" />
            </xsl:call-template>
            <xsl:text> · </xsl:text>
          </xsl:if>
          <xsl:text>Dapper &#38; Wise Roasters · Bravely roasting coffee in the suburbs of Portland, OR</xsl:text>
          <xsl:value-of select="//data/page-data/entry/title" />
        </title>
      </xsl:otherwise>
    </xsl:choose>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="Hand-crafted artisan coffee roasting in the outskirts of Portland, Oregon" />
    <meta name="keywords" content="Coffee, Coffee Roasting, Portland Coffee Roasting" />
    <meta name="author" content="Dapper &#38; Wise Roasters and Insomnia Coffee Co." />
    <meta name="responsimage" data-server="{$root}/image/2/width/height/anchor/0/uploads/images/filename" data-static="{$workspace}/assets/img/spacer.gif" data-loading="{$workspace}/assets/img/loading.gif" />

    <link href="{$workspace}/assets/css/main.css" rel="stylesheet" />
    <link href="{$workspace}/assets/img/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link rel="apple-touch-icon-precomposed" href="{$workspace}/assets/img/apple-touch-icon-precomposed.png" />

    <script type="text/javascript" src="//use.typekit.net/jzz1ckj.js"></script>
    <script type="text/javascript">try{Typekit.load();}catch(e){}</script>

    <script type="text/javascript">
      <xsl:comment>
        var _gaq=[["_setAccount","UA-7777777-1"],["_trackPageview"]];
        (function(d,t){
          var g=d.createElement(t), s=d.getElementsByTagName(t)[0];
          g.async=1;
            g.src=("https:"==location.protocol?"//ssl":"//www")+".google-analytics.com/ga.js";
            s.parentNode.insertBefore(g,s)
        }(document,"script"));
      </xsl:comment>
    </script>
  </head>

  <body class="{$root-page}" data-spy="scroll" data-target="#navbar-main">

    <xsl:apply-templates select="data/navigation"/>

    <div id="content">

      <xsl:apply-templates />

    </div>

    <footer class="footer">
      <div class="container">
        <div class="row">
          <i class="icon-stache icon-medium"></i>
          <p>Lovingly designed, crafted, roasted, and brewed by <a href="{root}" target="_blank">Dapper &#38; Wise Roasters</a>, <a href="http://insomniacoffee.co">Insomnia Coffee Co.</a> and <a href="http://simko.io" target="_blank">Simko.io</a>.</p>
        </div>
        <div class="row">
          <p>
            <xsl:text>&#xa9;&#160;</xsl:text>
            <xsl:value-of select="$this-year" />
            <xsl:text>. All rights reserved.</xsl:text>
          </p>
        </div>
      </div>

    </footer>


  </body>
  <script type="text/javascript" src="{$workspace}/assets/js/application.min.js"></script>
</html>

</xsl:template>


</xsl:stylesheet>
