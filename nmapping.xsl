<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
<xsl:output method="html" indent="yes" encoding="UTF-8" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>
<xsl:template match="/nmaprun">
<p> Como parte de la fase de Reconocimento el programa Nmap realizo pruebas de conexion  a los  <xsl:value-of select="runstats/hosts/@total"/>  objetivos de esta inspecion ,dando como resultado:  
	</p><br></br>
<xsl:for-each select="host">
	<p> El host <xsl:value-of select="address/@addr"/>   se encuentra <xsl:value-of select="status/@state"/> </p>
</xsl:for-each>

</xsl:template>
</xsl:stylesheet>