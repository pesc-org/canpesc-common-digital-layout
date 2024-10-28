<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8"/>
	<xsl:param name="Locale">en-CA</xsl:param>
	<xsl:include href="./xsl/TransmissionData.xsl" />
	<xsl:include href="./xsl/Student.xsl" />
	<xsl:include href="./xsl/Course.xsl" />
	<xsl:include href="./xsl/AcademicSummary.xsl" />
	<xsl:include href="./xsl/AcademicAward.xsl" />
	<xsl:include href="./xsl/Formatting.xsl" />
	<xsl:include href="./xsl/Enums.xsl" />

	<xsl:template match="/">
		<xsl:variable name="Labels" select="document(concat('labels/Labels.HighSchoolTranscript.',$Locale,'.xml'))/Labels"/>
        <xsl:variable name="Styles" select="document('styles/Styles.xml')/Styles"/>
		<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
			<head>
				<title>
					<xsl:call-template name="TransmissionData.SourceInstitutionName" />
				</title>
                <style type="text/css">
                    <xsl:value-of select="$Styles/Transcript"/>
                </style>
			</head>
			<body>
				<div id="transcript-container">
					<div id="transmission-data" class="row">
						<div class="left-column">
							<div id="destination-institution">
								<h2><xsl:value-of select="$Labels/Label[@key='Destination.Heading']"/></h2>
								<p><span><xsl:value-of select="$Labels/Label[@key='Destination.OrganizationName']"/> <xsl:call-template name="TransmissionData.DestinationInstitutionName" /></span></p>
								<xsl:for-each select="//TransmissionData/Destination/Organization/*">
									<xsl:call-template name="TransmissionData.OrganizationID"><xsl:with-param name="showLabel" select="'true'" /><xsl:with-param name="newLine" select="'true'" /></xsl:call-template>
								</xsl:for-each>
							</div>
						</div>
						<div class="centre-column  rounded-corners">
							<div id="source-institution">
								<h1><xsl:call-template name="TransmissionData.SourceInstitutionName" /></h1>
								<h2><xsl:for-each select="//TransmissionData/Source/Organization/*">
									<xsl:call-template name="TransmissionData.OrganizationID"><xsl:with-param name="showLabel" select="'true'" /><xsl:with-param name="newLine" select="'true'" /></xsl:call-template>
								</xsl:for-each></h2>
								<p>&#160;</p>
								<xsl:if test="count(//TransmissionData/Source/Organization/Contacts) > 0">
									<p><span><xsl:value-of select="$Labels/Label[@key='Source.Contact.Title']"/> <xsl:call-template name="ContactInformation.Name" /></span></p>
									<xsl:if test="string-length(//TransmissionData/Source/Organization/Contacts/Address/AddressLine/text()) != 0" >
										<p><span><xsl:value-of select="//TransmissionData/Source/Organization/Contacts/Address/AddressLine/text()" /></span></p>
									</xsl:if>
									<xsl:if test="string-length(//TransmissionData/Source/Organization/Contacts/Address/City/text()) != 0" >
										<p><span><xsl:value-of select="//TransmissionData/Source/Organization/Contacts/Address/City/text()" /></span>
										<span>, <xsl:value-of select="//TransmissionData/Source/Organization/Contacts/Address/StateProvinceCode/text()" /></span>
										</p>
									</xsl:if>
									<xsl:if test="string-length(//TransmissionData/Source/Organization/Contacts/Address/PostalCode/text()) != 0" >
										<p>
										<span><xsl:value-of select="//TransmissionData/Source/Organization/Contacts/Address/PostalCode/text()" /></span>
										</p>
									</xsl:if>
									<xsl:if test="string-length(//TransmissionData/Source/Organization/Contacts/Email/EmailAddress/text()) != 0" >
										<p>
										<span><xsl:value-of select="//TransmissionData/Source/Organization/Contacts/Email/EmailAddress//text()" /></span>
										</p>
									</xsl:if>
								</xsl:if>
								<xsl:for-each select="//TransmissionData/NoteMessage">
									<p><span><xsl:value-of select="text()"/></span></p>
								</xsl:for-each>
                				<xsl:for-each select="//HighSchoolTranscript/NoteMessage">
									<p><span><xsl:value-of select="text()"/></span></p>
								</xsl:for-each>
								<p><span><xsl:value-of select="$Labels/Label[@key='RequestTrackingID']"/> <xsl:call-template name="TransmissionData.RequestTrackingID" /></span></p>
							</div>
						</div>
						<div class="right-column">
							<div id="transcript-information">
								<h2><xsl:value-of select="$Labels/Label[@key='TranscriptIssueDate']"/></h2>
								<p><span><xsl:call-template name="TransmissionData.CreatedDate" /></span></p>
							</div>
						</div>
					</div>
					<div id="student-summary" class="row">
						<div id="student-information" class="left-column rounded-corners">
							<h2><xsl:value-of select="$Labels/Label[@key='Student.Title']"/></h2>
							<p><span><xsl:value-of select="$Labels/Label[@key='Student.LastName']"/> <xsl:call-template name="StudentInformation.getIndividualName"><xsl:with-param name="individualNameElement" select="'LastName'" /></xsl:call-template></span></p>
							<p><span><xsl:value-of select="$Labels/Label[@key='Student.FirstName']"/> <xsl:call-template name="StudentInformation.getIndividualName"><xsl:with-param name="individualNameElement" select="'FirstName'" /></xsl:call-template></span></p>
							<xsl:if test="//*[local-name()='Student']/*[local-name()='Person']/*[local-name()='Name']/*[local-name()='MiddleName'] != ''">
								<p><span><xsl:value-of select="$Labels/Label[@key='Student.MiddleName']"/> <xsl:call-template name="StudentInformation.getIndividualName"><xsl:with-param name="individualNameElement" select="'MiddleName'" /></xsl:call-template></span></p>
							</xsl:if>
							<xsl:if test="//*[local-name()='Student']/*[local-name()='Person']/*[local-name()='AlternateName']/*[local-name()='LastName'] != ''">
								<p><span><xsl:value-of select="$Labels/Label[@key='Student.FormerLastName']"/> <xsl:call-template name="StudentInformation.getIndividualName"><xsl:with-param name="individualNameElement" select="'FormerLastName'" /></xsl:call-template></span></p>
							</xsl:if>
							<p><span><xsl:value-of select="$Labels/Label[@key='Student.DateOfBirth']"/> <xsl:call-template name="StudentInformation.DateOfBirth" /></span></p>
							<p><span><xsl:value-of select="$Labels/Label[@key='Student.Gender']"/> <xsl:call-template name="StudentInformation.StudentGender"><xsl:with-param name="GenderMale" select="'Male'" /><xsl:with-param name="GenderFemale" select="'Female'" /><xsl:with-param name="GenderUnreported" select="'Unreported'" /></xsl:call-template></span></p>
							<p><span><xsl:value-of select="$Labels/Label[@key='Student.StudentNumber']"/> <xsl:call-template name="StudentInformation.StudentID" /></span></p>
							<p><span><xsl:value-of select="$Labels/Label[@key='Student.GovernmentIdentifier']"/> <xsl:call-template name="StudentInformation.GovernmentId" /></span></p>
							<xsl:for-each select="//Student/NoteMessage">
								<p><span><xsl:value-of select="$Labels/Label[@key='Student.Note']"/> <xsl:value-of select="text()"/></span></p>
							</xsl:for-each>
						</div>
						<div id="academic-awards" class="centre-column rounded-corners">
							<h2><xsl:value-of select="$Labels/Label[@key='Student.AcademicAward.Title']"/></h2>
							<xsl:for-each select="//*[local-name()='Student']/*[local-name()='AcademicRecord']/*[local-name()='AcademicAward']">
								<xsl:if test="AcademicAwardDate/text() != ''">
									<div>
										<xsl:if test="AcademicAwardTitle/text() != ''">
											<h3>
												<xsl:call-template name="AcademicAward.AcademicDegreeDescription" />
											</h3>
										</xsl:if>
										<xsl:if test="AcademicAwardDate/text() != ''">
											<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicAward.AwardDate']"/> <xsl:call-template name="AcademicAward.DateDegreeAwarded" /></span></p>
										</xsl:if>
										<xsl:if test="AcademicAwardLevel/text() != ''">
											<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicAward.AwardLevel']"/> <xsl:call-template name="AcademicAward.AcademicDegreeCode" /></span></p>
										</xsl:if>
										<xsl:for-each select="AcademicAwardProgram">
											<p><xsl:if test="AcademicProgramName/text() != ''">
												<span><xsl:value-of select="$Labels/Label[@key='Student.AcademicAward.ProgramName']"/> <xsl:apply-templates select="AcademicProgramName"/></span>
											</xsl:if>
											<xsl:if test="AcademicProgramType/text() != ''">
												<span> (<xsl:apply-templates select="AcademicProgramType"/>)</span>
											</xsl:if>
											</p>
										</xsl:for-each>
										<xsl:if test="AcademicHonors/HonorsLevel/text() != ''">
											<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicAward.HonorsLevel']"/> <xsl:call-template name="AcademicAward.HonoursLevel" /></span></p>
										</xsl:if>
										<xsl:if test="AcademicAwardProgram/NoteMessage/text() != ''">
											<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicAward.Note']"/> <xsl:call-template name="AcademicAwardProgram.Note" /></span></p>
										</xsl:if>	
									</div>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//*[local-name()='Student']/*[local-name()='AcademicRecord']/*[local-name()='AcademicSession']/*[local-name()='AcademicAward']">
								<xsl:if test="AcademicAwardDate/text() != ''">
									<div>
										<xsl:if test="AcademicAwardTitle/text() != ''">
											<h3>
												<xsl:call-template name="AcademicAward.AcademicDegreeDescription" />
											</h3>
										</xsl:if>
										<xsl:if test="AcademicAwardDate/text() != ''">
											<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicAward.AwardDate']"/> <xsl:call-template name="AcademicAward.DateDegreeAwarded" /></span></p>
										</xsl:if>
										<xsl:if test="AcademicAwardLevel/text() != ''">
											<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicAward.AwardLevel']"/> <xsl:call-template name="AcademicAward.AcademicDegreeCode" /></span></p>
										</xsl:if>
										<xsl:for-each select="AcademicAwardProgram">
											<p><xsl:if test="AcademicProgramName/text() != ''">
												<span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicAward.ProgramName']"/> <xsl:apply-templates select="AcademicProgramName"/></span>
											</xsl:if>
											<xsl:if test="AcademicProgramType/text() != ''">
												<span> (<xsl:apply-templates select="AcademicProgramType"/>)</span>
											</xsl:if>
											</p>
										</xsl:for-each>
										<xsl:if test="AcademicHonors/HonorsLevel/text() != ''">
											<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicAward.HonorsLevel']"/> <xsl:call-template name="AcademicAward.HonoursLevel" /></span></p>
										</xsl:if>
										<xsl:if test="AcademicAwardProgram/NoteMessage/text() != ''">
											<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicAward.Note']"/> <xsl:call-template name="AcademicAwardProgram.Note" /></span></p>
										</xsl:if>	
									</div>
								</xsl:if>
							</xsl:for-each>
						</div>
						<div id="academic-summary" class="right-column rounded-corners">
							<h2><xsl:value-of select="$Labels/Label[@key='Student.AcademicRecord.School']"/></h2> 
							<xsl:for-each select="//Student/AcademicRecord/School">
								<xsl:if test="string-length(OrganizationName/text()) != 0">
									<h3><xsl:value-of select="OrganizationName/text()"/></h3>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//Student/AcademicRecord/AcademicSession/School">
								<xsl:if test="string-length(OrganizationName/text()) != 0">
									<h3><xsl:value-of select="OrganizationName/text()"/></h3>
								</xsl:if>
							</xsl:for-each>
							<span>
								<xsl:value-of select="$Labels/Label[@key='Student.AcademicRecord.School.ID']"/>
								<xsl:for-each select="//Student/AcademicRecord/School/*">
									<xsl:call-template name="TransmissionData.OrganizationID"><xsl:with-param name="showLabel" select="'false'" /><xsl:with-param name="newLine" select="'false'" /></xsl:call-template>
								</xsl:for-each>
								<xsl:for-each select="//Student/AcademicRecord/AcademicSession/School/*">
									<xsl:call-template name="TransmissionData.OrganizationID"><xsl:with-param name="showLabel" select="'false'" /><xsl:with-param name="newLine" select="'false'" /></xsl:call-template>
								</xsl:for-each>
							</span>
						</div>
					</div>
					<xsl:for-each select="//Student/AcademicRecord/AcademicSession">
						<div class="pagebreak" />
						<div id="session" class="session rounded-corners">
							<xsl:attribute name="id">
								<xsl:value-of select="concat('session-',position())"/>
							</xsl:attribute>
							<div id="session-summary" class="row">
								<div class="left-column">
									
								</div>
								<div class="centre-column">
									<h3><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Title']"/> <xsl:value-of select="AcademicSessionDetail/SessionDesignator/text()"/></h3>
									<span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.StartDate']"/> <xsl:call-template name="Formatting.string_date_xml"><xsl:with-param name="date" select="AcademicSessionDetail/SessionBeginDate/text()"/></xsl:call-template></span>
									<span>&#160;&#160;<xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.EndDate']"/> <xsl:call-template name="Formatting.string_date_xml"><xsl:with-param name="date" select="AcademicSessionDetail/SessionEndDate/text()"/></xsl:call-template></span>
								</div>
								<div class="right-column">
									<xsl:for-each select="AcademicSummary">
										<xsl:if test="AcademicSummaryType/text() = 'Cumulative' and GPA/GradePointAverage/text() != ''"> 
											<h3><xsl:value-of select="$Labels/Label[@key='Student.AcademicSummary.CumulativeGPA']"/> <xsl:value-of select="GPA/GradePointAverage/text()"/></h3>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="AcademicSummary">
										<xsl:if test="AcademicSummaryType/text() != 'Cumulative'"> 
											<div id="academic-summary-detail">
											<h3>
												<xsl:if test="AcademicSummaryLevel/text() != ''">
													<xsl:value-of select="AcademicSummaryLevel/text()"/>
												</xsl:if>
												<xsl:if test="AcademicSummaryType/text() != '' and AcademicSummaryType/text() != 'UserDefined'">
													&#160;(<xsl:value-of select="AcademicSummaryType/text()"/>)
												</xsl:if>
												<xsl:value-of select="$Labels/Label[@key='Student.AcademicSummary.GPA']"/> <xsl:value-of select="GPA/GradePointAverage/text()"/>
											</h3>
											<xsl:for-each select="GPA">
												<xsl:if test="GradePointAverage/text() != ''">
													<xsl:if test="CreditHoursEarned/text() != ''">
														<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSummary.GPACreditHoursEarned']"/> <xsl:value-of select="CreditHoursEarned/text()"/></span>
														<xsl:if test="CreditUnit/text() != ''">
															<span>&#160;&#160;<xsl:value-of select="$Labels/Label[@key='Student.AcademicSummary.GPACreditUnit']"/> <xsl:value-of select="CreditUnit/text()"/></span>
														</xsl:if>
														</p>
													</xsl:if>
													<xsl:if test="CreditHoursForGPA/text() != ''">
														<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSummary.GPACredits']"/> <xsl:value-of select="CreditHoursForGPA/text()"/></span></p>
													</xsl:if>
													<xsl:if test="GPARangeMinimum/text() != ''">
														<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSummary.GPARangeMinimum']"/> <xsl:value-of select="GPARangeMinimum/text()"/></span></p>
													</xsl:if>
														<xsl:if test="GPARangeMaximum/text() != ''">
														<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSummary.GPARangeMaximum']"/> <xsl:value-of select="GPARangeMaximum/text()"/></span></p>
													</xsl:if>
													<xsl:if test="NoteMessage/text() != ''">
														<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSummary.GPANote']"/> <xsl:value-of select="NoteMessage/text()"/></span></p>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:if test="Delinquencies/text() != ''">
												<span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicSummary.Delinquencies']"/> <xsl:call-template name="Enums.Delinquencies">
													<xsl:with-param name="v_enum" select="Delinquencies/text()" />
												</xsl:call-template>
												</span>
											</xsl:if>
											<xsl:for-each select="NoteMessage">
												<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSummary.Note']"/> <xsl:value-of select="text()"/></span></p>
											</xsl:for-each>
										</div>
										</xsl:if>	
									</xsl:for-each>
								</div>
							</div>
							<xsl:if test="count(Course) > 0">
								<div id="session-details" class="row">
									<div id="session-grades" class="all-columns">
										<div id="grades">
											<table class="grades-table">
												<thead>
													<th scope="cols" width="8%"><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.CourseNumber']"/></th>
													<th scope="cols" width="42%"><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.CourseTitle']"/></th>
													<th scope="cols" width="10%"><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.CourseCreditLevel']"/></th>
													<th scope="cols" width="10%"><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.CreditEarned']"/></th>
													<th scope="cols" width="10%"><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.Grade']"/></th>
													<th scope="cols" width="10%"><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.GradeStatus']"/></th>
													<th scope="cols" width="10%"><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.Language']"/></th>
												</thead>
												<xsl:for-each select="Course">
													<tr>
														<td>
															<xsl:call-template name="Course.CourseNumber" />
														</td>
														<td>
															<xsl:call-template name="Course.CourseTitle" />
														</td>
														<td>
															<xsl:call-template name="Course.HighSchoolGrade" />
														</td>
														<td class="course-credit">
															<xsl:call-template name="Course.CreditsEarned" />
														</td>
														<td class="course-grade">
															<xsl:call-template name="Course.AcademicGrade" />
														</td>
														<td>
															<xsl:call-template name="Course.GradeStatus" />
														</td>
														<td>
															<xsl:value-of select="LanguageOfInstruction/LanguageCode/text()" />
														</td>
													</tr>
													<tr>
														<td></td>
														<td>
															<xsl:if test="CourseOverrideSchool/*/text() != ''">
																<span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.School']"/> 
																<xsl:for-each select="CourseOverrideSchool/*"><xsl:call-template name="TransmissionData.OrganizationID"><xsl:with-param name="showLabel" select="'false'" /><xsl:with-param name="newLine" select="'false'" /></xsl:call-template></xsl:for-each>
																</span>
															</xsl:if>
															<xsl:if test="CourseInstructionSiteName/text() != ''">
																<span>&#160;&#160;<xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.Delivery']"/> <xsl:value-of select="CourseInstructionSiteName/text()" /></span><br />
															</xsl:if>
															<span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.Note']"/></span> 
															<xsl:for-each select="NoteMessage"><span><xsl:value-of select="text()"/>&#160;</span></xsl:for-each>
															<xsl:for-each select="./*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptCourseExtensions']/*[local-name()='CourseNote']">
																<span><xsl:value-of select="./*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptCourseExtensions']/*[local-name()='CourseNote']/text()" /></span>
															</xsl:for-each>
														</td>
														<td colspan="2">
															<xsl:if test="CourseCreditBasis/text() != ''">
																<span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.CourseCreditBasis']"/> <xsl:call-template name="Course.BasisAcademicDescription" /></span>
															</xsl:if>
															<xsl:if test="CourseCreditUnits/text() != ''">
																<span>&#160;&#160;<xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.CourseCreditUnits']"/> <xsl:call-template name="Course.CourseCreditUnits" /></span>
															</xsl:if>	
															<xsl:if test="./*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptCourseExtensions']/*[local-name()='CourseType']/text() != ''">
																<span>&#160;&#160;<xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.CourseType']"/> <xsl:value-of select="./*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptCourseExtensions']/*[local-name()='CourseType']/text()" /><br/></span>
															</xsl:if>
														</td>
														<td colspan="3">
															<xsl:if test="CourseEndDate/text() != ''">
																<span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.CourseEndDate']"/> <xsl:call-template name="Course.CourseDate" /></span>
															</xsl:if>
															<xsl:if test="CourseSupplementalAcademicGrade/CourseSupplementalGrade/CourseAcademicSupplementalGrade/text() != ''">
																<span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.SupplementalGrade']"/> <xsl:call-template name="Course.AcademicSupplementalGrade" /></span>
																<xsl:if test="CourseSupplementalAcademicGrade/CourseSupplementalGrade/CourseAcademicSupplementalGradeScaleCode/text() != ''">
																	<span>&#160;(<xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.SupplementalGradeCode']"/> <xsl:call-template name="Course.MarkCodeType" />)</span>
																</xsl:if>
															</xsl:if>
															<xsl:if test="CourseCreditValue/text() != ''">
																<span>&#160;&#160;<xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.CreditValue']"/> <xsl:call-template name="Course.CreditValue" /></span>
															</xsl:if>
															<xsl:if test="./*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptCourseExtensions']/*[local-name()='Compulsory']/text() != ''">
																<span>&#160;&#160;<xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.Required']"/> <xsl:value-of select="./*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptCourseExtensions']/*[local-name()='Compulsory']/text()" /></span>
															</xsl:if>
														</td>
													</tr>
												</xsl:for-each>
											</table>
										</div>
									</div>
								</div>
							</xsl:if>
						</div>
					</xsl:for-each>	
          			<xsl:if test="count(//Student/AcademicRecord/Course) > 0">
						<div class="session rounded-corners">
							<div id="nosession-credits" class="row">
								<div id="nosession-grades" class="all-columns">
									<div id="grades">
										<table class="grades-table">
											<thead>
												<th scope="cols" width="8%"><xsl:value-of select="$Labels/Label[@key='Student.AcademicRecord.Course.CourseNumber']"/></th>
												<th scope="cols" width="42%"><xsl:value-of select="$Labels/Label[@key='Student.AcademicRecord.Course.CourseTitle']"/></th>
												<th scope="cols" width="10%"><xsl:value-of select="$Labels/Label[@key='Student.AcademicRecord.Course.CourseCreditLevel']"/></th>
												<th scope="cols" width="10%"><xsl:value-of select="$Labels/Label[@key='Student.AcademicRecord.Course.CreditEarned']"/></th>
												<th scope="cols" width="10%"><xsl:value-of select="$Labels/Label[@key='Student.AcademicRecord.Course.Grade']"/></th>
												<th scope="cols" width="10%"><xsl:value-of select="$Labels/Label[@key='Student.AcademicRecord.Course.GradeStatus']"/></th>
												<th scope="cols" width="10%"><xsl:value-of select="$Labels/Label[@key='Student.AcademicRecord.Course.Language']"/></th>
											</thead>
											<xsl:for-each select="//Student/AcademicRecord/Course">
												<tr>
													<td>
														<xsl:call-template name="Course.CourseNumber" />
													</td>
													<td>
														<xsl:call-template name="Course.CourseTitle" />
													</td>
													<td>
														<xsl:call-template name="Course.HighSchoolGrade" />
													</td>
													<td class="course-credit">
														<xsl:call-template name="Course.CreditsEarned" />
													</td>
													<td class="course-grade">
														<xsl:call-template name="Course.AcademicGrade" />
													</td>
													<td>
														<xsl:call-template name="Course.GradeStatus" />
													</td>
													<td>
														<xsl:value-of select="LanguageOfInstruction/LanguageCode/text()" />
													</td>
												</tr>
												<tr>
													<td></td>
													<td>
														<xsl:if test="CourseOverrideSchool/*/text() != ''">
															<span><xsl:value-of select="$Labels/Label[@key='Student.AcademicRecord.Course.School']"/> 
															<xsl:for-each select="CourseOverrideSchool/*"><xsl:call-template name="TransmissionData.OrganizationID"><xsl:with-param name="showLabel" select="'false'" /><xsl:with-param name="newLine" select="'false'" /></xsl:call-template></xsl:for-each>
															</span>
														</xsl:if>
														<xsl:if test="CourseInstructionSiteName/text() != ''">
															<span>&#160;&#160;<xsl:value-of select="$Labels/Label[@key='Student.AcademicRecord.Course.Delivery']"/> <xsl:value-of select="CourseInstructionSiteName/text()" /></span><br />
														</xsl:if>
														<span><xsl:value-of select="$Labels/Label[@key='Student.AcademicRecord.Course.Note']"/></span> 
														<xsl:for-each select="NoteMessage"><span><xsl:value-of select="text()"/>&#160;</span></xsl:for-each>
														<xsl:for-each select="./*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptCourseExtensions']/*[local-name()='CourseNote']">
															<span><xsl:value-of select="./*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptCourseExtensions']/*[local-name()='CourseNote']/text()" /></span>
														</xsl:for-each>
													</td>
													<td colspan="2">
														<xsl:if test="CourseCreditBasis/text() != ''">
															<span><xsl:value-of select="$Labels/Label[@key='Student.AcademicRecord.Course.CourseCreditBasis']"/> <xsl:call-template name="Course.BasisAcademicDescription" /></span>
														</xsl:if>
														<xsl:if test="CourseCreditUnits/text() != ''">
															<span>&#160;&#160;<xsl:value-of select="$Labels/Label[@key='Student.AcademicRecord.Course.CourseCreditUnits']"/> <xsl:call-template name="Course.CourseCreditUnits" /></span>
														</xsl:if>	
														<xsl:if test="./*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptCourseExtensions']/*[local-name()='CourseType']/text() != ''">
															<span>&#160;&#160;<xsl:value-of select="$Labels/Label[@key='Student.AcademicRecord.Course.CourseType']"/> <xsl:value-of select="./*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptCourseExtensions']/*[local-name()='CourseType']/text()" /><br/></span>
														</xsl:if>
													</td>
													<td colspan="3">
														<xsl:if test="CourseEndDate/text() != ''">
															<span><xsl:value-of select="$Labels/Label[@key='Student.AcademicRecord.Course.CourseEndDate']"/> <xsl:call-template name="Course.CourseDate" /></span>
														</xsl:if>
														<xsl:if test="CourseSupplementalAcademicGrade/CourseSupplementalGrade/CourseAcademicSupplementalGrade/text() != ''">
															<span><xsl:value-of select="$Labels/Label[@key='Student.AcademicRecord.Course.SupplementalGrade']"/> <xsl:call-template name="Course.AcademicGrade" /></span>
															<xsl:if test="CourseSupplementalAcademicGrade/CourseSupplementalGrade/CourseAcademicSupplementalGradeScaleCode/text() != ''">
																<span>&#160;(<xsl:value-of select="$Labels/Label[@key='Student.AcademicRecord.Course.SupplementalGradeCode']"/> <xsl:call-template name="Course.MarkCodeType" />)</span>
															</xsl:if>
														</xsl:if>
														<xsl:if test="CourseCreditValue/text() != ''">
															<span>&#160;&#160;<xsl:value-of select="$Labels/Label[@key='Student.AcademicRecord.Course.CreditValue']"/> <xsl:call-template name="Course.CreditValue" /></span>
														</xsl:if>
														<xsl:if test="./*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptCourseExtensions']/*[local-name()='Compulsory']/text() != ''">
															<span>&#160;&#160;<xsl:value-of select="$Labels/Label[@key='Student.AcademicRecord.Course.Required']"/> <xsl:value-of select="./*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptCourseExtensions']/*[local-name()='Compulsory']/text()" /></span>
														</xsl:if>
													</td>
												</tr>
											</xsl:for-each>
										</table>
									</div>
								</div>
							</div>
						</div>
					</xsl:if>				
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
