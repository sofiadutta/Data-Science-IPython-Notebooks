<!--  Edited with XML -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<html>
			<body>
        <h2>UMBC Fall Course Schedule</h2>
				<table border="1">
					<xsl:for-each select="schedule/course">
						  <tr>
        					<td><b>Program</b></td>
        					<td><xsl:value-of select="programIdentifier"/></td>
      					</tr>
      					<tr>
        					<td><b>CurseNumber</b></td>
        					<td><xsl:value-of select="number"/></td>
      					</tr>
      					<tr>
        					<td><b>Title</b></td>
        					<td><xsl:value-of select="title"/></td>
      					</tr>
      					<tr>
        					<td><b>Prerequisite</b></td>
        					<td><xsl:value-of select="prerequisite"/></td>
      					</tr>
      					<tr>
        					<td><b>description</b></td>
        					<td><xsl:value-of select="description"/></td>
      					</tr>
      					 <xsl:for-each select="section">
      						  <tr>
        							   <td><b>Sec-</b></td>
        							   <td><xsl:value-of select="sectionNumber"/></td>
      							   </tr>
      							   <tr>
        							   <td><b>Instructor</b></td>
        							   <td><xsl:value-of select="instructor"/></td>
      							   </tr>
      							   <tr>
        							   <td><b>ClassNumber</b></td>
        							   <td><xsl:value-of select="classNumber"/></td>
      							   </tr>
      							   <tr>
        							   <td><b>Room</b></td>
        							   <td><xsl:value-of select="room"/></td>
      							   </tr>
      							   <tr>
        							   <td><b>Days</b></td>
        							   <td><xsl:value-of select="days"/></td>
      							   </tr>
      							   <tr>
        							   <td><b>StartTime</b></td>
        							   <td><xsl:value-of select="startTime"/></td>
      							   </tr>
      							   <tr>
        						     <td><b>EndTime</b></td>
        							   <td><xsl:value-of select="endTime"/></td>
      							   </tr>
      							   <tr>
        							   <td><b>Status</b></td>
        							   <td><xsl:value-of select="status"/></td>
      							   </tr>
						      </xsl:for-each>
					</xsl:for-each>
    		</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
