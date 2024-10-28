<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="TransmissionData.CreatedDate">
    <xsl:call-template name="Formatting.standard_date_xml">
      <xsl:with-param name="date" select="//TransmissionData/CreatedDateTime/text()"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="TransmissionData.SourceInstitutionName">
    <xsl:value-of select="//TransmissionData/Source/Organization/OrganizationName/text()" />
  </xsl:template>
  <xsl:template name="TransmissionData.SourceInstitutionCode">
    <xsl:value-of select="//TransmissionData/Source/Organization/CSIS/text()" />
    <xsl:value-of select="//TransmissionData/Source/Organization/PSIS/text()" />
    <xsl:value-of select="//TransmissionData/Source/Organization/USIS/text()" />
    <xsl:value-of select="//TransmissionData/Source/Organization/PSID/text()" />
    <xsl:value-of select="//TransmissionData/Source/Organization/ESIS/text()" />
    <xsl:value-of select="//TransmissionData/Source/Organization/OPEID/text()" />
    <xsl:value-of select="//TransmissionData/Source/Organization/NCHELPID/text()" />
    <xsl:value-of select="//TransmissionData/Source/Organization/IPEDS/text()" />
    <xsl:value-of select="//TransmissionData/Source/Organization/ATP/text()" />
    <xsl:value-of select="//TransmissionData/Source/Organization/FICE/text()" />
    <xsl:value-of select="//TransmissionData/Source/Organization/ACT/text()" />
    <xsl:value-of select="//TransmissionData/Source/Organization/CCD/text()" />
    <xsl:value-of select="//TransmissionData/Source/Organization/PSS/text()" />
    <xsl:value-of select="//TransmissionData/Source/Organization/CEEBACT/text()" />
    <xsl:value-of select="//TransmissionData/Source/Organization/DUNS/text()" />
    <xsl:value-of select="//TransmissionData/Source/Organization/APAS/text()" />
    <xsl:value-of select="//TransmissionData/Source/Organization/GEOCode/text()" />
    <xsl:value-of select="//TransmissionData/Source/Organization/MutuallyDefined/text()" />
  </xsl:template>
  <xsl:template name="TransmissionData.RequestTrackingID">
    <xsl:value-of select="//TransmissionData/RequestTrackingID/text()" />
  </xsl:template>
  <xsl:template name="ContactInformation.Name">
    <xsl:value-of select="//TransmissionData/Source/Organization/Contacts/NoteMessage/text()"/>
    <xsl:value-of select="//TransmissionData/Source/Organization/Contacts/Phone/NoteMessage/text()"/>
  </xsl:template>
  <xsl:template name="ContactInformation.Telephone">
    <xsl:value-of select="//TransmissionData/Source/Organization/Contacts/Phone/AreaCityCode/text()"/>
    <xsl:value-of select="//TransmissionData/Source/Organization/Contacts/Phone/PhoneNumber/text()"/>
  </xsl:template>

  <xsl:template name="TransmissionData.DestinationInstitutionName">
    <xsl:value-of select="//TransmissionData/Destination/Organization/OrganizationName/text()" />
  </xsl:template>
  <xsl:template name="TransmissionData.DestinationInstitutionCode">
    <xsl:value-of select="//TransmissionData/Destination/Organization/CSIS/text()" />
    <xsl:value-of select="//TransmissionData/Destination/Organization/PSIS/text()" />
    <xsl:value-of select="//TransmissionData/Destination/Organization/USIS/text()" />
    <xsl:value-of select="//TransmissionData/Destination/Organization/PSID/text()" />
    <xsl:value-of select="//TransmissionData/Destination/Organization/ESIS/text()" />
    <xsl:value-of select="//TransmissionData/Destination/Organization/OPEID/text()" />
    <xsl:value-of select="//TransmissionData/Destination/Organization/NCHELPID/text()" />
    <xsl:value-of select="//TransmissionData/Destination/Organization/IPEDS/text()" />
    <xsl:value-of select="//TransmissionData/Destination/Organization/ATP/text()" />
    <xsl:value-of select="//TransmissionData/Destination/Organization/FICE/text()" />
    <xsl:value-of select="//TransmissionData/Destination/Organization/ACT/text()" />
    <xsl:value-of select="//TransmissionData/Destination/Organization/CCD/text()" />
    <xsl:value-of select="//TransmissionData/Destination/Organization/PSS/text()" />
    <xsl:value-of select="//TransmissionData/Destination/Organization/CEEBACT/text()" />
    <xsl:value-of select="//TransmissionData/Destination/Organization/DUNS/text()" />
    <xsl:value-of select="//TransmissionData/Destination/Organization/APAS/text()" />
    <xsl:value-of select="//TransmissionData/Destination/Organization/GEOCode/text()" />
    <xsl:value-of select="//TransmissionData/Destination/Organization/MutuallyDefined/text()" />
  </xsl:template>

  <xsl:template name="TransmissionData.OrganizationID">
    <xsl:param name="showLabel" select="'true'" />
    <xsl:param name="newLine" select="'true'" />
    <xsl:choose>
        <xsl:when test="name() = 'CSIS'"><xsl:if test="$showLabel='true'"><xsl:value-of select="name()"/>: </xsl:if><xsl:value-of select="text()"/><xsl:if test="$newLine='true'"><br/></xsl:if></xsl:when>
        <xsl:when test="name() = 'PSIS'"><xsl:if test="$showLabel='true'"><xsl:value-of select="name()"/>: </xsl:if><xsl:value-of select="text()"/><xsl:if test="$newLine='true'"><br/></xsl:if></xsl:when>
        <xsl:when test="name() = 'USIS'"><xsl:if test="$showLabel='true'"><xsl:value-of select="name()"/>: </xsl:if><xsl:value-of select="text()"/><xsl:if test="$newLine='true'"><br/></xsl:if></xsl:when>
        <xsl:when test="name() = 'ESIS'"><xsl:if test="$showLabel='true'"><xsl:value-of select="name()"/>: </xsl:if><xsl:value-of select="text()"/><xsl:if test="$newLine='true'"><br/></xsl:if></xsl:when>
        <xsl:when test="name() = 'PSID'"><xsl:if test="$showLabel='true'"><xsl:value-of select="name()"/>: </xsl:if><xsl:value-of select="text()"/><xsl:if test="$newLine='true'"><br/></xsl:if></xsl:when>
        <xsl:when test="name() = 'OPEID'"><xsl:if test="$showLabel='true'"><xsl:value-of select="name()"/>: </xsl:if><xsl:value-of select="text()"/><xsl:if test="$newLine='true'"><br/></xsl:if></xsl:when>
        <xsl:when test="name() = 'NCHELPID'"><xsl:if test="$showLabel='true'"><xsl:value-of select="name()"/>: </xsl:if><xsl:value-of select="text()"/><xsl:if test="$newLine='true'"><br/></xsl:if></xsl:when>
        <xsl:when test="name() = 'IPEDS'"><xsl:if test="$showLabel='true'"><xsl:value-of select="name()"/>: </xsl:if><xsl:value-of select="text()"/><xsl:if test="$newLine='true'"><br/></xsl:if></xsl:when>
        <xsl:when test="name() = 'ATP'"><xsl:if test="$showLabel='true'"><xsl:value-of select="name()"/>: </xsl:if><xsl:value-of select="text()"/><xsl:if test="$newLine='true'"><br/></xsl:if></xsl:when>
        <xsl:when test="name() = 'FICE'"><xsl:if test="$showLabel='true'"><xsl:value-of select="name()"/>: </xsl:if><xsl:value-of select="text()"/><xsl:if test="$newLine='true'"><br/></xsl:if></xsl:when>
        <xsl:when test="name() = 'ACT'"><xsl:if test="$showLabel='true'"><xsl:value-of select="name()"/>: </xsl:if><xsl:value-of select="text()"/><xsl:if test="$newLine='true'"><br/></xsl:if></xsl:when>
        <xsl:when test="name() = 'CCD'"><xsl:if test="$showLabel='true'"><xsl:value-of select="name()"/>: </xsl:if><xsl:value-of select="text()"/><xsl:if test="$newLine='true'"><br/></xsl:if></xsl:when>
        <xsl:when test="name() = 'PSS'"><xsl:if test="$showLabel='true'"><xsl:value-of select="name()"/>: </xsl:if><xsl:value-of select="text()"/><xsl:if test="$newLine='true'"><br/></xsl:if></xsl:when>
        <xsl:when test="name() = 'CEEBACT'"><xsl:if test="$showLabel='true'"><xsl:value-of select="name()"/>: </xsl:if><xsl:value-of select="text()"/><xsl:if test="$newLine='true'"><br/></xsl:if></xsl:when>
        <xsl:when test="name() = 'DUNS'"><xsl:if test="$showLabel='true'"><xsl:value-of select="name()"/>: </xsl:if><xsl:value-of select="text()"/><xsl:if test="$newLine='true'"><br/></xsl:if></xsl:when>
        <xsl:when test="name() = 'APAS'"><xsl:if test="$showLabel='true'"><xsl:value-of select="name()"/>: </xsl:if><xsl:value-of select="text()"/><xsl:if test="$newLine='true'"><br/></xsl:if></xsl:when>
        <xsl:when test="name() = 'GEOCode'"><xsl:if test="$showLabel='true'"><xsl:value-of select="name()"/>: </xsl:if><xsl:value-of select="text()"/><xsl:if test="$newLine='true'"><br/></xsl:if></xsl:when>
        <xsl:when test="name() = 'MutuallyDefined'"><xsl:if test="$showLabel='true'">ID: </xsl:if><xsl:value-of select="text()"/><xsl:if test="$newLine='true'"><br/></xsl:if></xsl:when>
     </xsl:choose>
  </xsl:template>

  <xsl:template name="TransmissionData.Notes" >
    <xsl:for-each select="//TransmissionData/Destination/Organization/NoteMessage">
      <xsl:value-of select="text()" />
    </xsl:for-each> 
  </xsl:template>
</xsl:stylesheet>