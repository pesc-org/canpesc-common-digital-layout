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
    <xsl:value-of select="//TransmissionData/Destination/Organization/MutuallyDefined/text()" />
  </xsl:template>

  <xsl:template name="TransmissionData.Notes" >
      <xsl:for-each select="//TransmissionData/Destination/Organization/NoteMessage">
        <xsl:value-of select="text()" />
    </xsl:for-each> 
    
  </xsl:template>
</xsl:stylesheet>