<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Gender -->
  <xsl:template name="Enums.GenderCode">
    <xsl:param name="v_enum"/>
    <xsl:choose>
      <xsl:when test="$Locale='fr-CA'">
        <xsl:choose>
          <xsl:when test="$v_enum='Male'">masculin</xsl:when>
          <xsl:when test="$v_enum='Female'">féminin</xsl:when>
          <xsl:otherwise>non déclarée</xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="$v_enum='Male'">Male</xsl:when>
          <xsl:when test="$v_enum='Female'">Female</xsl:when>
          <xsl:otherwise>Unreported</xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Academic Program -->
  <xsl:template name="Enums.AcademicProgramType">
    <xsl:param name="v_enum"/>
    <xsl:choose>
      <xsl:when test="$Locale='fr-CA'">
        <xsl:if test="$v_enum='Concentration'">Concentration</xsl:if>
        <xsl:if test="$v_enum='Focus'">Spécialisation</xsl:if>
        <xsl:if test="$v_enum='Major'">Majeure</xsl:if>
        <xsl:if test="$v_enum='SecondMajor'">Deuxième Majeure</xsl:if>
        <xsl:if test="$v_enum='Minor'">Mineure</xsl:if>
        <xsl:if test="$v_enum='Specialization'">Spécialisation</xsl:if>
        <xsl:if test="$v_enum='C'">Concentration</xsl:if>
        <xsl:if test="$v_enum='E'">Spécialisation</xsl:if>
        <xsl:if test="$v_enum='G'">Diplôme d'études supérieures non crédité</xsl:if>
        <xsl:if test="$v_enum='L'">Licence</xsl:if>
        <xsl:if test="$v_enum='M'">Majeure</xsl:if>
        <xsl:if test="$v_enum='N'">Mineure</xsl:if>
        <xsl:if test="$v_enum='S'">Spécialisation</xsl:if>
        <xsl:if test="$v_enum='T'">Enseignement</xsl:if>
        <xsl:if test="$v_enum='V'">Chercheur invité</xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="$v_enum='Concentration'">Concentration</xsl:if>
        <xsl:if test="$v_enum='Focus'">Endorsement</xsl:if>
        <xsl:if test="$v_enum='Major'">Major</xsl:if>
        <xsl:if test="$v_enum='SecondMajor'">Second Major</xsl:if>
        <xsl:if test="$v_enum='Minor'">Minor</xsl:if>
        <xsl:if test="$v_enum='Specialization'">Specialization</xsl:if>
        <xsl:if test="$v_enum='C'">Concentration</xsl:if>
        <xsl:if test="$v_enum='E'">Endorsement</xsl:if>
        <xsl:if test="$v_enum='G'">Graduate Non-Degree</xsl:if>
        <xsl:if test="$v_enum='L'">Licensing</xsl:if>
        <xsl:if test="$v_enum='M'">Major</xsl:if>
        <xsl:if test="$v_enum='N'">Minor</xsl:if>
        <xsl:if test="$v_enum='S'">Specialization</xsl:if>
        <xsl:if test="$v_enum='T'">Teaching</xsl:if>
        <xsl:if test="$v_enum='V'">Visiting Scholar</xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Academic Awards -->
  <xsl:template name="Enums.AcademicAwardLevel">
    <xsl:param name="v_enum"/>
    <xsl:choose>
      <xsl:when test="$Locale='fr-CA'">
        <xsl:if test="$v_enum='0.0'">Autre</xsl:if>
        <xsl:if test="$v_enum='2.0'">Non-Diplôme de premier cycle</xsl:if>
        <xsl:if test="$v_enum='2.1'">Certificat ou diplôme postsecondaire (moins d'un an)</xsl:if>
        <xsl:if test="$v_enum='2.2'">Certificat ou diplôme postsecondaire (un an ou plus mais moins de quatre ans)</xsl:if>
        <xsl:if test="$v_enum='2.3'">Diplôme d'associé</xsl:if>
        <xsl:if test="$v_enum='2.4'">Diplôme de baccalauréat</xsl:if>
        <xsl:if test="$v_enum='2.5'">Diplôme de baccalauréat (avec distinction)</xsl:if>
        <xsl:if test="$v_enum='2.6'">Certificat ou diplôme postsecondaire (un an ou plus mais moins de deux ans)</xsl:if>
        <xsl:if test="$v_enum='2.7'">Certificat ou diplôme postsecondaire (deux ans ou plus mais moins de quatre ans)</xsl:if>
        <xsl:if test="$v_enum='3.0'">Diplôme professionnel d'études supérieures</xsl:if>
        <xsl:if test="$v_enum='3.1'">Premier diplôme professionnel</xsl:if>
        <xsl:if test="$v_enum='3.2'">Diplôme post-professionnel</xsl:if>
        <xsl:if test="$v_enum='4.0'">Non-Diplôme d'études supérieures</xsl:if>
        <xsl:if test="$v_enum='4.1'">Certificat d'études supérieures</xsl:if>
        <xsl:if test="$v_enum='4.2'">Diplôme de maîtrise</xsl:if>
        <xsl:if test="$v_enum='4.3'">Diplôme d'études supérieures intermédiaire</xsl:if>
        <xsl:if test="$v_enum='4.4'">Diplôme de doctorat</xsl:if>
        <xsl:if test="$v_enum='4.5'">Diplôme post-doctoral</xsl:if>
        <xsl:if test="$v_enum='B35'">Mention très honorable</xsl:if>
        <xsl:if test="$v_enum='B36'">Deuxième mention très honorable</xsl:if>
        <xsl:if test="$v_enum='B37'">Troisième mention très honorable</xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="$v_enum='0.0'">Other</xsl:if>
        <xsl:if test="$v_enum='2.0'">Undergraduate Non-Degree</xsl:if>
        <xsl:if test="$v_enum='2.1'">Postsecondary Certificate or Diploma (less than one year)</xsl:if>
        <xsl:if test="$v_enum='2.2'">Postsecondary Certificate or Diploma (one year or more but less than four years)</xsl:if>
        <xsl:if test="$v_enum='2.3'">Associate Degree</xsl:if>
        <xsl:if test="$v_enum='2.4'">Baccalaureate Degree</xsl:if>
        <xsl:if test="$v_enum='2.5'">Baccalaureate (Honours) Degree</xsl:if>
        <xsl:if test="$v_enum='2.6'">Postsecondary Certificate or Diploma (one year or more but less than two years)</xsl:if>
        <xsl:if test="$v_enum='2.7'">Postsecondary Certificate or Diploma (two year or more but less than four years)</xsl:if>
        <xsl:if test="$v_enum='3.0'">Graduate Professional</xsl:if>
        <xsl:if test="$v_enum='3.1'">First Professional Degree</xsl:if>
        <xsl:if test="$v_enum='3.2'">Post-Professional Degree</xsl:if>
        <xsl:if test="$v_enum='4.0'">Graduate Non-Degree</xsl:if>
        <xsl:if test="$v_enum='4.1'">Graduate Certificate</xsl:if>
        <xsl:if test="$v_enum='4.2'">Master's Degree</xsl:if>
        <xsl:if test="$v_enum='4.3'">Intermediate Graduate Degree</xsl:if>
        <xsl:if test="$v_enum='4.4'">Doctoral Degree</xsl:if>
        <xsl:if test="$v_enum='4.5'">Post-Doctoral Degree</xsl:if>
        <xsl:if test="$v_enum='B35'">Highest Honors</xsl:if>
        <xsl:if test="$v_enum='B36'">Second Highest Honors</xsl:if>
        <xsl:if test="$v_enum='B37'">Third Highest Honors</xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Academic Honors -->
  <xsl:template name="Enums.HonorsLevel">
    <xsl:param name="v_enum"/>
    <xsl:choose>
      <xsl:when test="$Locale='fr-CA'">
        <xsl:if test="$v_enum='FirstHighest'">Mention très honorable</xsl:if>
        <xsl:if test="$v_enum='SecondHighest'">Deuxième mention très honorable</xsl:if>
        <xsl:if test="$v_enum='ThirdHighest'">Troisième mention très honorable</xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="$v_enum='FirstHighest'">Highest Honors</xsl:if>
        <xsl:if test="$v_enum='SecondHighest'">Second Highest Honors</xsl:if>
        <xsl:if test="$v_enum='ThirdHighest'">Third Highest Honors</xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Courses -->
  <xsl:template name="Enums.CourseAcademicGradeStatusCode">
    <xsl:param name="v_enum"/>
    <xsl:choose>
      <xsl:when test="$Locale='fr-CA'">
        <xsl:if test="$v_enum='AuditedCourse'">Audité</xsl:if>
        <xsl:if test="$v_enum='HonorsGrade'">Mention d'honneur</xsl:if>
        <xsl:if test="$v_enum='Incomplete'">Incomplet</xsl:if>
        <xsl:if test="$v_enum='IncompleteNotResolvedFail'">Incomplet (Échec)</xsl:if>
        <xsl:if test="$v_enum='InProgress'">En cours</xsl:if>
        <xsl:if test="$v_enum='NotYetReported'">Pas encore rapporté</xsl:if>
        <xsl:if test="$v_enum='OtherFail'">Échec (Autre)</xsl:if>
        <xsl:if test="$v_enum='OtherPass'">Réussite (Autre)</xsl:if>
        <xsl:if test="$v_enum='PassFailFail'">Échec</xsl:if>
        <xsl:if test="$v_enum='PassFailPass'">Réussite</xsl:if>
        <xsl:if test="$v_enum='TransferNoGrade'">Crédit de transfert</xsl:if>
        <xsl:if test="$v_enum='Withdrew'">Retiré</xsl:if>
        <xsl:if test="$v_enum='WithdrewFailing'">Retiré (Échec)</xsl:if>
        <xsl:if test="$v_enum='WithdrewNoPenalty'">Retiré (Sans pénalité)</xsl:if>
        <xsl:if test="$v_enum='WithdrewPassing'">Retiré (Réussite)</xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="$v_enum='AuditedCourse'">Audited</xsl:if>
        <xsl:if test="$v_enum='HonorsGrade'">Honours</xsl:if>
        <xsl:if test="$v_enum='Incomplete'">Incomplete</xsl:if>
        <xsl:if test="$v_enum='IncompleteNotResolvedFail'">Incomplete Fail</xsl:if>
        <xsl:if test="$v_enum='InProgress'">In Progress</xsl:if>
        <xsl:if test="$v_enum='NotYetReported'">Not Yet Reported</xsl:if>
        <xsl:if test="$v_enum='OtherFail'">Fail (Other)</xsl:if>
        <xsl:if test="$v_enum='OtherPass'">Pass (Other)</xsl:if>
        <xsl:if test="$v_enum='PassFailFail'">Fail</xsl:if>
        <xsl:if test="$v_enum='PassFailPass'">Pass</xsl:if>
        <xsl:if test="$v_enum='TransferNoGrade'">Transfer credit</xsl:if>
        <xsl:if test="$v_enum='Withdrew'">Withdrawn</xsl:if>
        <xsl:if test="$v_enum='WithdrewFailing'">Withdrawn (Failing)</xsl:if>
        <xsl:if test="$v_enum='WithdrewNoPenalty'">Withdrawn (No Penalty)</xsl:if>
        <xsl:if test="$v_enum='WithdrewPassing'">Withdrawn (Passing)</xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Course Credit Basis -->
  <xsl:template name="Enums.CourseCreditBasis">
    <xsl:param name="v_enum"/>
    <xsl:choose>
      <xsl:when test="$Locale='fr-CA'">
        <xsl:if test="$v_enum='Regular'">Régulier</xsl:if>
        <xsl:if test="$v_enum='AcademicRenewal'">Renouvellement académique</xsl:if>
        <xsl:if test="$v_enum='AdvancedPlacement'">Placement avancé</xsl:if>
        <xsl:if test="$v_enum='AdvancedStanding'">Positionnement avancé</xsl:if>
        <xsl:if test="$v_enum='ContinuingEducation'">Éducation permanente</xsl:if>
        <xsl:if test="$v_enum='Correspondence'">Correspondance</xsl:if>
        <xsl:if test="$v_enum='Exemption'">Exemption</xsl:if>
        <xsl:if test="$v_enum='Equivalence'">Équivalence</xsl:if>
        <xsl:if test="$v_enum='InternationalBaccalaureate'">Baccalauréat international</xsl:if>
        <xsl:if test="$v_enum='Military'">Militaire</xsl:if>
        <xsl:if test="$v_enum='Remedial'">Remédiation</xsl:if>
        <xsl:if test="$v_enum='CreditByExam'">Crédit par examen</xsl:if>
        <xsl:if test="$v_enum='HighSchoolTransferCredit'">Crédit de transfert d'école secondaire</xsl:if>
        <xsl:if test="$v_enum='HighSchoolCreditOnly'">Crédit d'école secondaire seulement</xsl:if>
        <xsl:if test="$v_enum='HighSchoolDualCredit'">Crédit d'école secondaire simultané</xsl:if>
        <xsl:if test="$v_enum='JuniorHighSchoolCredit'">Crédit d'école secondaire intermédiaire</xsl:if>
        <xsl:if test="$v_enum='Major'">Majeur</xsl:if>
        <xsl:if test="$v_enum='AdultBasic'">Formation de base pour adultes</xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="$v_enum='Regular'">Regular</xsl:if>
        <xsl:if test="$v_enum='AcademicRenewal'">Academic Renewal</xsl:if>
        <xsl:if test="$v_enum='AdvancedPlacement'">Advanced Placement</xsl:if>
        <xsl:if test="$v_enum='AdvancedStanding'">Advanced Standing</xsl:if>
        <xsl:if test="$v_enum='ContinuingEducation'">Continuing Education</xsl:if>
        <xsl:if test="$v_enum='Correspondence'">Correspondence</xsl:if>
        <xsl:if test="$v_enum='Exemption'">Exemption</xsl:if>
        <xsl:if test="$v_enum='Equivalence'">Equivalence</xsl:if>
        <xsl:if test="$v_enum='InternationalBaccalaureate'">International Baccalaureate</xsl:if>
        <xsl:if test="$v_enum='Military'">Military</xsl:if>
        <xsl:if test="$v_enum='Remedial'">Remedial</xsl:if>
        <xsl:if test="$v_enum='CreditByExam'">Credit By Exam</xsl:if>
        <xsl:if test="$v_enum='HighSchoolTransferCredit'">High School Transfer Credit</xsl:if>
        <xsl:if test="$v_enum='HighSchoolCreditOnly'">High School Credit Only</xsl:if>
        <xsl:if test="$v_enum='HighSchoolDualCredit'">High School Dual Credit</xsl:if>
        <xsl:if test="$v_enum='JuniorHighSchoolCredit'">Junior High School Credit</xsl:if>
        <xsl:if test="$v_enum='Major'">Major</xsl:if>
        <xsl:if test="$v_enum='AdultBasic'">Adult Basic</xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Course Credit Units -->
  <xsl:template name="Enums.CourseCreditUnits">
    <xsl:param name="v_enum"/>
    <xsl:choose>
      <xsl:when test="$Locale='fr-CA'">
        <xsl:if test="$v_enum='NoCredit'">Aucun crédit</xsl:if>
        <xsl:if test="$v_enum='Quarter'">Trimestre</xsl:if>
        <xsl:if test="$v_enum='Semester'">Semestre</xsl:if>
        <xsl:if test="$v_enum='Units'">Unités</xsl:if>
        <xsl:if test="$v_enum='ClockHours'">Heures de cours</xsl:if>
        <xsl:if test="$v_enum='CarnegieUnits'">Unités Carnegie</xsl:if>
        <xsl:if test="$v_enum='ContinuingEducationUnits'">Unités de formation continue</xsl:if>
        <xsl:if test="$v_enum='Unreported'">Non signalé</xsl:if>
        <xsl:if test="$v_enum='Other'">Autre</xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="$v_enum='NoCredit'">No Credit</xsl:if>
        <xsl:if test="$v_enum='Quarter'">Quarter</xsl:if>
        <xsl:if test="$v_enum='Semester'">Semester</xsl:if>
        <xsl:if test="$v_enum='Units'">Units</xsl:if>
        <xsl:if test="$v_enum='ClockHours'">Clock Hours</xsl:if>
        <xsl:if test="$v_enum='CarnegieUnits'">Carnegie Units</xsl:if>
        <xsl:if test="$v_enum='ContinuingEducationUnits'">Continuing Education Units</xsl:if>
        <xsl:if test="$v_enum='Unreported'">Unreported</xsl:if>
        <xsl:if test="$v_enum='Other'">Other</xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Course Credit Level -->
  <xsl:template name="Enums.CourseCreditLevel">
    <xsl:param name="v_enum"/>
    <xsl:choose>
      <xsl:when test="$Locale='fr-CA'">
        <xsl:if test="$v_enum='SeventhGrade'">Septième année</xsl:if>
        <xsl:if test="$v_enum='EighthGrade'">Huitième année</xsl:if>
        <xsl:if test="$v_enum='NinthGrade'">Neuvième année</xsl:if>
        <xsl:if test="$v_enum='TenthGrade'">Dixième année</xsl:if>
        <xsl:if test="$v_enum='EleventhGrade'">Onzième année</xsl:if>
        <xsl:if test="$v_enum='TwelfthGrade'">Douzième année</xsl:if>
        <xsl:if test="$v_enum='Dual'">Double</xsl:if>
        <xsl:if test="$v_enum='DualGraduateUndergraduate'">Double Diplôme - Diplômé/Premier cycle</xsl:if>
        <xsl:if test="$v_enum='DualHighSchoolCollege'">Double Diplôme - Secondaire/Postsecondaire</xsl:if>
        <xsl:if test="$v_enum='Graduate'">Diplômé</xsl:if>
        <xsl:if test="$v_enum='GraduateProfessional'">Diplômé Professionnel</xsl:if>
        <xsl:if test="$v_enum='LowerDivision'">Division Inférieure</xsl:if>
        <xsl:if test="$v_enum='Professional'">Professionnel</xsl:if>
        <xsl:if test="$v_enum='Secondary'">Secondaire</xsl:if>
        <xsl:if test="$v_enum='TechnicalPreparatory'">Préparatoire Technique</xsl:if>
        <xsl:if test="$v_enum='Undergraduate'">Premier cycle</xsl:if>
        <xsl:if test="$v_enum='UpperDivision'">Division Supérieure</xsl:if>
        <xsl:if test="$v_enum='Vocational'">Vocationnel</xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="$v_enum='SeventhGrade'">Seventh Grade</xsl:if>
        <xsl:if test="$v_enum='EighthGrade'">Eighth Grade</xsl:if>
        <xsl:if test="$v_enum='NinthGrade'">Ninth Grade</xsl:if>
        <xsl:if test="$v_enum='TenthGrade'">Tenth Grade</xsl:if>
        <xsl:if test="$v_enum='EleventhGrade'">Eleventh Grade</xsl:if>
        <xsl:if test="$v_enum='TwelfthGrade'">Twelfth Grade</xsl:if>
        <xsl:if test="$v_enum='Dual'">Dual</xsl:if>
        <xsl:if test="$v_enum='DualGraduateUndergraduate'">Dual Graduate Undergraduate</xsl:if>
        <xsl:if test="$v_enum='DualHighSchoolCollege'">Dual High School College</xsl:if>
        <xsl:if test="$v_enum='Graduate'">Graduate</xsl:if>
        <xsl:if test="$v_enum='GraduateProfessional'">Graduate Professional</xsl:if>
        <xsl:if test="$v_enum='LowerDivision'">Lower Division</xsl:if>
        <xsl:if test="$v_enum='Professional'">Professional</xsl:if>
        <xsl:if test="$v_enum='Secondary'">Secondary</xsl:if>
        <xsl:if test="$v_enum='TechnicalPreparatory'">Technical Preparatory</xsl:if>
        <xsl:if test="$v_enum='Undergraduate'">Undergraduate</xsl:if>
        <xsl:if test="$v_enum='UpperDivision'">Upper Division</xsl:if>
        <xsl:if test="$v_enum='Vocational'">Vocational</xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Delinquencies -->
  <xsl:template name="Enums.Delinquencies">
    <xsl:param name="v_enum"/>
    <xsl:choose>
      <xsl:when test="$Locale='fr-CA'">
        <xsl:if test="$v_enum='ExclusionAcademic'">Exclusion (Académique)</xsl:if>
        <xsl:if test="$v_enum='ExclusionDiscipline'">Exclusion (Disciplinaire)</xsl:if>
        <xsl:if test="$v_enum='GoodStanding'">L'étudiant était en bonne position</xsl:if>
        <xsl:if test="$v_enum='ProbationGPA'">L'étudiant était en probation académique (en raison d'une faible moyenne pondérée)</xsl:if>
        <xsl:if test="$v_enum='ProbationHours'">L'étudiant était en probation académique (déficit en heures de crédit)</xsl:if>
        <xsl:if test="$v_enum='SuspensionGPA'">L'étudiant était en suspension académique (en raison d'une faible moyenne pondérée)</xsl:if>
        <xsl:if test="$v_enum='SuspensionHours'">L'étudiant était en suspension académique (déficit en heures de crédit)</xsl:if>
        <xsl:if test="$v_enum='ProbationDiscipline'">L'étudiant était en probation disciplinaire</xsl:if>
        <xsl:if test="$v_enum='SuspensionDiscipline'">L'étudiant était en suspension disciplinaire</xsl:if>
        <xsl:if test="$v_enum='Unknown'">Inconnu</xsl:if>
        <xsl:if test="$v_enum='Other'">Autre</xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="$v_enum='ExclusionAcademic'">Exclusion (Academic)</xsl:if>
        <xsl:if test="$v_enum='ExclusionDiscipline'">Exclusion (Discipline)</xsl:if>
        <xsl:if test="$v_enum='GoodStanding'">Student was in good standing</xsl:if>
        <xsl:if test="$v_enum='ProbationGPA'">Student was on academic probation (because of low GPA)</xsl:if>
        <xsl:if test="$v_enum='ProbationHours'">Student was on academic probation (deficiency in credit hours)</xsl:if>
        <xsl:if test="$v_enum='SuspensionGPA'">Student was on academic suspension (because of low GPA)</xsl:if>
        <xsl:if test="$v_enum='SuspensionHours'">Student was on academic suspension (deficiency in credit hours)</xsl:if>
        <xsl:if test="$v_enum='ProbationDiscipline'">Student was on disciplinary probation</xsl:if>
        <xsl:if test="$v_enum='SuspensionDiscipline'">Student was on disciplinary suspension</xsl:if>
        <xsl:if test="$v_enum='Unknown'">Unknown</xsl:if>
        <xsl:if test="$v_enum='Other'">Other</xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Student Level Code -->
  <xsl:template name="Enums.StudentLevelCode">
    <xsl:param name="v_enum"/>
    <xsl:choose>
      <xsl:when test="$Locale='fr-CA'">
        <xsl:if test="$v_enum='Postsecondary'">Postsecondaire</xsl:if>
        <xsl:if test="$v_enum='PostsecondaryBachelorPreliminaryYear'">Baccalauréat postsecondaire/Année préparatoire</xsl:if>
        <xsl:if test="$v_enum='NonDegree'">Étudiant non-diplômé ou transitoire</xsl:if>
        <xsl:if test="$v_enum='CollegeFirstYear'">Première année universitaire, jamais fréquenté l'université auparavant</xsl:if>
        <xsl:if test="$v_enum='CollegeFirstYearAttendedBefore'">Première année universitaire, a déjà fréquenté l'université</xsl:if>
        <xsl:if test="$v_enum='CollegeSophomore'">Étudiant de deuxième année universitaire</xsl:if>
        <xsl:if test="$v_enum='CollegeJunior'">Étudiant de troisième année universitaire</xsl:if>
        <xsl:if test="$v_enum='CollegeSenior'">Étudiant de quatrième année universitaire</xsl:if>
        <xsl:if test="$v_enum='CollegeFifthYear'">Cinquième année universitaire</xsl:if>
        <xsl:if test="$v_enum='PostBaccalaureate'">Post-baccalauréat</xsl:if>
        <xsl:if test="$v_enum='GraduateNonDegree'">Étudiant diplômé (non-diplômé)</xsl:if>
        <xsl:if test="$v_enum='GraduateFirstYear'">Première année d'études supérieures</xsl:if>
        <xsl:if test="$v_enum='GraduateSecondYear'">Deuxième année d'études supérieures</xsl:if>
        <xsl:if test="$v_enum='GraduateThirdYear'">Troisième année d'études supérieures</xsl:if>
        <xsl:if test="$v_enum='GraduateBeyondThirdYear'">Au-delà de la troisième année d'études supérieures</xsl:if>
        <xsl:if test="$v_enum='Professional'">Étudiant en programme professionnel</xsl:if>
        <xsl:if test="$v_enum='ProfessionalFirstYear'">Première année de programme professionnel</xsl:if>
        <xsl:if test="$v_enum='ProfessionalSecondYear'">Deuxième année de programme professionnel</xsl:if>
        <xsl:if test="$v_enum='ProfessionalThirdYear'">Troisième année de programme professionnel</xsl:if>
        <xsl:if test="$v_enum='ProfessionalBeyondThirdYear'">Au-delà de la troisième année de programme professionnel</xsl:if>
        <xsl:if test="$v_enum='MastersQualifying'">Maîtrise (Admission)</xsl:if>
        <xsl:if test="$v_enum='Masters'">Maîtrise</xsl:if>
        <xsl:if test="$v_enum='Doctoral'">Doctorat</xsl:if>
        <xsl:if test="$v_enum='Postdoctoral'">Postdoctoral</xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="$v_enum='Postsecondary'">Postsecondary</xsl:if>
        <xsl:if test="$v_enum='PostsecondaryBachelorPreliminaryYear'">Postsecondary Bachelor/Preliminary Year</xsl:if>
        <xsl:if test="$v_enum='NonDegree'">Non-Degree or Transient Student</xsl:if>
        <xsl:if test="$v_enum='CollegeFirstYear'">First-year, never attended college before</xsl:if>
        <xsl:if test="$v_enum='CollegeFirstYearAttendedBefore'">First-year, attended college before</xsl:if>
        <xsl:if test="$v_enum='CollegeSophomore'">College Sophomore</xsl:if>
        <xsl:if test="$v_enum='CollegeJunior'">College Junior</xsl:if>
        <xsl:if test="$v_enum='CollegeSenior'">College Senior</xsl:if>
        <xsl:if test="$v_enum='CollegeFifthYear'">College Fifth Year</xsl:if>
        <xsl:if test="$v_enum='PostBaccalaureate'">Post-Baccalaureate</xsl:if>
        <xsl:if test="$v_enum='GraduateNonDegree'">Graduate (Non-Degree)</xsl:if>
        <xsl:if test="$v_enum='GraduateFirstYear'">Graduate First Year</xsl:if>
        <xsl:if test="$v_enum='GraduateSecondYear'">Graduate Second Year</xsl:if>
        <xsl:if test="$v_enum='GraduateThirdYear'">Graduate Third Year</xsl:if>
        <xsl:if test="$v_enum='GraduateBeyondThirdYear'">Graduate Beyond Third Year</xsl:if>
        <xsl:if test="$v_enum='Professional'">Professional</xsl:if>
        <xsl:if test="$v_enum='ProfessionalFirstYear'">Professional First Year</xsl:if>
        <xsl:if test="$v_enum='ProfessionalSecondYear'">Professional Second Year</xsl:if>
        <xsl:if test="$v_enum='ProfessionalThirdYear'">Professional Third Year</xsl:if>
        <xsl:if test="$v_enum='ProfessionalBeyondThirdYear'">Professional Beyond Third Year</xsl:if>
        <xsl:if test="$v_enum='MastersQualifying'">Masters (Qualifying)</xsl:if>
        <xsl:if test="$v_enum='Masters'">Masters</xsl:if>
        <xsl:if test="$v_enum='Doctoral'">Doctoral</xsl:if>
        <xsl:if test="$v_enum='Postdoctoral'">Post-Doctoral</xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>