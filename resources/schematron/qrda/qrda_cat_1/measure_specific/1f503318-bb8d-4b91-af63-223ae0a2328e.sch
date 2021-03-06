<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://purl.oclc.org/dsdl/schematron C:/Users/rickg/workspaces-svn/ClientProjects/QRDATesting/measure-specific-schematron/schematron.xsd">
	<ns uri="urn:hl7-org:v3" prefix="cda"/>
	<ns uri="urn:hl7-org:sdtc" prefix="sdtc"/>
	<phase id="warnings">
		<active pattern="p"/>
	</phase>
	<pattern id="p">
		<rule context="/cda:ClinicalDocument">
			<assert test="//*[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.11'][descendant::*/@sdtc:valueSet='2.16.840.1.113883.3.117.1.7.1.212']">For QDT pattern 'Diagnosis, Active: Hemorrhagic Stroke', QRDA template id "2.16.840.1.113883.10.20.24.3.11" SHOULD be present and SHOULD be bound to value set "2.16.840.1.113883.3.117.1.7.1.212". </assert>
			<assert test="//*[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.11'][descendant::*/@sdtc:valueSet='2.16.840.1.113883.3.117.1.7.1.247']">For QDT pattern 'Diagnosis, Active: Ischemic Stroke', QRDA template id "2.16.840.1.113883.10.20.24.3.11" SHOULD be present and SHOULD be bound to value set "2.16.840.1.113883.3.117.1.7.1.247". </assert>
			<assert test="//*[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.23'][descendant::*/@sdtc:valueSet='2.16.840.1.113883.3.117.1.7.1.293']">For QDT pattern 'Encounter, Performed: Emergency Department Visit', QRDA template id "2.16.840.1.113883.10.20.24.3.23" SHOULD be present and SHOULD be bound to value set "2.16.840.1.113883.3.117.1.7.1.293". </assert>
			<assert test="//*[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.23'][descendant::*/@sdtc:valueSet='2.16.840.1.113883.3.117.1.7.1.23']">For QDT pattern 'Encounter, Performed: Inpatient Encounter', QRDA template id "2.16.840.1.113883.10.20.24.3.23" SHOULD be present and SHOULD be bound to value set "2.16.840.1.113883.3.117.1.7.1.23". </assert>
			<assert test="//*[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.31'][descendant::*/@sdtc:valueSet='2.16.840.1.113883.3.526.2.1076']">For QDT pattern 'Intervention, Order: Palliative Care', QRDA template id "2.16.840.1.113883.10.20.24.3.31" SHOULD be present and SHOULD be bound to value set "2.16.840.1.113883.3.526.2.1076". </assert>
			<assert test="//*[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.32'][descendant::*/@sdtc:valueSet='2.16.840.1.113883.3.526.2.1076']">For QDT pattern 'Intervention, Performed: Palliative Care', QRDA template id "2.16.840.1.113883.10.20.24.3.32" SHOULD be present and SHOULD be bound to value set "2.16.840.1.113883.3.526.2.1076". </assert>
			<assert test="//*[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.40'][descendant::*/@sdtc:valueSet='2.16.840.1.113883.3.117.1.7.1.215']">For QDT pattern 'Laboratory Test, Result: LDL-c', QRDA template id "2.16.840.1.113883.10.20.24.3.40" SHOULD be present and SHOULD be bound to value set "2.16.840.1.113883.3.117.1.7.1.215". </assert>
			<assert test="//*[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.41'][descendant::*/@sdtc:valueSet='2.16.840.1.113883.3.117.1.7.1.217']">For QDT pattern 'Medication, Active: Lipid-lowering Agent', QRDA template id "2.16.840.1.113883.10.20.24.3.41" SHOULD be present and SHOULD be bound to value set "2.16.840.1.113883.3.117.1.7.1.217". </assert>
			<assert test="//*[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.44'][descendant::*/@sdtc:valueSet='2.16.840.1.113883.3.117.1.7.1.225']">For QDT pattern 'Medication, Allergy: Statin', QRDA template id "2.16.840.1.113883.10.20.24.3.44" SHOULD be present and SHOULD be bound to value set "2.16.840.1.113883.3.117.1.7.1.225". </assert>
			<assert test="//*[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.47'][descendant::*/@sdtc:valueSet='2.16.840.1.113883.3.117.1.7.1.225']">For QDT pattern 'Medication, Order: Statin', QRDA template id "2.16.840.1.113883.10.20.24.3.47" SHOULD be present and SHOULD be bound to value set "2.16.840.1.113883.3.117.1.7.1.225". </assert>
			<assert test="//*[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.55'][descendant::*/@sdtc:valueSet='2.16.840.1.114222.4.11.3591']">For QDT pattern 'Patient Characteristic Payer: Payer', QRDA template id "2.16.840.1.113883.10.20.24.3.55" SHOULD be present and SHOULD be bound to value set "2.16.840.1.114222.4.11.3591". </assert>
		</rule>
	</pattern>
</schema>