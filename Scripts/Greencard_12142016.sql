USE [Greencard]
GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PersonContact', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonContact'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PatientIdentifier', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PatientIdentifier'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PatientEnrollment', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PatientEnrollment'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PatientEncounter', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PatientEncounter'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PatientDiagnosis', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PatientDiagnosis'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PatientChronicIllness', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PatientChronicIllness'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PatientCareending', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PatientCareending'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PatientAppointment', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PatientAppointment'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PatientAllergy', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PatientAllergy'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Patient', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Patient'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'HIVEnrollmentBaseline', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIVEnrollmentBaseline'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ARTUseHistory', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ARTUseHistory'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ARTInitiationBaseline', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ARTInitiationBaseline'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AdverseEvent', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AdverseEvent'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AdherenceOutcome', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AdherenceOutcome'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AdherenceOutcome', N'COLUMN',N'DeleteFlag'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AdherenceOutcome', @level2type=N'COLUMN',@level2name=N'DeleteFlag'

GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vaccination_Person]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vaccination]'))
ALTER TABLE [dbo].[Vaccination] DROP CONSTRAINT [FK_Vaccination_Person]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vaccination_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vaccination]'))
ALTER TABLE [dbo].[Vaccination] DROP CONSTRAINT [FK_Vaccination_PatientMasterVisit]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TreatmentEventTracker_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[TreatmentEventTracker]'))
ALTER TABLE [dbo].[TreatmentEventTracker] DROP CONSTRAINT [FK_TreatmentEventTracker_PatientMasterVisit]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PhysicalExamination_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PhysicalExamination]'))
ALTER TABLE [dbo].[PhysicalExamination] DROP CONSTRAINT [FK_PhysicalExamination_PatientMasterVisit]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PersonLocation_Person]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonLocation]'))
ALTER TABLE [dbo].[PersonLocation] DROP CONSTRAINT [FK_PersonLocation_Person]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PersonContact_Person]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonContact]'))
ALTER TABLE [dbo].[PersonContact] DROP CONSTRAINT [FK_PersonContact_Person]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientVitals_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientVitals]'))
ALTER TABLE [dbo].[PatientVitals] DROP CONSTRAINT [FK_PatientVitals_PatientMasterVisit]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientTreatmentSupporter_Person]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientTreatmentSupporter]'))
ALTER TABLE [dbo].[PatientTreatmentSupporter] DROP CONSTRAINT [FK_PatientTreatmentSupporter_Person]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientTreatmentSupporter_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientTreatmentSupporter]'))
ALTER TABLE [dbo].[PatientTreatmentSupporter] DROP CONSTRAINT [FK_PatientTreatmentSupporter_Patient]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientReferral_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientReferral]'))
ALTER TABLE [dbo].[PatientReferral] DROP CONSTRAINT [FK_PatientReferral_PatientMasterVisit]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientPHDP_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientPHDP]'))
ALTER TABLE [dbo].[PatientPHDP] DROP CONSTRAINT [FK_PatientPHDP_PatientMasterVisit]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientOVCStatus_Person]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientOVCStatus]'))
ALTER TABLE [dbo].[PatientOVCStatus] DROP CONSTRAINT [FK_PatientOVCStatus_Person]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientOVCStatus_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientOVCStatus]'))
ALTER TABLE [dbo].[PatientOVCStatus] DROP CONSTRAINT [FK_PatientOVCStatus_Patient]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientLabTracker_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientLabTracker]'))
ALTER TABLE [dbo].[PatientLabTracker] DROP CONSTRAINT [FK_PatientLabTracker_PatientMasterVisit]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientEncounter_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientEncounter]'))
ALTER TABLE [dbo].[PatientEncounter] DROP CONSTRAINT [FK_PatientEncounter_PatientMasterVisit]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientDiagnosis_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientDiagnosis]'))
ALTER TABLE [dbo].[PatientDiagnosis] DROP CONSTRAINT [FK_PatientDiagnosis_PatientMasterVisit]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientTreatementDiagnosis_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientClinicalDiagnosis]'))
ALTER TABLE [dbo].[PatientClinicalDiagnosis] DROP CONSTRAINT [FK_PatientTreatementDiagnosis_PatientMasterVisit]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientChronicIllness_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientChronicIllness]'))
ALTER TABLE [dbo].[PatientChronicIllness] DROP CONSTRAINT [FK_PatientChronicIllness_PatientMasterVisit]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientCareending_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientCareending]'))
ALTER TABLE [dbo].[PatientCareending] DROP CONSTRAINT [FK_PatientCareending_PatientMasterVisit]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientAppointment_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientAppointment]'))
ALTER TABLE [dbo].[PatientAppointment] DROP CONSTRAINT [FK_PatientAppointment_PatientMasterVisit]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientAllergies_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientAllergy]'))
ALTER TABLE [dbo].[PatientAllergy] DROP CONSTRAINT [FK_PatientAllergies_PatientMasterVisit]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Patient_Person]') AND parent_object_id = OBJECT_ID(N'[dbo].[Patient]'))
ALTER TABLE [dbo].[Patient] DROP CONSTRAINT [FK_Patient_Person]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Disclosure_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[Disclosure]'))
ALTER TABLE [dbo].[Disclosure] DROP CONSTRAINT [FK_Disclosure_PatientMasterVisit]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ComplaintsHistory_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[ComplaintsHistory]'))
ALTER TABLE [dbo].[ComplaintsHistory] DROP CONSTRAINT [FK_ComplaintsHistory_PatientMasterVisit]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARTUseHistory_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[ARTUseHistory]'))
ALTER TABLE [dbo].[ARTUseHistory] DROP CONSTRAINT [FK_ARTUseHistory_PatientMasterVisit]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARTUseHistory_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[ARTUseHistory]'))
ALTER TABLE [dbo].[ARTUseHistory] DROP CONSTRAINT [FK_ARTUseHistory_Patient]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARTInitiationBaseline_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[ARTInitiationBaseline]'))
ALTER TABLE [dbo].[ARTInitiationBaseline] DROP CONSTRAINT [FK_ARTInitiationBaseline_PatientMasterVisit]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARTInitiationBaseline_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[ARTInitiationBaseline]'))
ALTER TABLE [dbo].[ARTInitiationBaseline] DROP CONSTRAINT [FK_ARTInitiationBaseline_Patient]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdverseEvent_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdverseEvent]'))
ALTER TABLE [dbo].[AdverseEvent] DROP CONSTRAINT [FK_AdverseEvent_PatientMasterVisit]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdverseEvent_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdverseEvent]'))
ALTER TABLE [dbo].[AdverseEvent] DROP CONSTRAINT [FK_AdverseEvent_Patient]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientAdheranceAssessment_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdherenceOutcome]'))
ALTER TABLE [dbo].[AdherenceOutcome] DROP CONSTRAINT [FK_PatientAdheranceAssessment_PatientMasterVisit]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdherenceOutcome_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdherenceOutcome]'))
ALTER TABLE [dbo].[AdherenceOutcome] DROP CONSTRAINT [FK_AdherenceOutcome_Patient]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_AdultChildVaccination_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vaccination] DROP CONSTRAINT [DF_AdultChildVaccination_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_AdultChildVaccination_Void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vaccination] DROP CONSTRAINT [DF_AdultChildVaccination_Void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_User_Locked]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_Locked]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_User_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_DeleteFlag]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_User_Active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_Active]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_TreatmentEventTracker_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TreatmentEventTracker] DROP CONSTRAINT [DF_TreatmentEventTracker_void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_TBTreatmentTracker_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBTreatmentTracker] DROP CONSTRAINT [DF_TBTreatmentTracker_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_TBTreatmentTracker_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBTreatmentTracker] DROP CONSTRAINT [DF_TBTreatmentTracker_DeleteFlag]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ServiceEntryPoint_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServiceEntryPoint] DROP CONSTRAINT [DF_ServiceEntryPoint_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ServiceEntryPoint_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServiceEntryPoint] DROP CONSTRAINT [DF_ServiceEntryPoint_void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PhysicalExamination_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PhysicalExamination] DROP CONSTRAINT [DF_PhysicalExamination_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PhysicalExamination_Void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PhysicalExamination] DROP CONSTRAINT [DF_PhysicalExamination_Void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_person_location_create_by]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PersonLocation] DROP CONSTRAINT [DF_person_location_create_by]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_person_location_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PersonLocation] DROP CONSTRAINT [DF_person_location_void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_person_location_is_active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PersonLocation] DROP CONSTRAINT [DF_person_location_is_active]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientLocation_NearestHealthCentre]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PersonLocation] DROP CONSTRAINT [DF_PatientLocation_NearestHealthCentre]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientLocation_LandMark]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PersonLocation] DROP CONSTRAINT [DF_PatientLocation_LandMark]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientLocation_Estate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PersonLocation] DROP CONSTRAINT [DF_PatientLocation_Estate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientLocation_Village]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PersonLocation] DROP CONSTRAINT [DF_PatientLocation_Village]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PersonContact_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PersonContact] DROP CONSTRAINT [DF_PersonContact_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_patient_contact_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PersonContact] DROP CONSTRAINT [DF_patient_contact_void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientContact_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PersonContact] DROP CONSTRAINT [DF_PatientContact_IsActive]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Person_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Person] DROP CONSTRAINT [DF_Person_DeleteFlag]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Person_Active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Person] DROP CONSTRAINT [DF_Person_Active]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientVitals_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientVitals] DROP CONSTRAINT [DF_PatientVitals_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientVitals_Void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientVitals] DROP CONSTRAINT [DF_PatientVitals_Void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientTreatmentSupporter_Void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientTreatmentSupporter] DROP CONSTRAINT [DF_PatientTreatmentSupporter_Void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientTransferIn_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientTransferIn] DROP CONSTRAINT [DF_PatientTransferIn_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_transfer_in_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientTransferIn] DROP CONSTRAINT [DF_transfer_in_void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientScreening_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientScreening] DROP CONSTRAINT [DF_PatientScreening_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientScreening_Void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientScreening] DROP CONSTRAINT [DF_PatientScreening_Void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientReferral_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientReferral] DROP CONSTRAINT [DF_PatientReferral_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientReferral_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientReferral] DROP CONSTRAINT [DF_PatientReferral_DeleteFlag]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_INHProphylaxis_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientProphylaxis] DROP CONSTRAINT [DF_INHProphylaxis_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_INHProphylaxis_Void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientProphylaxis] DROP CONSTRAINT [DF_INHProphylaxis_Void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_patient_population_create_date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientPopulation] DROP CONSTRAINT [DF_patient_population_create_date]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_patient_population_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientPopulation] DROP CONSTRAINT [DF_patient_population_void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientPHDP_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientPHDP] DROP CONSTRAINT [DF_PatientPHDP_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientPHDP_Void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientPHDP] DROP CONSTRAINT [DF_PatientPHDP_Void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_patient_ovcstatus_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientOVCStatus] DROP CONSTRAINT [DF_patient_ovcstatus_void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientMasterVisit_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientMasterVisit] DROP CONSTRAINT [DF_PatientMasterVisit_void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientMasterVisit_status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientMasterVisit] DROP CONSTRAINT [DF_PatientMasterVisit_status]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_patient_maritalstatus_create_date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientMaritalStatus] DROP CONSTRAINT [DF_patient_maritalstatus_create_date]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_patient_maritalstatus_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientMaritalStatus] DROP CONSTRAINT [DF_patient_maritalstatus_void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientMaritalStatus_Active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientMaritalStatus] DROP CONSTRAINT [DF_PatientMaritalStatus_Active]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientLabTracker_Void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientLabTracker] DROP CONSTRAINT [DF_PatientLabTracker_Void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientIdentifier_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientIdentifier] DROP CONSTRAINT [DF_PatientIdentifier_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_patient_identifier_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientIdentifier] DROP CONSTRAINT [DF_patient_identifier_void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientFamilyPlanningMethod_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientFamilyPlanningMethod] DROP CONSTRAINT [DF_PatientFamilyPlanningMethod_DeleteFlag]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientFamilyPlanning_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientFamilyPlanning] DROP CONSTRAINT [DF_PatientFamilyPlanning_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientFamilyPlanning_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientFamilyPlanning] DROP CONSTRAINT [DF_PatientFamilyPlanning_DeleteFlag]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientEnrollment_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientEnrollment] DROP CONSTRAINT [DF_PatientEnrollment_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_patient_enrollment_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientEnrollment] DROP CONSTRAINT [DF_patient_enrollment_void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientEnrollment_Active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientEnrollment] DROP CONSTRAINT [DF_PatientEnrollment_Active]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientEnrollment_TransferIn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientEnrollment] DROP CONSTRAINT [DF_PatientEnrollment_TransferIn]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientEncounter_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientEncounter] DROP CONSTRAINT [DF_PatientEncounter_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_patient_encounter_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientEncounter] DROP CONSTRAINT [DF_patient_encounter_void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientDiagnosis_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientDiagnosis] DROP CONSTRAINT [DF_PatientDiagnosis_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_dtl_PatientClinicalNotes_ModifiedFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientClinicalNotes] DROP CONSTRAINT [DF_dtl_PatientClinicalNotes_ModifiedFlag]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientClinicalNotes_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientClinicalNotes] DROP CONSTRAINT [DF_PatientClinicalNotes_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_dtl_PatientClinicalNotes_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientClinicalNotes] DROP CONSTRAINT [DF_dtl_PatientClinicalNotes_DeleteFlag]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientTreatementDiagnosis_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientClinicalDiagnosis] DROP CONSTRAINT [DF_PatientTreatementDiagnosis_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientTreatementDiagnosis_Void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientClinicalDiagnosis] DROP CONSTRAINT [DF_PatientTreatementDiagnosis_Void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientChronicIllness_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientChronicIllness] DROP CONSTRAINT [DF_PatientChronicIllness_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ChronicIllness_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientChronicIllness] DROP CONSTRAINT [DF_ChronicIllness_void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientCareending_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientCareending] DROP CONSTRAINT [DF_PatientCareending_void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientAppointment_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientAppointment] DROP CONSTRAINT [DF_PatientAppointment_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientAppointment_Void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientAppointment] DROP CONSTRAINT [DF_PatientAppointment_Void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientAppointment_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientAppointment] DROP CONSTRAINT [DF_PatientAppointment_Status]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientAllergy_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientAllergy] DROP CONSTRAINT [DF_PatientAllergy_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientAllergies_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientAllergy] DROP CONSTRAINT [DF_PatientAllergies_void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_person_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Patient] DROP CONSTRAINT [DF_person_void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Patient_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Patient] DROP CONSTRAINT [DF_Patient_Status]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ModuleMaster_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ModuleMaster] DROP CONSTRAINT [DF_ModuleMaster_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ModuleMaster_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ModuleMaster] DROP CONSTRAINT [DF_ModuleMaster_DeleteFlag]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_LookupMasterItem_OrdRank]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LookupMasterItem] DROP CONSTRAINT [DF_LookupMasterItem_OrdRank]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_LookupMaster_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LookupMaster] DROP CONSTRAINT [DF_LookupMaster_DeleteFlag]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_LookupItem_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LookupItem] DROP CONSTRAINT [DF_LookupItem_DeleteFlag]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_HIVTesting_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HIVTesting] DROP CONSTRAINT [DF_HIVTesting_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_HIVTesting_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HIVTesting] DROP CONSTRAINT [DF_HIVTesting_DeleteFlag]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_DiagnosisARVHistory_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HIVEnrollmentBaseline] DROP CONSTRAINT [DF_DiagnosisARVHistory_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_DiagnosisARVHistory_Void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HIVEnrollmentBaseline] DROP CONSTRAINT [DF_DiagnosisARVHistory_Void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Disclosure_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Disclosure] DROP CONSTRAINT [DF_Disclosure_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Disclosure_Void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Disclosure] DROP CONSTRAINT [DF_Disclosure_Void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ComplaintsHistory_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ComplaintsHistory] DROP CONSTRAINT [DF_ComplaintsHistory_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ARVTreatmentTracker_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ARVTreatmentTracker] DROP CONSTRAINT [DF_ARVTreatmentTracker_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ARVTreatmentTracker_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ARVTreatmentTracker] DROP CONSTRAINT [DF_ARVTreatmentTracker_DeleteFlag]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ARVTreatmentTracker_ParentId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ARVTreatmentTracker] DROP CONSTRAINT [DF_ARVTreatmentTracker_ParentId]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ARVTreatmentTracker_DrugId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ARVTreatmentTracker] DROP CONSTRAINT [DF_ARVTreatmentTracker_DrugId]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ARVTreatmentTracker_RegimenLineId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ARVTreatmentTracker] DROP CONSTRAINT [DF_ARVTreatmentTracker_RegimenLineId]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ARTUseHistory_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ARTUseHistory] DROP CONSTRAINT [DF_ARTUseHistory_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ARTUseHistory_Void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ARTUseHistory] DROP CONSTRAINT [DF_ARTUseHistory_Void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ARTInitiationBaseline_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ARTInitiationBaseline] DROP CONSTRAINT [DF_ARTInitiationBaseline_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientARTInitiationBaseline_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ARTInitiationBaseline] DROP CONSTRAINT [DF_PatientARTInitiationBaseline_void]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_AdverseEvent_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AdverseEvent] DROP CONSTRAINT [DF_AdverseEvent_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_AdverseEvent_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AdverseEvent] DROP CONSTRAINT [DF_AdverseEvent_DeleteFlag]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientAdheranceAssessment_Void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AdherenceOutcome] DROP CONSTRAINT [DF_PatientAdheranceAssessment_Void]
END

GO
/****** Object:  Index [IX_User_UserName]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND name = N'IX_User_UserName')
DROP INDEX [IX_User_UserName] ON [dbo].[User]
GO
/****** Object:  Index [IX_PatientClinicalNotes]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PatientClinicalNotes]') AND name = N'IX_PatientClinicalNotes')
DROP INDEX [IX_PatientClinicalNotes] ON [dbo].[PatientClinicalNotes]
GO
/****** Object:  Index [IX_Patient_PtnPK]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Patient]') AND name = N'IX_Patient_PtnPK')
DROP INDEX [IX_Patient_PtnPK] ON [dbo].[Patient]
GO
/****** Object:  Index [IX_Patient]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Patient]') AND name = N'IX_Patient')
DROP INDEX [IX_Patient] ON [dbo].[Patient]
GO
/****** Object:  Index [IX_LookupMaster]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[LookupMaster]') AND name = N'IX_LookupMaster')
DROP INDEX [IX_LookupMaster] ON [dbo].[LookupMaster]
GO
/****** Object:  Index [IX_LookupItem]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[LookupItem]') AND name = N'IX_LookupItem')
DROP INDEX [IX_LookupItem] ON [dbo].[LookupItem]
GO
/****** Object:  View [dbo].[LookupItemView]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[LookupItemView]'))
DROP VIEW [dbo].[LookupItemView]
GO
/****** Object:  Table [dbo].[Vaccination]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vaccination]') AND type in (N'U'))
DROP TABLE [dbo].[Vaccination]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
DROP TABLE [dbo].[User]
GO
/****** Object:  Table [dbo].[TreatmentEventTracker]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TreatmentEventTracker]') AND type in (N'U'))
DROP TABLE [dbo].[TreatmentEventTracker]
GO
/****** Object:  Table [dbo].[TBTreatmentTracker]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBTreatmentTracker]') AND type in (N'U'))
DROP TABLE [dbo].[TBTreatmentTracker]
GO
/****** Object:  Table [dbo].[ServiceEntryPoint]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceEntryPoint]') AND type in (N'U'))
DROP TABLE [dbo].[ServiceEntryPoint]
GO
/****** Object:  Table [dbo].[PregnancyIndicator]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PregnancyIndicator]') AND type in (N'U'))
DROP TABLE [dbo].[PregnancyIndicator]
GO
/****** Object:  Table [dbo].[Pregnancy]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pregnancy]') AND type in (N'U'))
DROP TABLE [dbo].[Pregnancy]
GO
/****** Object:  Table [dbo].[PhysicalExamination]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PhysicalExamination]') AND type in (N'U'))
DROP TABLE [dbo].[PhysicalExamination]
GO
/****** Object:  Table [dbo].[PersonRelationship]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonRelationship]') AND type in (N'U'))
DROP TABLE [dbo].[PersonRelationship]
GO
/****** Object:  Table [dbo].[PersonLocation]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonLocation]') AND type in (N'U'))
DROP TABLE [dbo].[PersonLocation]
GO
/****** Object:  Table [dbo].[PersonContact]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonContact]') AND type in (N'U'))
DROP TABLE [dbo].[PersonContact]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Person]') AND type in (N'U'))
DROP TABLE [dbo].[Person]
GO
/****** Object:  Table [dbo].[PatientVitals]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientVitals]') AND type in (N'U'))
DROP TABLE [dbo].[PatientVitals]
GO
/****** Object:  Table [dbo].[PatientTreatmentSupporter]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientTreatmentSupporter]') AND type in (N'U'))
DROP TABLE [dbo].[PatientTreatmentSupporter]
GO
/****** Object:  Table [dbo].[PatientTransferIn]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientTransferIn]') AND type in (N'U'))
DROP TABLE [dbo].[PatientTransferIn]
GO
/****** Object:  Table [dbo].[PatientScreening]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientScreening]') AND type in (N'U'))
DROP TABLE [dbo].[PatientScreening]
GO
/****** Object:  Table [dbo].[PatientReferral]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientReferral]') AND type in (N'U'))
DROP TABLE [dbo].[PatientReferral]
GO
/****** Object:  Table [dbo].[PatientProphylaxis]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientProphylaxis]') AND type in (N'U'))
DROP TABLE [dbo].[PatientProphylaxis]
GO
/****** Object:  Table [dbo].[PatientPopulation]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientPopulation]') AND type in (N'U'))
DROP TABLE [dbo].[PatientPopulation]
GO
/****** Object:  Table [dbo].[PatientPHDP]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientPHDP]') AND type in (N'U'))
DROP TABLE [dbo].[PatientPHDP]
GO
/****** Object:  Table [dbo].[PatientOVCStatus]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientOVCStatus]') AND type in (N'U'))
DROP TABLE [dbo].[PatientOVCStatus]
GO
/****** Object:  Table [dbo].[PatientMasterVisit]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientMasterVisit]') AND type in (N'U'))
DROP TABLE [dbo].[PatientMasterVisit]
GO
/****** Object:  Table [dbo].[PatientMaritalStatus]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientMaritalStatus]') AND type in (N'U'))
DROP TABLE [dbo].[PatientMaritalStatus]
GO
/****** Object:  Table [dbo].[PatientLabTracker]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientLabTracker]') AND type in (N'U'))
DROP TABLE [dbo].[PatientLabTracker]
GO
/****** Object:  Table [dbo].[PatientIdentifier]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientIdentifier]') AND type in (N'U'))
DROP TABLE [dbo].[PatientIdentifier]
GO
/****** Object:  Table [dbo].[PatientFamilyPlanningMethod]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientFamilyPlanningMethod]') AND type in (N'U'))
DROP TABLE [dbo].[PatientFamilyPlanningMethod]
GO
/****** Object:  Table [dbo].[PatientFamilyPlanning]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientFamilyPlanning]') AND type in (N'U'))
DROP TABLE [dbo].[PatientFamilyPlanning]
GO
/****** Object:  Table [dbo].[PatientEnrollment]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientEnrollment]') AND type in (N'U'))
DROP TABLE [dbo].[PatientEnrollment]
GO
/****** Object:  Table [dbo].[PatientEncounter]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientEncounter]') AND type in (N'U'))
DROP TABLE [dbo].[PatientEncounter]
GO
/****** Object:  Table [dbo].[PatientDiagnosis]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientDiagnosis]') AND type in (N'U'))
DROP TABLE [dbo].[PatientDiagnosis]
GO
/****** Object:  Table [dbo].[PatientClinicalNotes]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientClinicalNotes]') AND type in (N'U'))
DROP TABLE [dbo].[PatientClinicalNotes]
GO
/****** Object:  Table [dbo].[PatientClinicalDiagnosis]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientClinicalDiagnosis]') AND type in (N'U'))
DROP TABLE [dbo].[PatientClinicalDiagnosis]
GO
/****** Object:  Table [dbo].[PatientChronicIllness]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientChronicIllness]') AND type in (N'U'))
DROP TABLE [dbo].[PatientChronicIllness]
GO
/****** Object:  Table [dbo].[PatientCareending]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientCareending]') AND type in (N'U'))
DROP TABLE [dbo].[PatientCareending]
GO
/****** Object:  Table [dbo].[PatientAppointment]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientAppointment]') AND type in (N'U'))
DROP TABLE [dbo].[PatientAppointment]
GO
/****** Object:  Table [dbo].[PatientAllergy]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientAllergy]') AND type in (N'U'))
DROP TABLE [dbo].[PatientAllergy]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Patient]') AND type in (N'U'))
DROP TABLE [dbo].[Patient]
GO
/****** Object:  Table [dbo].[ModuleMaster]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ModuleMaster]') AND type in (N'U'))
DROP TABLE [dbo].[ModuleMaster]
GO
/****** Object:  Table [dbo].[LookupMasterItem]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LookupMasterItem]') AND type in (N'U'))
DROP TABLE [dbo].[LookupMasterItem]
GO
/****** Object:  Table [dbo].[LookupMaster]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LookupMaster]') AND type in (N'U'))
DROP TABLE [dbo].[LookupMaster]
GO
/****** Object:  Table [dbo].[LookupItem]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LookupItem]') AND type in (N'U'))
DROP TABLE [dbo].[LookupItem]
GO
/****** Object:  Table [dbo].[HIVTesting]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HIVTesting]') AND type in (N'U'))
DROP TABLE [dbo].[HIVTesting]
GO
/****** Object:  Table [dbo].[HIVEnrollmentBaseline]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HIVEnrollmentBaseline]') AND type in (N'U'))
DROP TABLE [dbo].[HIVEnrollmentBaseline]
GO
/****** Object:  Table [dbo].[Disclosure]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Disclosure]') AND type in (N'U'))
DROP TABLE [dbo].[Disclosure]
GO
/****** Object:  Table [dbo].[ComplaintsHistory]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ComplaintsHistory]') AND type in (N'U'))
DROP TABLE [dbo].[ComplaintsHistory]
GO
/****** Object:  Table [dbo].[ARVTreatmentTracker]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ARVTreatmentTracker]') AND type in (N'U'))
DROP TABLE [dbo].[ARVTreatmentTracker]
GO
/****** Object:  Table [dbo].[ARTUseHistory]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ARTUseHistory]') AND type in (N'U'))
DROP TABLE [dbo].[ARTUseHistory]
GO
/****** Object:  Table [dbo].[ARTInitiationBaseline]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ARTInitiationBaseline]') AND type in (N'U'))
DROP TABLE [dbo].[ARTInitiationBaseline]
GO
/****** Object:  Table [dbo].[AdverseEvent]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdverseEvent]') AND type in (N'U'))
DROP TABLE [dbo].[AdverseEvent]
GO
/****** Object:  Table [dbo].[AdherenceOutcome]    Script Date: 12/21/2016 12:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdherenceOutcome]') AND type in (N'U'))
DROP TABLE [dbo].[AdherenceOutcome]
GO
/****** Object:  Table [dbo].[AdherenceOutcome]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdherenceOutcome]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AdherenceOutcome](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientMasterVisitId] [int] NOT NULL,
	[AdherenceType] [int] NOT NULL,
	[Score] [int] NOT NULL,
	[ScoreDescription] [varchar](150) NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NOT NULL,
 CONSTRAINT [PK_AdherenceOutcome] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AdverseEvent]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdverseEvent]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AdverseEvent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientMasterVisitId] [int] NOT NULL,
	[EventName] [varchar](250) NOT NULL,
	[EventCause] [varchar](250) NULL,
	[Severity] [varchar](250) NULL,
	[Action] [varchar](250) NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_AdverseEvent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ARTInitiationBaseline]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ARTInitiationBaseline]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ARTInitiationBaseline](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientMasterVisitId] [int] NOT NULL,
	[HBVInfected] [bit] NOT NULL,
	[Pregnant] [bit] NOT NULL,
	[TBinfected] [bit] NOT NULL,
	[WHOStage] [int] NOT NULL,
	[BreastFeeding] [bit] NOT NULL,
	[CD4Count] [int] NULL,
	[ViralLoad] [int] NULL,
	[ViralLoadDate] [date] NULL,
	[MUAC] [decimal](8, 2) NULL,
	[Weight] [decimal](8, 2) NOT NULL,
	[Height] [decimal](8, 2) NOT NULL,
	[BMI]  AS ([Weight]/(([Height]/(100))*([Height]/(100)))) PERSISTED,
	[ARTCohort] [varchar](50) NULL,
	[FirstLineStartDate] [date] NULL,
	[StartRegimen] [int] NULL,
	[DeleteFlag] [bit] NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateBy] [int] NOT NULL,
 CONSTRAINT [PK_PatientARTInitiationBaseline] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ARTUseHistory]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ARTUseHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ARTUseHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientMasterVisitId] [int] NOT NULL,
	[TreatmentType] [varchar](50) NOT NULL,
	[Purpose] [varchar](150) NOT NULL,
	[Regimen] [varchar](150) NOT NULL,
	[DateLastUsed] [date] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ARTUseHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ARVTreatmentTracker]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ARVTreatmentTracker]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ARVTreatmentTracker](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[ServiceAreaId] [int] NOT NULL,
	[PatientMasterVisitId] [int] NOT NULL,
	[RegimenStartDate] [int] NOT NULL,
	[RegimenId] [int] NOT NULL,
	[Regimen] [varchar](50) NOT NULL,
	[RegimenLineId] [int] NOT NULL,
	[RegimenLine] [varchar](50) NOT NULL,
	[DrugId] [int] NOT NULL,
	[RegimenStatusDate] [datetime] NOT NULL,
	[TreatmentStatusId] [int] NOT NULL,
	[ParentId] [int] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_ARVTreatmentTracker] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ComplaintsHistory]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ComplaintsHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ComplaintsHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientMasterVisitId] [int] NOT NULL,
	[PresentingComplaint] [varchar](1000) NOT NULL,
	[ComplaintHistory] [varchar](1000) NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_ComplaintsHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Disclosure]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Disclosure]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Disclosure](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientMasterVisitId] [int] NOT NULL,
	[Category] [varchar](15) NOT NULL,
	[DisclosureStage] [varchar](10) NOT NULL,
	[DisclosureDate] [date] NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Disclosure_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HIVEnrollmentBaseline]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HIVEnrollmentBaseline]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HIVEnrollmentBaseline](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientMasterVisitId] [int] NOT NULL,
	[HIVDiagnosisDate] [date] NOT NULL,
	[EnrollmentDate] [date] NOT NULL,
	[EnrollmentWHOStage] [int] NOT NULL,
	[ARTInitiationDate] [date] NOT NULL,
	[ARTHistoryUse] [bit] NOT NULL,
	[HIVRetest] [bit] NOT NULL,
	[HIVRetestTypeId] [int] NULL,
	[ReasonForNoRetest] [varchar](250) NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_HIVEnrollmentBaseline] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HIVTesting]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HIVTesting]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HIVTesting](
	[Id] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
	[BaselineResult] [int] NOT NULL,
	[BaselineDate] [datetime] NULL,
	[TestingDate] [date] NOT NULL,
	[TestingResult] [int] NOT NULL,
	[ReferredToCare] [bit] NOT NULL,
	[CCCNumber] [varchar](20) NULL,
	[EnrollementId] [int] NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_HIVTesting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LookupItem]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LookupItem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LookupItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_LookupItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LookupMaster]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LookupMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LookupMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[DisplayName] [varchar](150) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_LookupMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LookupMasterItem]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LookupMasterItem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LookupMasterItem](
	[LookupMasterId] [int] NOT NULL,
	[LookupItemId] [int] NOT NULL,
	[DisplayName] [varchar](50) NULL,
	[OrdRank] [decimal](5, 2) NULL,
 CONSTRAINT [PK_LookupMasterItem] PRIMARY KEY CLUSTERED 
(
	[LookupMasterId] ASC,
	[LookupItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ModuleMaster]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ModuleMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ModuleMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ReferenceId] [varchar](15) NOT NULL,
	[DisplayName] [varchar](150) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[ReleaseDate] [date] NOT NULL,
	[ReleaseVersion] [varchar](8) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_ModuleMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Patient]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Patient](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ptn_PK] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
	[FaciltyId] [int] NOT NULL,
	[PatientIndex] [varchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[IdentificationType] [int] NULL,
	[IdentificationNo] [varchar](50) NULL,
	[Active] [bit] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientAllergy]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientAllergy]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientAllergy](
	[Id] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientMasterVisitId] [int] NULL,
	[Allergen] [varchar](250) NOT NULL,
	[AllergyResponse] [varchar](250) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_PatientAllergy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientAppointment]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientAppointment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientAppointment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientMasterVisitId] [int] NOT NULL,
	[ServiceAreaId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[AppointmentDate] [datetime] NOT NULL,
	[ReasonId] [int] NOT NULL,
	[Description] [varchar](250) NULL,
	[StatusId] [int] NOT NULL,
	[StatusDate] [date] NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AudityData] [xml] NULL,
 CONSTRAINT [PK_PatientAppointment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientCareending]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientCareending]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientCareending](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientMasterVisitId] [int] NOT NULL,
	[PatientEnrollmentId] [int] NOT NULL,
	[ExitReason] [int] NOT NULL,
	[ExitDate] [date] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_PatientCareending_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PatientChronicIllness]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientChronicIllness]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientChronicIllness](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientMasterVisitId] [int] NOT NULL,
	[ChronicIllness] [int] NOT NULL,
	[Treatment] [varchar](150) NOT NULL,
	[Dose] [int] NULL,
	[Duration] [int] NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_PatientChronicIllness] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientClinicalDiagnosis]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientClinicalDiagnosis]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientClinicalDiagnosis](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientMasterVisitId] [int] NOT NULL,
	[Diagnosis] [varchar](250) NOT NULL,
	[Treatment] [varchar](250) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_PatientClinicalDiagnosis] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientClinicalNotes]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientClinicalNotes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientClinicalNotes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[FacilityId] [int] NOT NULL,
	[PatientMasterVisitId] [int] NOT NULL,
	[ServiceAreaId] [int] NOT NULL,
	[ClinicalNotes] [varchar](8000) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifyFlag] [bit] NOT NULL,
	[VersionStamp] [timestamp] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_PatientClinicalNotes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientDiagnosis]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientDiagnosis]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientDiagnosis](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientMasterVisitId] [int] NOT NULL,
	[Diagnosis] [int] NOT NULL,
	[ManagementPlan] [varchar](400) NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_PatientDiagnosis] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientEncounter]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientEncounter]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientEncounter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[EncounterTypeId] [int] NOT NULL,
	[PatientMasterVisitId] [int] NOT NULL,
	[EncounterStartTime] [datetime] NOT NULL,
	[EncounterEndTime] [datetime] NOT NULL,
	[ServiceAreaId] [int] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_PatientEncounter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PatientEnrollment]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientEnrollment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientEnrollment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServiceAreaId] [int] NOT NULL,
	[EnrollmentDate] [date] NOT NULL,
	[EnrollmentStatusId] [int] NOT NULL,
	[TransferIn] [bit] NOT NULL,
	[CareEnded] [bit] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_PatientEnrollment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PatientFamilyPlanning]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientFamilyPlanning]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientFamilyPlanning](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientMasterVisitId] [int] NOT NULL,
	[FPStatusId] [int] NOT NULL,
	[ReasonNotOnFPId] [int] NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NOT NULL,
 CONSTRAINT [PK_PatientFamilyPlanning] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PatientFamilyPlanningMethod]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientFamilyPlanningMethod]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientFamilyPlanningMethod](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientFPId] [int] NOT NULL,
	[FPMethodId] [int] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_PatientFamilyPlanningMethod] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PatientIdentifier]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientIdentifier]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientIdentifier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientEnrollmentId] [int] NOT NULL,
	[IdentifierType] [int] NOT NULL,
	[IdentifierValue] [varchar](50) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PatientIdentifier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientLabTracker]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientLabTracker]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientLabTracker](
	[Id] [int] NOT NULL,
	[patientId] [int] NOT NULL,
	[masterVisitId] [int] NOT NULL,
	[LabName] [varchar](50) NOT NULL,
	[SampleDate] [date] NOT NULL,
	[Reasons] [varchar](50) NOT NULL,
	[Results] [varchar](50) NOT NULL,
	[Void] [bit] NOT NULL,
	[VoidBy] [int] NULL,
	[VoidDate] [datetime] NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PatientLabTracker] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientMaritalStatus]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientMaritalStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientMaritalStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[MaritalStatusId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CeateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_PatientMaritalStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PatientMasterVisit]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientMasterVisit]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientMasterVisit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[FaciltyId] [int] NOT NULL,
	[VisitDate] [datetime] NOT NULL,
	[Schedule] [bit] NOT NULL,
	[VisitBy] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NULL,
	[ServiceAreaId] [int] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PatientMasterVisit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PatientOVCStatus]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientOVCStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientOVCStatus](
	[Id] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[GuardianId] [int] NOT NULL,
	[Orphan] [bit] NOT NULL,
	[InSchool] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_PatientOVCStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PatientPHDP]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientPHDP]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientPHDP](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientMasterVisitId] [int] NOT NULL,
	[Phdp] [int] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_PatientPHDP] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PatientPopulation]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientPopulation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientPopulation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PopulationId] [int] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_PatientPopulation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PatientProphylaxis]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientProphylaxis]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientProphylaxis](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProphylaxisTypeId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientMasterVisitId] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[Complete] [bit] NOT NULL,
	[CompletionDate] [date] NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PatientProphylaxis] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PatientReferral]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientReferral]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientReferral](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientMasterVisitId] [int] NOT NULL,
	[ReferredFrom] [int] NOT NULL,
	[ReferredTo] [varchar](250) NULL,
	[ReferralReason] [varchar](250) NOT NULL,
	[ReferralDate] [datetime] NOT NULL,
	[ReferredBy] [varchar](50) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_PatientReferral] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientScreening]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientScreening]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientScreening](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientMasterVisitId] [int] NOT NULL,
	[ScreeningTypeId] [int] NOT NULL,
	[ScreeningDone] [bit] NOT NULL,
	[ScreeningDate] [date] NULL,
	[ScreeningCategoryId] [int] NULL,
	[ScreeningValueId] [int] NULL,
	[Comment] [varchar](250) NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_PatientScreening] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientTransferIn]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientTransferIn]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientTransferIn](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[ServiceAreaId] [int] NOT NULL,
	[TransferInDate] [date] NOT NULL,
	[TreatmentStartDate] [date] NOT NULL,
	[CurrentTreatment] [varchar](50) NOT NULL,
	[FacilityFrom] [varchar](150) NOT NULL,
	[MFLCode] [int] NOT NULL,
	[CountyFrom] [varchar](150) NOT NULL,
	[TransferInNotes] [varchar](250) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PatientTransferIn] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientTreatmentSupporter]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientTreatmentSupporter]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientTreatmentSupporter](
	[Id] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[SupporterId] [int] NOT NULL,
	[DeleteFlag] [int] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_PatientTreatmentSupporter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PatientVitals]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientVitals]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientVitals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientMasterVisitId] [int] NOT NULL,
	[Temperature] [decimal](5, 2) NULL,
	[RespistoryRate] [decimal](5, 2) NULL,
	[HeartRate] [decimal](5, 2) NULL,
	[BPDiastolic] [int] NULL,
	[BPSystolic] [int] NULL,
	[Height] [decimal](8, 2) NULL,
	[Weight] [decimal](8, 2) NULL,
	[Muac] [decimal](8, 2) NULL,
	[SP02] [decimal](5, 2) NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PatientVitals_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Person]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Person]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varbinary](max) NOT NULL,
	[MidName] [varbinary](max) NULL,
	[LastName] [varbinary](max) NOT NULL,
	[Sex] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PersonContact]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonContact]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PersonContact](
	[Id] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
	[PhysicalAddress] [varbinary](800) NOT NULL,
	[MobileNumber] [varbinary](800) NOT NULL,
	[Active] [bit] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_patient_contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PersonLocation]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonLocation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PersonLocation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[County] [int] NOT NULL,
	[SubCounty] [int] NULL,
	[Ward] [int] NULL,
	[Village] [varchar](250) NOT NULL,
	[Estate] [varchar](250) NOT NULL,
	[LandMark] [varchar](250) NOT NULL,
	[NearestHealthCentre] [varchar](250) NOT NULL,
	[Active] [bit] NOT NULL,
	[SketchMap] [varbinary](1000) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_PersonLocation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PersonRelationship]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonRelationship]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PersonRelationship](
	[PersonId] [int] NOT NULL,
	[RelatedTo] [int] NOT NULL,
	[RelationshipTypeId] [int] NOT NULL,
 CONSTRAINT [PK_PersonRelationship] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC,
	[RelatedTo] ASC,
	[RelationshipTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PhysicalExamination]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PhysicalExamination]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PhysicalExamination](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientMasterVisitId] [int] NOT NULL,
	[ExaminationTypeId] [int] NOT NULL,
	[ExamId] [int] NOT NULL,
	[Finding] [varchar](400) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PhysicalExamination_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pregnancy]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pregnancy]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Pregnancy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NULL,
	[PatientMasterVisitId] [int] NULL,
	[LMP] [date] NOT NULL,
	[EDD] [date] NOT NULL,
	[Gravidae] [varchar](50) NULL,
	[Parity] [varchar](50) NULL,
	[Outcome] [int] NULL,
	[DateOfOutcome] [date] NULL,
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_Pregnancy_Void]  DEFAULT ((0)),
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_Pregnancy_CreateDate]  DEFAULT (getdate()),
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_Pregnancy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PregnancyIndicator]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PregnancyIndicator]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PregnancyIndicator](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientMasterVisitId] [int] NOT NULL,
	[LMP] [date] NOT NULL,
	[EDD] [date] NULL,
	[PregnacyStatusId] [int] NULL,
	[ANCProfile] [bit] NOT NULL CONSTRAINT [DF_PregnancyIndicator_ANCProfile]  DEFAULT ((0)),
	[ANCProfileDate] [date] NULL,
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_PregnancyIndicator_DeleteFlag]  DEFAULT ((0)),
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_PregnancyIndicator_CreateDate]  DEFAULT (getdate()),
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_PregnancyIndicator] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ServiceEntryPoint]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceEntryPoint]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ServiceEntryPoint](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[ServiceAreaId] [int] NOT NULL,
	[EntryPointId] [int] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ServiceEntryPoint] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TBTreatmentTracker]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBTreatmentTracker]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TBTreatmentTracker](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[YearMonth] [varchar](8) NOT NULL,
	[ScreeningId] [int] NOT NULL,
	[TBRegNumber] [varchar](50) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_TBTreatmentTracker] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TreatmentEventTracker]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TreatmentEventTracker]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TreatmentEventTracker](
	[id] [int] NOT NULL,
	[patientId] [int] NOT NULL,
	[MasterVisitId] [int] NOT NULL,
	[eventDate] [date] NOT NULL,
	[eventType] [int] NOT NULL,
	[category] [varchar](50) NOT NULL,
	[previous] [varchar](50) NOT NULL,
	[current] [varchar](50) NOT NULL,
	[reason] [varchar](150) NOT NULL,
	[Notes] [varchar](250) NOT NULL,
	[void] [int] NULL,
	[voidBy] [int] NULL,
	[voidDate] [date] NULL,
	[createBy] [int] NOT NULL,
	[createDate] [date] NOT NULL,
 CONSTRAINT [PK_TreatmentEventTracker] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User](
	[Id] [int] NOT NULL,
	[UserName] [varbinary](400) NOT NULL,
	[Password] [varbinary](400) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[Locked] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditLog] [xml] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vaccination]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vaccination]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vaccination](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientMasterVisitId] [int] NOT NULL,
	[Vaccine] [int] NOT NULL,
	[VaccineStage] [varchar](50) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_Vaccination] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[LookupItemView]    Script Date: 12/21/2016 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[LookupItemView]'))
EXEC dbo.sp_executesql @statement = N'
CREATE view [dbo].[LookupItemView]
as
Select	M.Id			As MasterId
	,	I.Id			As ItemId
	,	M.Name			As MasterName
	,	I.Name			As ItemName
	,	L.DisplayName
	,	L.DisplayName	As ItemDisplayName
	,	L.OrdRank
From LookupMaster As M
Inner Join LookupMasterItem As L On M.Id = L.LookupMasterId
Inner Join LookupItem As I On L.LookupItemId = I.Id
' 
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_LookupItem]    Script Date: 12/21/2016 12:01:24 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[LookupItem]') AND name = N'IX_LookupItem')
CREATE UNIQUE NONCLUSTERED INDEX [IX_LookupItem] ON [dbo].[LookupItem]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_LookupMaster]    Script Date: 12/21/2016 12:01:24 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[LookupMaster]') AND name = N'IX_LookupMaster')
CREATE UNIQUE NONCLUSTERED INDEX [IX_LookupMaster] ON [dbo].[LookupMaster]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Patient]    Script Date: 12/21/2016 12:01:24 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Patient]') AND name = N'IX_Patient')
CREATE UNIQUE NONCLUSTERED INDEX [IX_Patient] ON [dbo].[Patient]
(
	[PatientIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Patient_PtnPK]    Script Date: 12/21/2016 12:01:24 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Patient]') AND name = N'IX_Patient_PtnPK')
CREATE NONCLUSTERED INDEX [IX_Patient_PtnPK] ON [dbo].[Patient]
(
	[Ptn_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientClinicalNotes]    Script Date: 12/21/2016 12:01:24 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PatientClinicalNotes]') AND name = N'IX_PatientClinicalNotes')
CREATE NONCLUSTERED INDEX [IX_PatientClinicalNotes] ON [dbo].[PatientClinicalNotes]
(
	[PatientId] ASC,
	[PatientMasterVisitId] ASC,
	[FacilityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_User_UserName]    Script Date: 12/21/2016 12:01:24 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND name = N'IX_User_UserName')
CREATE UNIQUE NONCLUSTERED INDEX [IX_User_UserName] ON [dbo].[User]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientAdheranceAssessment_Void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AdherenceOutcome] ADD  CONSTRAINT [DF_PatientAdheranceAssessment_Void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_AdverseEvent_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AdverseEvent] ADD  CONSTRAINT [DF_AdverseEvent_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_AdverseEvent_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AdverseEvent] ADD  CONSTRAINT [DF_AdverseEvent_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientARTInitiationBaseline_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ARTInitiationBaseline] ADD  CONSTRAINT [DF_PatientARTInitiationBaseline_void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ARTInitiationBaseline_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ARTInitiationBaseline] ADD  CONSTRAINT [DF_ARTInitiationBaseline_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ARTUseHistory_Void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ARTUseHistory] ADD  CONSTRAINT [DF_ARTUseHistory_Void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ARTUseHistory_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ARTUseHistory] ADD  CONSTRAINT [DF_ARTUseHistory_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ARVTreatmentTracker_RegimenLineId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ARVTreatmentTracker] ADD  CONSTRAINT [DF_ARVTreatmentTracker_RegimenLineId]  DEFAULT ((0)) FOR [RegimenLineId]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ARVTreatmentTracker_DrugId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ARVTreatmentTracker] ADD  CONSTRAINT [DF_ARVTreatmentTracker_DrugId]  DEFAULT ((0)) FOR [DrugId]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ARVTreatmentTracker_ParentId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ARVTreatmentTracker] ADD  CONSTRAINT [DF_ARVTreatmentTracker_ParentId]  DEFAULT ((0)) FOR [ParentId]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ARVTreatmentTracker_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ARVTreatmentTracker] ADD  CONSTRAINT [DF_ARVTreatmentTracker_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ARVTreatmentTracker_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ARVTreatmentTracker] ADD  CONSTRAINT [DF_ARVTreatmentTracker_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ComplaintsHistory_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ComplaintsHistory] ADD  CONSTRAINT [DF_ComplaintsHistory_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Disclosure_Void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Disclosure] ADD  CONSTRAINT [DF_Disclosure_Void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Disclosure_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Disclosure] ADD  CONSTRAINT [DF_Disclosure_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_DiagnosisARVHistory_Void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HIVEnrollmentBaseline] ADD  CONSTRAINT [DF_DiagnosisARVHistory_Void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_DiagnosisARVHistory_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HIVEnrollmentBaseline] ADD  CONSTRAINT [DF_DiagnosisARVHistory_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_HIVTesting_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HIVTesting] ADD  CONSTRAINT [DF_HIVTesting_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_HIVTesting_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HIVTesting] ADD  CONSTRAINT [DF_HIVTesting_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_LookupItem_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LookupItem] ADD  CONSTRAINT [DF_LookupItem_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_LookupMaster_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LookupMaster] ADD  CONSTRAINT [DF_LookupMaster_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_LookupMasterItem_OrdRank]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LookupMasterItem] ADD  CONSTRAINT [DF_LookupMasterItem_OrdRank]  DEFAULT ((0.00)) FOR [OrdRank]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ModuleMaster_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ModuleMaster] ADD  CONSTRAINT [DF_ModuleMaster_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ModuleMaster_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ModuleMaster] ADD  CONSTRAINT [DF_ModuleMaster_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Patient_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Patient] ADD  CONSTRAINT [DF_Patient_Status]  DEFAULT ((0)) FOR [Active]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_person_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Patient] ADD  CONSTRAINT [DF_person_void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientAllergies_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientAllergy] ADD  CONSTRAINT [DF_PatientAllergies_void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientAllergy_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientAllergy] ADD  CONSTRAINT [DF_PatientAllergy_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientAppointment_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientAppointment] ADD  CONSTRAINT [DF_PatientAppointment_Status]  DEFAULT ((0)) FOR [StatusId]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientAppointment_Void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientAppointment] ADD  CONSTRAINT [DF_PatientAppointment_Void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientAppointment_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientAppointment] ADD  CONSTRAINT [DF_PatientAppointment_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientCareending_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientCareending] ADD  CONSTRAINT [DF_PatientCareending_void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ChronicIllness_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientChronicIllness] ADD  CONSTRAINT [DF_ChronicIllness_void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientChronicIllness_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientChronicIllness] ADD  CONSTRAINT [DF_PatientChronicIllness_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientTreatementDiagnosis_Void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientClinicalDiagnosis] ADD  CONSTRAINT [DF_PatientTreatementDiagnosis_Void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientTreatementDiagnosis_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientClinicalDiagnosis] ADD  CONSTRAINT [DF_PatientTreatementDiagnosis_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_dtl_PatientClinicalNotes_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientClinicalNotes] ADD  CONSTRAINT [DF_dtl_PatientClinicalNotes_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientClinicalNotes_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientClinicalNotes] ADD  CONSTRAINT [DF_PatientClinicalNotes_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_dtl_PatientClinicalNotes_ModifiedFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientClinicalNotes] ADD  CONSTRAINT [DF_dtl_PatientClinicalNotes_ModifiedFlag]  DEFAULT ((0)) FOR [ModifyFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientDiagnosis_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientDiagnosis] ADD  CONSTRAINT [DF_PatientDiagnosis_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_patient_encounter_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientEncounter] ADD  CONSTRAINT [DF_patient_encounter_void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientEncounter_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientEncounter] ADD  CONSTRAINT [DF_PatientEncounter_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientEnrollment_TransferIn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientEnrollment] ADD  CONSTRAINT [DF_PatientEnrollment_TransferIn]  DEFAULT ((0)) FOR [TransferIn]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientEnrollment_Active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientEnrollment] ADD  CONSTRAINT [DF_PatientEnrollment_Active]  DEFAULT ((0)) FOR [CareEnded]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_patient_enrollment_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientEnrollment] ADD  CONSTRAINT [DF_patient_enrollment_void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientEnrollment_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientEnrollment] ADD  CONSTRAINT [DF_PatientEnrollment_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientFamilyPlanning_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientFamilyPlanning] ADD  CONSTRAINT [DF_PatientFamilyPlanning_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientFamilyPlanning_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientFamilyPlanning] ADD  CONSTRAINT [DF_PatientFamilyPlanning_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientFamilyPlanningMethod_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientFamilyPlanningMethod] ADD  CONSTRAINT [DF_PatientFamilyPlanningMethod_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_patient_identifier_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientIdentifier] ADD  CONSTRAINT [DF_patient_identifier_void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientIdentifier_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientIdentifier] ADD  CONSTRAINT [DF_PatientIdentifier_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientLabTracker_Void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientLabTracker] ADD  CONSTRAINT [DF_PatientLabTracker_Void]  DEFAULT ((0)) FOR [Void]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientMaritalStatus_Active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientMaritalStatus] ADD  CONSTRAINT [DF_PatientMaritalStatus_Active]  DEFAULT ((1)) FOR [Active]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_patient_maritalstatus_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientMaritalStatus] ADD  CONSTRAINT [DF_patient_maritalstatus_void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_patient_maritalstatus_create_date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientMaritalStatus] ADD  CONSTRAINT [DF_patient_maritalstatus_create_date]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientMasterVisit_status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientMasterVisit] ADD  CONSTRAINT [DF_PatientMasterVisit_status]  DEFAULT ((0)) FOR [ServiceAreaId]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientMasterVisit_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientMasterVisit] ADD  CONSTRAINT [DF_PatientMasterVisit_void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_patient_ovcstatus_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientOVCStatus] ADD  CONSTRAINT [DF_patient_ovcstatus_void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientPHDP_Void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientPHDP] ADD  CONSTRAINT [DF_PatientPHDP_Void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientPHDP_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientPHDP] ADD  CONSTRAINT [DF_PatientPHDP_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_patient_population_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientPopulation] ADD  CONSTRAINT [DF_patient_population_void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_patient_population_create_date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientPopulation] ADD  CONSTRAINT [DF_patient_population_create_date]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_INHProphylaxis_Void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientProphylaxis] ADD  CONSTRAINT [DF_INHProphylaxis_Void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_INHProphylaxis_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientProphylaxis] ADD  CONSTRAINT [DF_INHProphylaxis_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientReferral_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientReferral] ADD  CONSTRAINT [DF_PatientReferral_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientReferral_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientReferral] ADD  CONSTRAINT [DF_PatientReferral_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientScreening_Void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientScreening] ADD  CONSTRAINT [DF_PatientScreening_Void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientScreening_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientScreening] ADD  CONSTRAINT [DF_PatientScreening_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_transfer_in_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientTransferIn] ADD  CONSTRAINT [DF_transfer_in_void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientTransferIn_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientTransferIn] ADD  CONSTRAINT [DF_PatientTransferIn_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientTreatmentSupporter_Void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientTreatmentSupporter] ADD  CONSTRAINT [DF_PatientTreatmentSupporter_Void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientVitals_Void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientVitals] ADD  CONSTRAINT [DF_PatientVitals_Void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientVitals_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientVitals] ADD  CONSTRAINT [DF_PatientVitals_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Person_Active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [DF_Person_Active]  DEFAULT ((1)) FOR [Active]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Person_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [DF_Person_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientContact_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PersonContact] ADD  CONSTRAINT [DF_PatientContact_IsActive]  DEFAULT ((1)) FOR [Active]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_patient_contact_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PersonContact] ADD  CONSTRAINT [DF_patient_contact_void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PersonContact_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PersonContact] ADD  CONSTRAINT [DF_PersonContact_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientLocation_Village]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PersonLocation] ADD  CONSTRAINT [DF_PatientLocation_Village]  DEFAULT (NULL) FOR [Village]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientLocation_Estate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PersonLocation] ADD  CONSTRAINT [DF_PatientLocation_Estate]  DEFAULT (NULL) FOR [Estate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientLocation_LandMark]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PersonLocation] ADD  CONSTRAINT [DF_PatientLocation_LandMark]  DEFAULT (NULL) FOR [LandMark]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PatientLocation_NearestHealthCentre]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PersonLocation] ADD  CONSTRAINT [DF_PatientLocation_NearestHealthCentre]  DEFAULT (NULL) FOR [NearestHealthCentre]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_person_location_is_active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PersonLocation] ADD  CONSTRAINT [DF_person_location_is_active]  DEFAULT ((1)) FOR [Active]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_person_location_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PersonLocation] ADD  CONSTRAINT [DF_person_location_void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_person_location_create_by]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PersonLocation] ADD  CONSTRAINT [DF_person_location_create_by]  DEFAULT ((0)) FOR [CreateBy]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PhysicalExamination_Void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PhysicalExamination] ADD  CONSTRAINT [DF_PhysicalExamination_Void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PhysicalExamination_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PhysicalExamination] ADD  CONSTRAINT [DF_PhysicalExamination_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ServiceEntryPoint_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServiceEntryPoint] ADD  CONSTRAINT [DF_ServiceEntryPoint_void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ServiceEntryPoint_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServiceEntryPoint] ADD  CONSTRAINT [DF_ServiceEntryPoint_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_TBTreatmentTracker_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBTreatmentTracker] ADD  CONSTRAINT [DF_TBTreatmentTracker_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_TBTreatmentTracker_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBTreatmentTracker] ADD  CONSTRAINT [DF_TBTreatmentTracker_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_TreatmentEventTracker_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TreatmentEventTracker] ADD  CONSTRAINT [DF_TreatmentEventTracker_void]  DEFAULT ((0)) FOR [void]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_User_Active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Active]  DEFAULT ((0)) FOR [Active]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_User_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_User_Locked]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Locked]  DEFAULT ((0)) FOR [Locked]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_AdultChildVaccination_Void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vaccination] ADD  CONSTRAINT [DF_AdultChildVaccination_Void]  DEFAULT ((0)) FOR [DeleteFlag]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_AdultChildVaccination_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vaccination] ADD  CONSTRAINT [DF_AdultChildVaccination_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdherenceOutcome_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdherenceOutcome]'))
ALTER TABLE [dbo].[AdherenceOutcome]  WITH CHECK ADD  CONSTRAINT [FK_AdherenceOutcome_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdherenceOutcome_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdherenceOutcome]'))
ALTER TABLE [dbo].[AdherenceOutcome] CHECK CONSTRAINT [FK_AdherenceOutcome_Patient]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientAdheranceAssessment_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdherenceOutcome]'))
ALTER TABLE [dbo].[AdherenceOutcome]  WITH CHECK ADD  CONSTRAINT [FK_PatientAdheranceAssessment_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId])
REFERENCES [dbo].[PatientMasterVisit] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientAdheranceAssessment_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdherenceOutcome]'))
ALTER TABLE [dbo].[AdherenceOutcome] CHECK CONSTRAINT [FK_PatientAdheranceAssessment_PatientMasterVisit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdverseEvent_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdverseEvent]'))
ALTER TABLE [dbo].[AdverseEvent]  WITH CHECK ADD  CONSTRAINT [FK_AdverseEvent_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdverseEvent_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdverseEvent]'))
ALTER TABLE [dbo].[AdverseEvent] CHECK CONSTRAINT [FK_AdverseEvent_Patient]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdverseEvent_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdverseEvent]'))
ALTER TABLE [dbo].[AdverseEvent]  WITH CHECK ADD  CONSTRAINT [FK_AdverseEvent_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId])
REFERENCES [dbo].[PatientMasterVisit] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdverseEvent_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdverseEvent]'))
ALTER TABLE [dbo].[AdverseEvent] CHECK CONSTRAINT [FK_AdverseEvent_PatientMasterVisit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARTInitiationBaseline_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[ARTInitiationBaseline]'))
ALTER TABLE [dbo].[ARTInitiationBaseline]  WITH CHECK ADD  CONSTRAINT [FK_ARTInitiationBaseline_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARTInitiationBaseline_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[ARTInitiationBaseline]'))
ALTER TABLE [dbo].[ARTInitiationBaseline] CHECK CONSTRAINT [FK_ARTInitiationBaseline_Patient]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARTInitiationBaseline_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[ARTInitiationBaseline]'))
ALTER TABLE [dbo].[ARTInitiationBaseline]  WITH CHECK ADD  CONSTRAINT [FK_ARTInitiationBaseline_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId])
REFERENCES [dbo].[PatientMasterVisit] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARTInitiationBaseline_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[ARTInitiationBaseline]'))
ALTER TABLE [dbo].[ARTInitiationBaseline] CHECK CONSTRAINT [FK_ARTInitiationBaseline_PatientMasterVisit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARTUseHistory_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[ARTUseHistory]'))
ALTER TABLE [dbo].[ARTUseHistory]  WITH CHECK ADD  CONSTRAINT [FK_ARTUseHistory_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARTUseHistory_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[ARTUseHistory]'))
ALTER TABLE [dbo].[ARTUseHistory] CHECK CONSTRAINT [FK_ARTUseHistory_Patient]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARTUseHistory_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[ARTUseHistory]'))
ALTER TABLE [dbo].[ARTUseHistory]  WITH CHECK ADD  CONSTRAINT [FK_ARTUseHistory_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId])
REFERENCES [dbo].[PatientMasterVisit] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARTUseHistory_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[ARTUseHistory]'))
ALTER TABLE [dbo].[ARTUseHistory] CHECK CONSTRAINT [FK_ARTUseHistory_PatientMasterVisit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ComplaintsHistory_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[ComplaintsHistory]'))
ALTER TABLE [dbo].[ComplaintsHistory]  WITH CHECK ADD  CONSTRAINT [FK_ComplaintsHistory_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId])
REFERENCES [dbo].[PatientMasterVisit] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ComplaintsHistory_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[ComplaintsHistory]'))
ALTER TABLE [dbo].[ComplaintsHistory] CHECK CONSTRAINT [FK_ComplaintsHistory_PatientMasterVisit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Disclosure_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[Disclosure]'))
ALTER TABLE [dbo].[Disclosure]  WITH CHECK ADD  CONSTRAINT [FK_Disclosure_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId])
REFERENCES [dbo].[PatientMasterVisit] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Disclosure_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[Disclosure]'))
ALTER TABLE [dbo].[Disclosure] CHECK CONSTRAINT [FK_Disclosure_PatientMasterVisit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Patient_Person]') AND parent_object_id = OBJECT_ID(N'[dbo].[Patient]'))
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Patient_Person]') AND parent_object_id = OBJECT_ID(N'[dbo].[Patient]'))
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Person]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientAllergies_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientAllergy]'))
ALTER TABLE [dbo].[PatientAllergy]  WITH CHECK ADD  CONSTRAINT [FK_PatientAllergies_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId])
REFERENCES [dbo].[PatientMasterVisit] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientAllergies_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientAllergy]'))
ALTER TABLE [dbo].[PatientAllergy] CHECK CONSTRAINT [FK_PatientAllergies_PatientMasterVisit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientAppointment_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientAppointment]'))
ALTER TABLE [dbo].[PatientAppointment]  WITH CHECK ADD  CONSTRAINT [FK_PatientAppointment_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId])
REFERENCES [dbo].[PatientMasterVisit] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientAppointment_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientAppointment]'))
ALTER TABLE [dbo].[PatientAppointment] CHECK CONSTRAINT [FK_PatientAppointment_PatientMasterVisit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientCareending_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientCareending]'))
ALTER TABLE [dbo].[PatientCareending]  WITH CHECK ADD  CONSTRAINT [FK_PatientCareending_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId])
REFERENCES [dbo].[PatientMasterVisit] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientCareending_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientCareending]'))
ALTER TABLE [dbo].[PatientCareending] CHECK CONSTRAINT [FK_PatientCareending_PatientMasterVisit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientChronicIllness_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientChronicIllness]'))
ALTER TABLE [dbo].[PatientChronicIllness]  WITH CHECK ADD  CONSTRAINT [FK_PatientChronicIllness_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId])
REFERENCES [dbo].[PatientMasterVisit] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientChronicIllness_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientChronicIllness]'))
ALTER TABLE [dbo].[PatientChronicIllness] CHECK CONSTRAINT [FK_PatientChronicIllness_PatientMasterVisit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientTreatementDiagnosis_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientClinicalDiagnosis]'))
ALTER TABLE [dbo].[PatientClinicalDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_PatientTreatementDiagnosis_PatientMasterVisit] FOREIGN KEY([PatientId])
REFERENCES [dbo].[PatientMasterVisit] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientTreatementDiagnosis_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientClinicalDiagnosis]'))
ALTER TABLE [dbo].[PatientClinicalDiagnosis] CHECK CONSTRAINT [FK_PatientTreatementDiagnosis_PatientMasterVisit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientDiagnosis_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientDiagnosis]'))
ALTER TABLE [dbo].[PatientDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_PatientDiagnosis_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId])
REFERENCES [dbo].[PatientMasterVisit] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientDiagnosis_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientDiagnosis]'))
ALTER TABLE [dbo].[PatientDiagnosis] CHECK CONSTRAINT [FK_PatientDiagnosis_PatientMasterVisit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientEncounter_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientEncounter]'))
ALTER TABLE [dbo].[PatientEncounter]  WITH CHECK ADD  CONSTRAINT [FK_PatientEncounter_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId])
REFERENCES [dbo].[PatientMasterVisit] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientEncounter_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientEncounter]'))
ALTER TABLE [dbo].[PatientEncounter] CHECK CONSTRAINT [FK_PatientEncounter_PatientMasterVisit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientLabTracker_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientLabTracker]'))
ALTER TABLE [dbo].[PatientLabTracker]  WITH CHECK ADD  CONSTRAINT [FK_PatientLabTracker_PatientMasterVisit] FOREIGN KEY([masterVisitId])
REFERENCES [dbo].[PatientMasterVisit] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientLabTracker_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientLabTracker]'))
ALTER TABLE [dbo].[PatientLabTracker] CHECK CONSTRAINT [FK_PatientLabTracker_PatientMasterVisit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientOVCStatus_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientOVCStatus]'))
ALTER TABLE [dbo].[PatientOVCStatus]  WITH CHECK ADD  CONSTRAINT [FK_PatientOVCStatus_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientOVCStatus_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientOVCStatus]'))
ALTER TABLE [dbo].[PatientOVCStatus] CHECK CONSTRAINT [FK_PatientOVCStatus_Patient]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientOVCStatus_Person]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientOVCStatus]'))
ALTER TABLE [dbo].[PatientOVCStatus]  WITH CHECK ADD  CONSTRAINT [FK_PatientOVCStatus_Person] FOREIGN KEY([GuardianId])
REFERENCES [dbo].[Person] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientOVCStatus_Person]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientOVCStatus]'))
ALTER TABLE [dbo].[PatientOVCStatus] CHECK CONSTRAINT [FK_PatientOVCStatus_Person]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientPHDP_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientPHDP]'))
ALTER TABLE [dbo].[PatientPHDP]  WITH CHECK ADD  CONSTRAINT [FK_PatientPHDP_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId])
REFERENCES [dbo].[PatientMasterVisit] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientPHDP_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientPHDP]'))
ALTER TABLE [dbo].[PatientPHDP] CHECK CONSTRAINT [FK_PatientPHDP_PatientMasterVisit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientReferral_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientReferral]'))
ALTER TABLE [dbo].[PatientReferral]  WITH CHECK ADD  CONSTRAINT [FK_PatientReferral_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId])
REFERENCES [dbo].[PatientMasterVisit] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientReferral_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientReferral]'))
ALTER TABLE [dbo].[PatientReferral] CHECK CONSTRAINT [FK_PatientReferral_PatientMasterVisit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientTreatmentSupporter_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientTreatmentSupporter]'))
ALTER TABLE [dbo].[PatientTreatmentSupporter]  WITH CHECK ADD  CONSTRAINT [FK_PatientTreatmentSupporter_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientTreatmentSupporter_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientTreatmentSupporter]'))
ALTER TABLE [dbo].[PatientTreatmentSupporter] CHECK CONSTRAINT [FK_PatientTreatmentSupporter_Patient]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientTreatmentSupporter_Person]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientTreatmentSupporter]'))
ALTER TABLE [dbo].[PatientTreatmentSupporter]  WITH CHECK ADD  CONSTRAINT [FK_PatientTreatmentSupporter_Person] FOREIGN KEY([SupporterId])
REFERENCES [dbo].[Person] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientTreatmentSupporter_Person]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientTreatmentSupporter]'))
ALTER TABLE [dbo].[PatientTreatmentSupporter] CHECK CONSTRAINT [FK_PatientTreatmentSupporter_Person]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientVitals_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientVitals]'))
ALTER TABLE [dbo].[PatientVitals]  WITH CHECK ADD  CONSTRAINT [FK_PatientVitals_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId])
REFERENCES [dbo].[PatientMasterVisit] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientVitals_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientVitals]'))
ALTER TABLE [dbo].[PatientVitals] CHECK CONSTRAINT [FK_PatientVitals_PatientMasterVisit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PersonContact_Person]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonContact]'))
ALTER TABLE [dbo].[PersonContact]  WITH CHECK ADD  CONSTRAINT [FK_PersonContact_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PersonContact_Person]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonContact]'))
ALTER TABLE [dbo].[PersonContact] CHECK CONSTRAINT [FK_PersonContact_Person]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PersonLocation_Person]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonLocation]'))
ALTER TABLE [dbo].[PersonLocation]  WITH CHECK ADD  CONSTRAINT [FK_PersonLocation_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PersonLocation_Person]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonLocation]'))
ALTER TABLE [dbo].[PersonLocation] CHECK CONSTRAINT [FK_PersonLocation_Person]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PhysicalExamination_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PhysicalExamination]'))
ALTER TABLE [dbo].[PhysicalExamination]  WITH CHECK ADD  CONSTRAINT [FK_PhysicalExamination_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId])
REFERENCES [dbo].[PatientMasterVisit] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PhysicalExamination_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[PhysicalExamination]'))
ALTER TABLE [dbo].[PhysicalExamination] CHECK CONSTRAINT [FK_PhysicalExamination_PatientMasterVisit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TreatmentEventTracker_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[TreatmentEventTracker]'))
ALTER TABLE [dbo].[TreatmentEventTracker]  WITH CHECK ADD  CONSTRAINT [FK_TreatmentEventTracker_PatientMasterVisit] FOREIGN KEY([MasterVisitId])
REFERENCES [dbo].[PatientMasterVisit] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TreatmentEventTracker_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[TreatmentEventTracker]'))
ALTER TABLE [dbo].[TreatmentEventTracker] CHECK CONSTRAINT [FK_TreatmentEventTracker_PatientMasterVisit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vaccination_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vaccination]'))
ALTER TABLE [dbo].[Vaccination]  WITH CHECK ADD  CONSTRAINT [FK_Vaccination_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId])
REFERENCES [dbo].[PatientMasterVisit] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vaccination_PatientMasterVisit]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vaccination]'))
ALTER TABLE [dbo].[Vaccination] CHECK CONSTRAINT [FK_Vaccination_PatientMasterVisit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vaccination_Person]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vaccination]'))
ALTER TABLE [dbo].[Vaccination]  WITH CHECK ADD  CONSTRAINT [FK_Vaccination_Person] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Person] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vaccination_Person]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vaccination]'))
ALTER TABLE [dbo].[Vaccination] CHECK CONSTRAINT [FK_Vaccination_Person]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AdherenceOutcome', N'COLUMN',N'DeleteFlag'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defaults to zero(0) and one (1) when deleted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AdherenceOutcome', @level2type=N'COLUMN',@level2name=N'DeleteFlag'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AdherenceOutcome', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Track patient adherance on both CTX/Dapsone or ARV ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AdherenceOutcome'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AdverseEvent', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Track adverse events courses,medication causing the adverse events,severity and actiontaken.Recorded per visit' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AdverseEvent'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ARTInitiationBaseline', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Baseline summary of Initiation parameters,collected once during enrollment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ARTInitiationBaseline'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ARTUseHistory', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Records Prior ART use experience.Especially for TI patients' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ARTUseHistory'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'HIVEnrollmentBaseline', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIVEnrollmentBaseline'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Patient', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Master patient details.Captures generic patient information to be used across all service areas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Patient'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PatientAllergy', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tracks patient allergies per visit' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PatientAllergy'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PatientAppointment', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tracks patient appointments and ststus of the appointments' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PatientAppointment'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PatientCareending', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tracks care ending for patients either deaths/TO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PatientCareending'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PatientChronicIllness', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tracks Chronic Illnesses cormodities and the current treatment of the illnesses per visit' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PatientChronicIllness'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PatientDiagnosis', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Clinician conclusions on the treatment plan,done per visit' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PatientDiagnosis'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PatientEncounter', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tracks and manages all patient encounters per visit per service' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PatientEncounter'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PatientEnrollment', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tracks patient enrollment into the different service areas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PatientEnrollment'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PatientIdentifier', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tracks and manages patient service identifier information' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PatientIdentifier'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PersonContact', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tracks and manages patient contact information,can be updated to reflect the current contact details with history of the previous contacts' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonContact'
GO
