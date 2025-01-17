﻿<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:atom="http://www.w3.org/2005/Atom"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:media="http://search.yahoo.com/mrss/"
 exclude-result-prefixes="atom dc media">
  <xsl:output method="html" />
  <xsl:variable name="title" select="/rss/channel/title" />
  <xsl:variable name="description" select="/rss/channel/description" />
  <xsl:template match="/">
    <xsl:element name="html">
      <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>
          <xsl:value-of select="$title" /> - powered by FeedOcean
        </title>
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
      <style>
        article{
          padding-bottom:1rem;
        }
        article img{
          max-width: 100%;
          height: auto;
        }
        article:last-child{
          padding-bottom:0;
        }
      </style>
      </head>
      <body>
        <div class="container">
        <div class="row no-gutters">
          <div class="col-12 col-md-10 main-content">
            <header class="pb-3 border-bottom">
              <h1>
                <xsl:value-of select="$title" />
              </h1>
              <xsl:if test="$description">
                <p class="mb-0">
                  <xsl:value-of select="$description" />
                </p>
              </xsl:if>
            </header>
            <main class="mt-3">
                <xsl:apply-templates select="rss/channel/item" />
            </main>
          </div>
        </div>
        </div>
      </body>
    </xsl:element>
  </xsl:template>
  <xsl:template match="item">
    <article>
      <div class="row no-gutters">
         <div class="col-12">  
              <h4>
                <a href="{link}">
                  <xsl:value-of select="title" />
                </a>
              </h4>
              <xsl:if test="pubDate">
                <time class="mb-1 d-block text-muted">
                  <xsl:value-of select="pubDate" />
                </time>
              </xsl:if>
              <div>
                <xsl:choose>
                <xsl:when xmlns:content="http://purl.org/rss/1.0/modules/content/" test="content:encoded">
                  <xsl:value-of select="content:encoded" disable-output-escaping="yes"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of disable-output-escaping="yes" select="description" />
                  </xsl:otherwise>
                </xsl:choose>
              </div>
            </div>
      </div>
    </article>
    <hr/>
  </xsl:template>
</xsl:stylesheet>