<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
	<xsl:variable name="doc" select="document('books.xml')"/>
	<xsl:template match="/">
		<html>
			<head><title>Q1</title></head>
			<body>
				<xsl:apply-templates select="$doc//Book[not(@Genre = preceding::Book/@Genre)][@Genre]"/>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="Book">
		<h1><xsl:value-of select="@Genre"/></h1>
		<ul>
			<xsl:for-each select="$doc//Book[@Genre = current()/@Genre]">
				<li><xsl:value-of select="@Title"/></li>
			</xsl:for-each>
		</ul>
	</xsl:template>
</xsl:transform>
