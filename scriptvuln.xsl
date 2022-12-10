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
	<p> El programa Nmap corrio los siguientes scripts en la ip <xsl:value-of select="address/@addr"/> y encontro:</p> 
        <table cellspacing="1">
            <tr class="head">
            <td>Puerto</td>
            <td>Script</td>
            <td>Estado Vulnerabilidad</td>
            <td>Descripcion</td>
            </tr>
            

  <xsl:for-each select="ports/port/script">
                 <tr class="body">   
                <xsl:if test="not(contains(@output,'ERROR'))">
                <td>
                <xsl:value-of select="../service/@name"/>
                <xsl:text>&#xa;</xsl:text>
                </td>
                 
                 
                       
                 <td>
                <xsl:value-of select="@id"/>
                <xsl:text>&#xa;</xsl:text>
                </td>
                 <td>

                <xsl:if test="contains(@output,'References')">
                <xsl:value-of select="substring-before(@output,'References')"/>
                <xsl:text>&#xa;</xsl:text>
                </xsl:if>

                <xsl:if test="not(contains(@output,'References'))">
                <xsl:value-of select="@output"/>
                <xsl:text>&#xa;</xsl:text>
                </xsl:if>



                </td>    
                 <td>
                <xsl:value-of select="./table/elem[@key='title']"/>
                <xsl:text>&#xa;</xsl:text>
                </td> 
                
                
                                 <td>
                <xsl:value-of select="./table/elem[@key='state']"/>
                <xsl:text>&#xa;</xsl:text>
                </td> 
                
                                 <td>
                <xsl:value-of select="./table/table[@key='description']"/>
                <xsl:text>&#xa;</xsl:text>
                </td> 
                                
                
                </xsl:if>
                         
		  </tr> 
            </xsl:for-each>

</table>
</xsl:for-each>		
</xsl:template>
</xsl:stylesheet>