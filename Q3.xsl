<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
<xsl:variable name="doc" select="document('books.xml')"/>
	<xsl:template match="/">
		<html>
			<head><title>Q3</title></head>
			<body>
				<table border="1.5">
					<tr>
						<th>Språk</th>
						<th>Titel</th>
						<th>Genre</th>
					</tr>
					<xsl:apply-templates select="$doc//Book[not(@OriginalLanguage = preceding::Book/@OriginalLanguage)]">
						<xsl:sort select="@OriginalLanguage"/>
					</xsl:apply-templates>
				</table>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="Book">
		<xsl:variable name="antalBocker" select="count($doc//Book[@OriginalLanguage = current()/@OriginalLanguage])"/>
		<xsl:for-each select="$doc//Book[@OriginalLanguage = current()/@OriginalLanguage]">
			<xsl:sort select="@Title"/>
			<tr>
				<xsl:if test="position() = 1">
					<td rowspan="{$antalBocker}">
						<xsl:value-of select="@OriginalLanguage"/>
					</td>
				</xsl:if>
				<td><xsl:value-of select="@Title"/></td>
				<td><xsl:value-of select="@Genre"/></td>
			</tr>
		</xsl:for-each>
	</xsl:template>
</xsl:transform>