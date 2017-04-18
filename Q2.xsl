<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml"/>
	<xsl:variable name="bookdoc" select="document('books.xml')"/>
	<xsl:template match="/">
		<xsl:variable name="pubdoc" select="document('publishers.xml')"/>
		<Resultat>
			<xsl:for-each select="$pubdoc//Publisher">
				<xsl:element name="Förlag">
					<xsl:attribute name="Namn"><xsl:value-of select="@Name"/></xsl:attribute>
					<xsl:attribute name="Land"><xsl:value-of select="Address/Country"/></xsl:attribute>
					<xsl:apply-templates select="@Name"/>
				</xsl:element>
			</xsl:for-each>
		</Resultat>
	</xsl:template>
	<xsl:template match="@Name">
		<xsl:for-each select="$bookdoc//Book[descendant::Translation/@Publisher = current()]">
			<xsl:element name="Bok">
				<xsl:attribute name="Titel"><xsl:value-of select="@Title"/></xsl:attribute>
				<xsl:attribute name="Genre"><xsl:value-of select="@Genre"/></xsl:attribute>
			</xsl:element>
		</xsl:for-each>
	</xsl:template>
</xsl:transform>