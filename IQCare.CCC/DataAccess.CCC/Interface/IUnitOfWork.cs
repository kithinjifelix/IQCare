﻿using DataAccess.Context.ModuleMaster;
using System;
using DataAccess.CCC.Interface.Baseline;
using DataAccess.CCC.Interface.enrollment;
using DataAccess.CCC.Interface.Lookup;
using DataAccess.CCC.Interface.person;
using DataAccess.CCC.Interface.Patient;
using DataAccess.CCC.Interface.Tb;
using DataAccess.CCC.Interface.visit;
using DataAccess.CCC.Interface.Triage;
using DataAccess.CCC.Interface.Encounter;
using DataAccess.CCC.Repository.person;
using DataAccess.CCC.Interface.assessment;
using DataAccess.CCC.Interface.Interoperability;
using DataAccess.CCC.Interface.Pharmacy;

namespace DataAccess.CCC.Interface
{
    public interface IUnitOfWork : IDisposable
    {
        int Complete();
        
        IModuleRepository ModuleRepository { get; }

        /* LookupContext */
        ILookupItemRepository LookupItemRepository { get; }
        ILookupRepository LookupRepository { get; }
        ILookupMasterRepository LookupMasterRepository { get; }
        IPatientLookupRepository PatientLookupRepository { get; }
        ILookupPreviousLabs LookupPreviousLabsRepository { get; }
        ILookupFacilityViralLoad LookupFacilityViralLoadRepository { get; }
        IPatientBaselineLookupRepository PatientBaselineLookupRepository { get; }
        ILookupFacilityStatisticsRepository LookupFacilityStatisticsRepository { get; }
        IPatientTreatmentTrackerLookupRepository PatientTreatmentTrackerLookupRepository { get; } 
        IFacilityListRepository FacilityListRepository { get; }
        //ILookupPatientRegimenMap LookupPatientRegimenMapRepository { get; }

        /* person and patient */
        IPersonRepository PersonRepository { get; }
        IPersonLocationRepository PersonLocationRepository { get; }
        IPersonContactRepository PersonContactRepository { get; }
        IPersonRelationshipRepository PersonRelationshipRepository { get; }
        IPatientOvcStatusRepository PatientOvcStatusRepository { get; }
        IPatientMaritalStatusRepository PatientMaritalStatusRepository { get; }
        IPatientPopulationRepository PatientPopulationRepository { get;}
        IPatientTreatmentSupporterRepository PatientTreatmentSupporterRepository { get; }

        /* patient visit */
        IPatientMasterVisitRepository PatientMasterVisitRepository { get; }
        IPatientEncounterRepository PatientEncounterRepository { get; }
        IPatientLabTrackerRepository PatientLabTrackerRepository { get; }
        IPatientLabDetailsRepository PatientLabDetailsRepository { get; }

        /* Enrollment */
        IPatientEnrollmentRepository PatientEnrollmentRepository { get; }
        IPatientEntryPointRepository PatientEntryPointRepository { get; }
        IPatientIdentifierRepository PatientIdentifierRepository { get; }
        IPatientArtDistributionRepository PatientArtDistributionRepository { get; }

        /*Triage*/
        IPatientVitalsRepository PatientVitalsRepository { get; }
        IPatientFamilyPlanningMethodRepository PatientFamilyPlanningMethodRepository { get; }
        IPatientFamilyPlanningRepository PatientFamilyPlanningRepository { get; }
        IPatientPregnancyIndicatorRepository PatientPregnanacyIndicatorRepository { get; }
        IPatientPregnancyRepository PatientPregnancyRepository { get;}
        IPatientAdverseEventOutcomeRepository PatientAdverseEventOutcomeRepository { get; }


        /* patient screening */
        IPatientScreeningRepository PatientScreeningRepository { get; }

        /* Baseline */
        IPatientArvHistoryRepository PatientArvHistoryRepository { get;  }
        IPatientHivDiagnosisRepository PatientDiagnosisHivHistoryRepository { get; }
        IPatientDisclosureRepository PatientDisclosureRepository { get; }
        IPatientHivEnrollmentBaselineRepository PatientHivEnrollmentBaselineRepository { get; }
        IPatientTransferInRepository PatientTransferInRepository { get; }
        IPatientBaselineAssessmentRepository PatientBaselineAssessmentRepository { get; }
        IPatientTreatmentInitiationRepository PatientTreatmentInitiationRepository { get;}

        /*Appointment*/
        IPatientAppointmentRepository PatientAppointmentRepository { get; }
        IBluecardAppointmentRepository BluecardAppointmentRepository { get; }

        /*Consent*/
        IPatientConsentRepository PatientConsentRepository { get; }

        //TB ICF/IPT
        IPatientIcfRepository PatientIcfRepository { get; }
        IPatientIcfActionRepository PatientIcfActionRepository { get; }
        IPatientIptRepository PatientIptRepository { get; }
        IPatientIptOutcomeRepository PatientIptOutcomeRepository { get; }
        IPatientIptWorkupRepository PatientIptWorkupRepository { get; }

        /*Patient categorization*/
        IPatientCategorizationRepository PatientCategorizationRepository { get; }

        /* Patient ART Preparation */
        IPatientPsychosocialCriteriaRepository PatientPsychosocialCriteriaRepository { get; }
        IPatientSupportSystemCriteriaRepository PatientSupportSystemCriteriaRepository { get;}

        // interoperability
        IPatientMessageRepository PatientMessageRepository { get; }
        IDrugPrescriptionMessageRepository DrugPrescriptionMessageRepository { get; }
        IViralLoadMessageRepository ViralLoadMessageRepository { get; }

        //pharmacy
        IPatientPharmacyDispenseRepository PatientPharmacyDispenseRepository { get; }
        IPharmacyOrderRepository PharmacyOrderRepository { get; }
        IDrugRepository DrugRepository { get; }

    }
}
