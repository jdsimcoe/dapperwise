<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="navigation">

  <div id="navbar-main" class="navbar navbar-fixed-top">
    <div class="container">

      <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>

      <a class="navbar-brand" href="/"><i class="icon-dw"></i></a>

      <div class="nav-collapse collapse">


        <ul class="nav navbar-nav pull-right">
          <li>
            <a href="#about">
              <small>&#8470; 1</small>
              About Us
            </a>
          </li>
          <li>
            <a href="#coffee">
              <small>&#8470; 2</small>
              Our Coffee
            </a>
          </li>
          <li>
            <a href="#craft">
              <small>&#8470; 3</small>
              Our Craft
            </a>
          </li>
          <li>
            <a href="#location">
              <small>&#8470; 4</small>
              Location
            </a>
          </li>
          <li>
            <a href="#store">
              <small>&#8470; 5</small>
              Store
            </a>
          </li>
        </ul>


      </div> <!-- .nav-collapse -->
    </div><!-- .container -->

  </div> <!-- .navbar -->

</xsl:template>



</xsl:stylesheet>