<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- Dates Descriptions -->
	<xsl:template name="Formatting.standard_date_xml">
		<xsl:param name="date" />
		<xsl:if test="$date !=''">
			<xsl:value-of select="substring($date, 1, 10)" />
		</xsl:if>
	</xsl:template>

	<xsl:template name="Formatting.string_date_xml">
		<xsl:param name="date" />
		<xsl:choose>
			<xsl:when test="$Locale='fr-CA'">
				<xsl:if test="$date !=''">
					<!-- Day -->
					<xsl:if test="string(number(substring($date, 9, 2))) != 'NaN'">
						<xsl:value-of select="number(substring($date, 9, 2))" />
						<xsl:text> </xsl:text>
					</xsl:if>
					<!-- Month -->
					<xsl:variable name="month" select="number(substring($date, 6, 2))"/>
					<xsl:choose>
						<xsl:when test="$month=1">janvier</xsl:when>
						<xsl:when test="$month=2">février</xsl:when>
						<xsl:when test="$month=3">mars</xsl:when>
						<xsl:when test="$month=4">avril</xsl:when>
						<xsl:when test="$month=5">mai</xsl:when>
						<xsl:when test="$month=6">juin</xsl:when>
						<xsl:when test="$month=7">juillet</xsl:when>
						<xsl:when test="$month=8">août</xsl:when>
						<xsl:when test="$month=9">September</xsl:when>
						<xsl:when test="$month=10">septembre</xsl:when>
						<xsl:when test="$month=11">novembre</xsl:when>
						<xsl:when test="$month=12">décembre</xsl:when>
					</xsl:choose>
					<xsl:text> </xsl:text>
					<!-- Year -->
					<xsl:value-of select="substring($date, 1, 4)" />
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="$date !=''">
					<!-- Month -->
					<xsl:variable name="month" select="number(substring($date, 6, 2))"/>
					<xsl:choose>
						<xsl:when test="$month=1">January</xsl:when>
						<xsl:when test="$month=2">February</xsl:when>
						<xsl:when test="$month=3">March</xsl:when>
						<xsl:when test="$month=4">April</xsl:when>
						<xsl:when test="$month=5">May</xsl:when>
						<xsl:when test="$month=6">June</xsl:when>
						<xsl:when test="$month=7">July</xsl:when>
						<xsl:when test="$month=8">August</xsl:when>
						<xsl:when test="$month=9">September</xsl:when>
						<xsl:when test="$month=10">October</xsl:when>
						<xsl:when test="$month=11">November</xsl:when>
						<xsl:when test="$month=12">December</xsl:when>
					</xsl:choose>
					<xsl:text> </xsl:text>
					<!-- Day -->
					<xsl:if test="string(number(substring($date, 9, 2))) != 'NaN'">
						<xsl:value-of select="number(substring($date, 9, 2))" />
						<xsl:text>, </xsl:text>
					</xsl:if>
					<!-- Year -->
					<xsl:value-of select="substring($date, 1, 4)" />
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:decimal-format name="SummaryFormat" NaN=" " zero-digit="0"/>

	<xsl:template name="removeLeadingZeros">
		<xsl:param name="originalString"/>
		<xsl:choose>
			<xsl:when test="starts-with($originalString,'0')">
				<xsl:call-template name="removeLeadingZeros">
					<xsl:with-param name="originalString">
						<xsl:value-of select="substring-after($originalString,'0' )"/>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$originalString"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="Formatting.NumericTwoDecimal">
		<xsl:param name="code"/>
		<xsl:value-of select="format-number($code, '#0.00', 'SummaryFormat')" />
	</xsl:template>
</xsl:stylesheet>