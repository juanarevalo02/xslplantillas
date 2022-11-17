<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
<xsl:output method="html" indent="yes" encoding="UTF-8" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>
<xsl:template match="/nmaprun">

<xsl:for-each select="host">
	<p> El programa Nmap en la direcion <xsl:value-of select="address/@addr"/> encontro los siguientes 
    	<xsl:value-of select="count(ports/port[state/@state=&#39;open&#39;]) "/> puertos abiertos :</p> 
        <xsl:for-each select="ports/port">
        	<xsl:if test="state/@state = 'open'">
        		<xsl:value-of select="@portid" />/<xsl:value-of select="service/@name" />/<xsl:value-of select="@protocol" />
            		<p><xsl:text>&#xa;</xsl:text></p>
        	</xsl:if>
        </xsl:for-each>
        <xsl:if test="count(ports/port[state/@state=&#39;closed&#39;]) > 0">
        <p> El programa Nmap encontro los siguientes 
    	<xsl:value-of select="count(ports/port[state/@state=&#39;closed&#39;]) "/> puertos cerrados :</p> 
        <xsl:for-each select="ports/port">
        	<xsl:if test="state/@state = 'closed'">
        		<xsl:value-of select="@portid" />/<xsl:value-of select="@protocol" />/<xsl:value-of select="service/@name"  />
            		<p><xsl:text>&#xa;</xsl:text></p>
        	</xsl:if>
        </xsl:for-each>
        </xsl:if>
</xsl:for-each>

</xsl:template>
</xsl:stylesheet>