<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
<xsl:output method="html" indent="yes" encoding="UTF-8" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>
<xsl:template match="/nmaprun">

<style>
table, th, td {
  border: 1px solid black;
}
table.center {
  margin-left: auto;
  margin-right: auto;
}
</style>


<xsl:for-each select="host">
	<p> El programa Nmap encontro los siguientes CVES relacionados a los puertos abiertos de la ip <xsl:value-of select="address/@addr"/> :</p> 
        <table cellspacing="1">
            <tr class="head">
            <td>Id</td>
            <td>Puntuacion CVSS</td>
            <td>Vector de Vulnerabilidades</td>
            <td>Estado Exploit</td>
            <td>Descripcion</td>
            </tr>
            <xsl:for-each select="ports/port/script/table/table">
<tr class="body"> 
  
             	     <xsl:if test="elem[@key='type'] = 'cve' or elem[@key='type'] = 'securityvulns'">              
                 <td>
                <xsl:value-of select="elem[@key='id']"/>
                <xsl:text>&#xa;</xsl:text>
                </td>
                 <td>
                <xsl:value-of select="elem[@key='cvss']"/>
                <xsl:text>&#xa;</xsl:text>
                </td>    
                 <td>
                <xsl:value-of select="elem[@key='vector']"/>
                <xsl:text>&#xa;</xsl:text>
                </td> 
                 <td>
                <xsl:value-of select="elem[@key='is_exploit']"/>
                <xsl:text>&#xa;</xsl:text>
                </td>
                <td>
                <xsl:value-of select="elem[@key='descriptioncve']"/>
                <xsl:text>&#xa;</xsl:text>
                </td>                              
		  </xsl:if>   
            
</tr> 
		  </xsl:for-each>

        </table>
</xsl:for-each>
<xsl:for-each select="host">
	<p> El programa Nmap encontro ademas las siguientes vulnerabilidades dentro de la categoria exploit que deben ser revisadas <xsl:value-of select="address/@addr"/> :</p> 
        <table cellspacing="1">
            <tr class="head">
            <td>Id</td>
            <td>Puntuacion CVSS</td>
            <td>Vector de Vulnerabilidades</td>
            <td>Estado Exploit</td>
            <td>Descripcion</td>
            </tr>
            <xsl:for-each select="ports/port/script/table/table">
<tr class="body"> 
  
             	     <xsl:if test="(elem[@key='is_exploit'] = 'true' )">              
                 <td>
                <xsl:value-of select="elem[@key='id']"/>
                <xsl:text>&#xa;</xsl:text>
                </td>
                 <td>
                <xsl:value-of select="elem[@key='cvss']"/>
                <xsl:text>&#xa;</xsl:text>
                </td>    
                 <td>
                <xsl:value-of select="elem[@key='vector']"/>
                <xsl:text>&#xa;</xsl:text>
                </td> 
                 <td>
                <xsl:value-of select="elem[@key='is_exploit']"/>
                <xsl:text>&#xa;</xsl:text>
                </td>
                <td>
                <xsl:value-of select="substring(elem[@key='descriptioncve'],1,40)"/>
                <xsl:text>&#xa;</xsl:text>
                </td>                              
		  </xsl:if>   
            
</tr> 
		  </xsl:for-each>

        </table>
</xsl:for-each>
</xsl:template>
</xsl:stylesheet>