<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="mode" />

	<xsl:output method="html" indent="yes" />

	<xsl:template match="portlet">
	
	<xsl:variable name="device_class">
	<xsl:choose>
		<xsl:when test="string(display-on-small-device)='0'">hidden-phone</xsl:when>
		<xsl:otherwise></xsl:otherwise>
	</xsl:choose>
	</xsl:variable>

		<div class="portlet-background-image-on-title {$device_class}">
			<h1 class="portlet-background-image-on-title-header">
				<xsl:value-of disable-output-escaping="yes" select="portlet-name" />
			</h1>
			<div class="portlet-background-image-on-title-content">
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