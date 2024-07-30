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
        <html>
			<head>
                <style type="text/css">
                    <xsl:value-of select="$Styles/Transcript"/>
                </style>
			</head>
			<body>
				<div id="transcript-container">
					<div id="transmission-data" class="row">
						<div class="left-column">
							<div id="destination-institution">
								<h2>Recipient</h2>
								<p><span>Institution: <xsl:call-template name="TransmissionData.DestinationInstitutionName" /></span></p>
								<xsl:choose>
									<xsl:when test="//TransmissionData/Destination/Organization/CSIS/text() != ''">
										<p><span>CSIS: <xsl:value-of select="//TransmissionData/Destination/Organization/CSIS/text()"/></span></p>
									</xsl:when>
									<xsl:when test="//TransmissionData/Destination/Organization/USIS/text() != ''">
										<p><span>USIS: <xsl:value-of select="//TransmissionData/Destination/Organization/USIS/text()"/></span></p>
									</xsl:when>
									<xsl:when test="//TransmissionData/Destination/Organization/PSIS/text() != ''">
										<p><span>PSIS: <xsl:value-of select="//TransmissionData/Destination/Organization/PSIS/text()"/></span></p>
									</xsl:when>
                  					<xsl:when test="//TransmissionData/Destination/Organization/ESIS/text() != ''">
										<p><span>PSIS: <xsl:value-of select="//TransmissionData/Destination/Organization/ESIS/text()"/></span></p>
									</xsl:when>
									<xsl:otherwise><p><span>ID: <xsl:call-template name="TransmissionData.DestinationInstitutionCode" /></span></p></xsl:otherwise>
								</xsl:choose>
								
							</div>
						</div>
						<div class="centre-column  rounded-corners">
							<div id="source-institution">
								<img class="logo"/>
								<h1><xsl:call-template name="TransmissionData.SourceInstitutionName" /></h1>
								<h2><xsl:choose>
									<xsl:when test="//TransmissionData/Source/Organization/CSIS/text() != ''">
										<span>CSIS: <xsl:value-of select="//TransmissionData/Source/Organization/CSIS/text()"/></span>
									</xsl:when>
									<xsl:when test="//TransmissionData/Source/Organization/USIS/text() != ''">
										<span>USIS: <xsl:value-of select="//TransmissionData/Source/Organization/USIS/text()"/></span>
									</xsl:when>
									<xsl:when test="//TransmissionData/Source/Organization/PSIS/text() != ''">
										<span>PSIS: <xsl:value-of select="//TransmissionData/Source/Organization/PSIS/text()"/></span>
									</xsl:when>
                  					<xsl:when test="//TransmissionData/Source/Organization/PSIS/text() != ''">
										<span>ESIS: <xsl:value-of select="//TransmissionData/Source/Organization/PSIS/text()"/></span>
									</xsl:when>
									<xsl:otherwise><span>ID: <xsl:call-template name="TransmissionData.DestinationInstitutionCode" /></span></xsl:otherwise>
								</xsl:choose></h2>
								<p>&#160;</p>
								<!-- TODO: Address block -->
								<xsl:if test="count(//TransmissionData/Source/Organization/Contacts) > 0">
									<p><span>Contact: <xsl:call-template name="ContactInformation.Name" /></span></p>
								</xsl:if>
								<xsl:for-each select="//TransmissionData/NoteMessage">
									<p><span><xsl:value-of select="text()"/></span></p>
								</xsl:for-each>
                				<xsl:for-each select="//HighSchoolTranscript/NoteMessage">
									<p><span><xsl:value-of select="text()"/></span></p>
								</xsl:for-each>
								<p><span>Reference: <xsl:call-template name="TransmissionData.RequestTrackingID" /></span></p>
							</div>
						</div>
						<div class="right-column">
							<div id="transcript-information">
								<h2>Transcript Issue Date</h2>
								<p><span><xsl:call-template name="TransmissionData.CreatedDate" /></span></p>
							</div>
						</div>
					</div>
					<div id="student-summary" class="row">
						<div id="student-information" class="left-column rounded-corners">
							<h2>Student Information</h2>
							<p><span>Surname: <xsl:call-template name="StudentInformation.getIndividualName"><xsl:with-param name="individualNameElement" select="'LastName'" /></xsl:call-template></span></p>
							<p><span>First Name: <xsl:call-template name="StudentInformation.getIndividualName"><xsl:with-param name="individualNameElement" select="'FirstName'" /></xsl:call-template></span></p>
							<xsl:if test="//*[local-name()='Student']/*[local-name()='Person']/*[local-name()='Name']/*[local-name()='MiddleName'] != ''">
								<p><span>Middle Name: <xsl:call-template name="StudentInformation.getIndividualName"><xsl:with-param name="individualNameElement" select="'MiddleName'" /></xsl:call-template></span></p>
							</xsl:if>
							<xsl:if test="//*[local-name()='Student']/*[local-name()='Person']/*[local-name()='AlternateName']/*[local-name()='LastName'] != ''">
								<p><span>Former Surname: <xsl:call-template name="StudentInformation.getIndividualName"><xsl:with-param name="individualNameElement" select="'FormerLastName'" /></xsl:call-template></span></p>
							</xsl:if>
							<p><span>Date of Birth: <xsl:call-template name="StudentInformation.DateOfBirth" /></span></p>
							<p><span>Gender: <xsl:call-template name="StudentInformation.StudentGender"><xsl:with-param name="GenderMale" select="'Male'" /><xsl:with-param name="GenderFemale" select="'Female'" /><xsl:with-param name="GenderUnreported" select="'Unreported'" /></xsl:call-template></span></p>
							<p><span>Student Number: <xsl:call-template name="StudentInformation.StudentID" /></span></p>
							<p><span>Government Identifier: <xsl:call-template name="StudentInformation.GovernmentId" /></span></p>
							<xsl:for-each select="//Student/NoteMessage">
								<p><span>Note: <xsl:value-of select="text()"/></span></p>
							</xsl:for-each>
						</div>
						<div id="academic-awards" class="centre-column rounded-corners">
							<h2>Academic Awards</h2>
							<xsl:for-each select="//*[local-name()='Student']/*[local-name()='AcademicRecord']/*[local-name()='AcademicAward']">
								<xsl:if test="AcademicAwardDate/text() != ''">
									<div>
										<xsl:if test="AcademicAwardTitle/text() != ''">
											<h3>
												<xsl:call-template name="AcademicAward.AcademicDegreeDescription" />
											</h3>
										</xsl:if>
										<xsl:if test="AcademicAwardDate/text() != ''">
											<p><span>Award Date: <xsl:call-template name="AcademicAward.DateDegreeAwarded" /></span></p>
										</xsl:if>
										<xsl:if test="AcademicAwardLevel/text() != ''">
											<p><span>Award Level: <xsl:call-template name="AcademicAward.AcademicDegreeCode" /></span></p>
										</xsl:if>
										<xsl:for-each select="AcademicAwardProgram">
											<p><xsl:if test="AcademicProgramName/text() != ''">
												<span>Program: <xsl:apply-templates select="AcademicProgramName"/></span>
											</xsl:if>
											<xsl:if test="AcademicProgramType/text() != ''">
												<span> (<xsl:apply-templates select="AcademicProgramType"/>)</span>
											</xsl:if>
											</p>
										</xsl:for-each>
										<xsl:if test="AcademicHonors/HonorsLevel/text() != ''">
											<p><span>Honours Level: <xsl:call-template name="AcademicAward.HonoursLevel" /></span></p>
										</xsl:if>
										<xsl:if test="AcademicAwardProgram/NoteMessage/text() != ''">
											<p><span>Note: <xsl:call-template name="AcademicAwardProgram.Note" /></span></p>
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
											<p><span>Award Date: <xsl:call-template name="AcademicAward.DateDegreeAwarded" /></span></p>
										</xsl:if>
										<xsl:if test="AcademicAwardLevel/text() != ''">
											<p><span>Award Level: <xsl:call-template name="AcademicAward.AcademicDegreeCode" /></span></p>
										</xsl:if>
										<xsl:for-each select="AcademicAwardProgram">
											<p><xsl:if test="AcademicProgramName/text() != ''">
												<span>Program: <xsl:apply-templates select="AcademicProgramName"/></span>
											</xsl:if>
											<xsl:if test="AcademicProgramType/text() != ''">
												<span> (<xsl:apply-templates select="AcademicProgramType"/>)</span>
											</xsl:if>
											</p>
										</xsl:for-each>
										<xsl:if test="AcademicHonors/HonorsLevel/text() != ''">
											<p><span>Honours Level: <xsl:call-template name="AcademicAward.HonoursLevel" /></span></p>
										</xsl:if>
										<xsl:if test="AcademicAwardProgram/NoteMessage/text() != ''">
											<p><span>Note: <xsl:call-template name="AcademicAwardProgram.Note" /></span></p>
										</xsl:if>	
									</div>
								</xsl:if>
							</xsl:for-each>
						</div>
						<div id="academic-summary" class="right-column rounded-corners">
							<h2>School</h2> 
							<xsl:for-each select="//Student/AcademicRecord/School">
								<xsl:if test="string-length(OrganizationName/text()) != 0">
								   
								<h3><xsl:value-of select="OrganizationName/text()"/></h3>
									<xsl:if test="string-length(ESIS/text()) != 0">
										<p><span>School ID: <xsl:value-of select="ESIS/text()"/></span></p>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//Student/AcademicRecord/AcademicSession/School">
								<xsl:if test="string-length(OrganizationName/text()) != 0">
								<h3><xsl:value-of select="OrganizationName/text()"/></h3>
								<xsl:if test="string-length(ESIS/text()) != 0">
									<p><span>School ID: <xsl:value-of select="ESIS/text()"/></span></p>
								</xsl:if>
								</xsl:if>
							</xsl:for-each>
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
									<h3>Session: <xsl:value-of select="AcademicSessionDetail/SessionDesignator/text()"/></h3>
									<span>Start Date: <xsl:call-template name="Formatting.string_date_xml"><xsl:with-param name="date" select="AcademicSessionDetail/SessionBeginDate/text()"/></xsl:call-template></span>
									<span>&#160;&#160;End Date: <xsl:call-template name="Formatting.string_date_xml"><xsl:with-param name="date" select="AcademicSessionDetail/SessionEndDate/text()"/></xsl:call-template></span>
								</div>
								<div class="right-column">
									<xsl:for-each select="AcademicSummary">
										<xsl:if test="AcademicSummaryType/text() = 'Cumulative' and GPA/GradePointAverage/text() != ''"> 
											<h3>Cumulative GPA: <xsl:value-of select="GPA/GradePointAverage/text()"/></h3>
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
												GPA: <xsl:value-of select="GPA/GradePointAverage/text()"/>
											</h3>
											<xsl:for-each select="GPA">
												<xsl:if test="GradePointAverage/text() != ''">
													<xsl:if test="CreditHoursEarned/text() != ''">
														<p><span>Credit Hours Earned: <xsl:value-of select="CreditHoursEarned/text()"/></span>
														<xsl:if test="CreditUnit/text() != ''">
															<span>&#160;&#160;Credit Unit: <xsl:value-of select="CreditUnit/text()"/></span>
														</xsl:if>
														</p>
													</xsl:if>
													<xsl:if test="CreditHoursForGPA/text() != ''">
														<p><span>Credits in GPA: <xsl:value-of select="CreditHoursForGPA/text()"/></span></p>
													</xsl:if>
													<xsl:if test="GPARangeMinimum/text() != ''">
														<p><span>Range Minimum: <xsl:value-of select="GPARangeMinimum/text()"/></span></p>
													</xsl:if>
														<xsl:if test="GPARangeMaximum/text() != ''">
														<p><span>Range Maximum: <xsl:value-of select="GPARangeMaximum/text()"/></span></p>
													</xsl:if>
													<xsl:if test="NoteMessage/text() != ''">
														<p><span>Note: <xsl:value-of select="NoteMessage/text()"/></span></p>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:if test="Delinquencies/text() != ''">
												<span>Standing: <xsl:call-template name="Enums.Delinquencies">
													<xsl:with-param name="v_enum" select="Delinquencies/text()" />
												</xsl:call-template>
												</span>
											</xsl:if>
											<xsl:for-each select="NoteMessage">
												<p><span>Note: <xsl:value-of select="text()"/></span></p>
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
													<th scope="cols" width="8%">Course No</th>
													<th scope="cols" width="42%">Course Title</th>
													<th scope="cols" width="10%">Grade</th>
													<th scope="cols" width="10%">Credit Earned</th>
													<th scope="cols" width="10%">% Grade</th>
													<th scope="cols" width="10%">Grade Status</th>
													<th scope="cols" width="10%">Lang</th>
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
														<td>
															<xsl:call-template name="Course.CreditsEarned" />
														</td>
														<td>
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
															<xsl:if test="CourseOverrideSchool/ESIS/text() != ''">
																<span>School ID: <xsl:value-of select="CourseOverrideSchool/ESIS/text()" /></span>
															</xsl:if>
															<xsl:if test="CourseInstructionSiteName/text() != ''">
																<span>&#160;&#160;Delivery: <xsl:value-of select="CourseInstructionSiteName/text()" /></span><br />
															</xsl:if>
															<span>Notes:</span> 
															<xsl:for-each select="NoteMessage"><span><xsl:value-of select="text()"/>&#160;</span></xsl:for-each>
															<xsl:for-each select="./*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptCourseExtensions']/*[local-name()='CourseNote']">
																<span><xsl:value-of select="./*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptCourseExtensions']/*[local-name()='CourseNote']/text()" /></span>
															</xsl:for-each>
														</td>
														<td colspan="2">
															<xsl:if test="CourseCreditBasis/text() != ''">
																<span>Basis: <xsl:call-template name="Course.BasisAcademicDescription" /></span>
															</xsl:if>
															<xsl:if test="CourseCreditUnits/text() != ''">
																<span>&#160;&#160;Units: <xsl:call-template name="Course.CourseCreditUnits" /></span>
															</xsl:if>	
															<xsl:if test="./*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptCourseExtensions']/*[local-name()='CourseType']/text() != ''">
																<span>&#160;&#160;Type: <xsl:value-of select="./*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptCourseExtensions']/*[local-name()='CourseType']/text()" /><br/></span>
															</xsl:if>
														</td>
														<td colspan="3">
															<xsl:if test="CourseEndDate/text() != ''">
																<span>Completed: <xsl:call-template name="Course.CourseDate" /></span>
															</xsl:if>
															<xsl:if test="CourseSupplementalAcademicGrade/CourseSupplementalGrade/CourseAcademicSupplementalGrade/text() != ''">
																<span>Supplemental Grade: <xsl:call-template name="Course.AcademicSupplementalGrade" /></span>
																<xsl:if test="CourseSupplementalAcademicGrade/CourseSupplementalGrade/CourseAcademicSupplementalGradeScaleCode/text() != ''">
																	<span>&#160;(Code: <xsl:call-template name="Course.MarkCodeType" />)</span>
																</xsl:if>
															</xsl:if>
															<xsl:if test="CourseCreditValue/text() != ''">
																<span>&#160;&#160;Credit Value: <xsl:call-template name="Course.CreditValue" /></span>
															</xsl:if>
															<xsl:if test="./*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptCourseExtensions']/*[local-name()='Compulsory']/text() != ''">
																<span>&#160;&#160;Required: <xsl:value-of select="./*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptCourseExtensions']/*[local-name()='Compulsory']/text()" /></span>
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
												<th scope="cols" width="8%">Course No</th>
												<th scope="cols" width="42%">Course Title</th>
												<th scope="cols" width="10%">Grade</th>
												<th scope="cols" width="10%">Credit Earned</th>
												<th scope="cols" width="10%">% Grade</th>
												<th scope="cols" width="10%">Grade Status</th>
												<th scope="cols" width="10%">Lang</th>
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
													<td>
														<xsl:call-template name="Course.CreditsEarned" />
													</td>
													<td>
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
														<xsl:if test="CourseOverrideSchool/ESIS/text() != ''">
															<span>School ID: <xsl:value-of select="CourseOverrideSchool/ESIS/text()" /></span>
														</xsl:if>
														<xsl:if test="CourseInstructionSiteName/text() != ''">
															<span>&#160;&#160;Delivery: <xsl:value-of select="CourseInstructionSiteName/text()" /></span><br />
														</xsl:if>
														<span>Notes:</span> 
														<xsl:for-each select="NoteMessage"><span><xsl:value-of select="text()"/>&#160;</span></xsl:for-each>
														<xsl:for-each select="./*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptCourseExtensions']/*[local-name()='CourseNote']">
															<span><xsl:value-of select="./*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptCourseExtensions']/*[local-name()='CourseNote']/text()" /></span>
														</xsl:for-each>
													</td>
													<td colspan="2">
														<xsl:if test="CourseCreditBasis/text() != ''">
															<span>Basis: <xsl:call-template name="Course.BasisAcademicDescription" /></span>
														</xsl:if>
														<xsl:if test="CourseCreditUnits/text() != ''">
															<span>&#160;&#160;Units: <xsl:call-template name="Course.CourseCreditUnits" /></span>
														</xsl:if>	
														<xsl:if test="./*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptCourseExtensions']/*[local-name()='CourseType']/text() != ''">
															<span>&#160;&#160;Type: <xsl:value-of select="./*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptCourseExtensions']/*[local-name()='CourseType']/text()" /><br/></span>
														</xsl:if>
													</td>
													<td colspan="3">
														<xsl:if test="CourseEndDate/text() != ''">
															<span>Completed: <xsl:call-template name="Course.CourseDate" /></span>
														</xsl:if>
														<xsl:if test="CourseSupplementalAcademicGrade/CourseSupplementalGrade/CourseAcademicSupplementalGrade/text() != ''">
															<span>Supplemental Grade: <xsl:call-template name="Course.AcademicGrade" /></span>
															<xsl:if test="CourseSupplementalAcademicGrade/CourseSupplementalGrade/CourseAcademicSupplementalGradeScaleCode/text() != ''">
																<span>&#160;(Code: <xsl:call-template name="Course.MarkCodeType" />)</span>
															</xsl:if>
														</xsl:if>
														<xsl:if test="CourseCreditValue/text() != ''">
															<span>&#160;&#160;Credit Value: <xsl:call-template name="Course.CreditValue" /></span>
														</xsl:if>
														<xsl:if test="./*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptCourseExtensions']/*[local-name()='Compulsory']/text() != ''">
															<span>&#160;&#160;Required: <xsl:value-of select="./*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptCourseExtensions']/*[local-name()='Compulsory']/text()" /></span>
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
