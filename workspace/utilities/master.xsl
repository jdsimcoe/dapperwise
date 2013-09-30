<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="toolkit.xsl"/>
<xsl:include href="date-time-advanced.xsl" />
<xsl:include href="navigation.xsl" />

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
<!--     <meta name="responsimage" data-server="{$root}/image/2/width/height/anchor/0/uploads/images/filename" data-static="{$workspace}/assets/img/spacer.gif" data-loading="{$workspace}/assets/img/loading.gif" /> -->

    <link href="{$workspace}/assets/css/main.css" rel="stylesheet" />
    <xsl:comment>
      <![CDATA[[if IE 7]>
        <link rel="stylesheet" href="/workspace/assets/css/icons-ie7.css" />
      <![endif]]]>
    </xsl:comment>

    <link href="{$workspace}/assets/img/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link rel="apple-touch-icon-precomposed" href="{$workspace}/assets/img/apple-touch-icon-precomposed.png" />

    <script type="text/javascript" src="{$workspace}/assets/js/application.min.js"></script>
    <script type="text/javascript" src="//use.typekit.net/jzz1ckj.js"></script>
    <script type="text/javascript">try{Typekit.load();}catch(e){}</script>

    <script>
      <xsl:comment>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-4548059-6', 'dapperandwise.com');
        ga('send', 'pageview');
      </xsl:comment>
    </script>

  </head>

  <body class="{$root-page}" data-spy="scroll" data-target="#navbar-main">

    <xsl:apply-templates select="data/navigation"/>

    <div id="content">
      <xsl:apply-templates />
    </div>

    <div class="horizon address">
      <div class="container">
        <div class="col-lg-6">
          <h4>Our Location</h4>
          <address>
            2384 NW Amberbrook Drive<br/>
            Beaverton, OR 97006<br />
            <abbr title="Phone">P:</abbr> (503) 716-0839
          </address>
        </div>
        <hr class="visible-sm"/>
        <div class="col-lg-6">
          <h4>Contact Us</h4>
          <p>
            <a href="mailto:dapperandwise@gmail.com?Subject=Dapper &amp; Wise Inquiry" target="_blank" class="btn btn-large">
            Send an Email
          </a>
          </p>
        </div>
      </div>
    </div>

    <footer class="footer">

      <div class="container">
        <div class="row">
          <i class="icon-specs icon-medium"></i>
          <p>Lovingly designed, crafted, roasted, and brewed by <a href="{root}" target="_blank">Dapper &#38; Wise Roasters</a>, <a href="http://insomniacoffee.co">Insomnia Coffee Co.</a> and <a href="http://simko.io" target="_blank">Simko.io</a>.</p>
        </div>
        <div class="row">
          <p>
            <xsl:text>&#xa9;&#160;</xsl:text>
            <xsl:value-of select="$this-year" />
            <xsl:text>. All rights reserved.</xsl:text>
          </p>
        </div>
      </div> <!-- .container -->

    </footer>

  </body>

</html>

</xsl:template>


</xsl:stylesheet>
