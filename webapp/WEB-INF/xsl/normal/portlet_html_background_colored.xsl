<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" indent="yes"/>

<xsl:template match="portlet">
	<div class="portlet-background-colored">
		<xsl:if test="not(string(display-portlet-title)='1')">
			<div class="portlet-background-colored-header">
			<h3 class="portlet-background-colored-header">
				<xsl:value-of disable-output-escaping="yes" select="portlet-name" />
			</h3>
			</div>
        </xsl:if>


        <div class="portlet-background-content">
            <xsl:apply-templates select="html-portlet" />
        </div>
    </div>
</xsl:template>

<xsl:template match="html-portlet">
         <xsl:apply-templates select="html-portlet-content" />
</xsl:template>

<xsl:template match="html-portlet-content">
            <xsl:value-of disable-output-escaping="yes" select="." />
</xsl:template>

</xsl:stylesheet>

