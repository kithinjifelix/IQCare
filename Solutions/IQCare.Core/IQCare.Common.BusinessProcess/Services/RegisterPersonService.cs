﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IQCare.Common.BusinessProcess.Commands.Enrollment;
using IQCare.Common.BusinessProcess.Commands.PersonCommand;
using IQCare.Common.Core.Models;
using IQCare.Common.Infrastructure;
using Microsoft.EntityFrameworkCore;
using Remotion.Linq.Parsing.Structure.IntermediateModel;
using Serilog;

namespace IQCare.Common.BusinessProcess.Services
{
    public class RegisterPersonService
    {
        private readonly ICommonUnitOfWork _unitOfWork;
        public RegisterPersonService(ICommonUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork ?? throw new ArgumentNullException(nameof(unitOfWork));
        }

        public async Task<AfyaMobileInbox> UpdateAfyaMobileInbox(int id, string afyamobileId = null, bool processed = false, DateTime? dateProcessed = null, string logMessage = null)
        {
            try
            {
                var afyaMobileMessage = await _unitOfWork.Repository<AfyaMobileInbox>().FindByIdAsync(id);
                afyaMobileMessage.AfyamobileId = afyamobileId;
                afyaMobileMessage.Processed = processed;
                afyaMobileMessage.DateProcessed = dateProcessed;
                afyaMobileMessage.LogMessage = logMessage;

                _unitOfWork.Repository<AfyaMobileInbox>().Update(afyaMobileMessage);
                await _unitOfWork.SaveAsync();

                return afyaMobileMessage;
            }
            catch (Exception e)
            {
                Log.Error(e.Message);
                throw e;
            }
        }

        public async Task<AfyaMobileInbox> AddAfyaMobileInbox(DateTime dateReceived, string afyaMobileId = null, string message = null, bool processed = false, DateTime? dateProcessed = null, string logMessage = null)
        {
            try
            {
                AfyaMobileInbox afyaMobileInbox = new AfyaMobileInbox()
                {
                    DateReceived = dateReceived,
                    AfyamobileId = afyaMobileId,
                    Message = message,
                    Processed = processed,
                    DateProcessed = dateProcessed,
                    LogMessage = logMessage
                };
                await _unitOfWork.Repository<AfyaMobileInbox>().AddAsync(afyaMobileInbox);
                await _unitOfWork.SaveAsync();
                return afyaMobileInbox;
            }
            catch (Exception e)
            {
                Log.Error(e.Message);
                throw e;
            }
        }

        public async Task<AppStateStore> AddAppStateStore(int personId, int patientId, int appStateId, int? patientMasterVisitId, int? encounterId, string appStateStoreObjects = null)
        {
            try
            {
                AppStateStore appStateStore = new AppStateStore()
                {
                    AppStateId = appStateId,
                    EncounterId = encounterId,
                    PatientId = patientId,
                    PatientMasterVisitId = patientMasterVisitId,
                    DeleteFlag = false,
                    PersonId = personId,
                    StatusDate = DateTime.Now
                };

                await _unitOfWork.Repository<AppStateStore>().AddAsync(appStateStore);
                await _unitOfWork.SaveAsync();

                if (!string.IsNullOrWhiteSpace(appStateStoreObjects))
                {
                    await _unitOfWork.Repository<AppStateStoreObjects>().AddAsync(new AppStateStoreObjects()
                    {
                        AppStateStoreId = appStateStore.Id,
                        AppStateObject = appStateStoreObjects

                    });
                    await _unitOfWork.SaveAsync();
                }

                return appStateStore;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public async Task<InteropPlacerValue> AddInteropPlacerValue(int entityId, int identifierType, int interopPlacerTypeId, string placerValue)
        {
            try
            {
                InteropPlacerValue interopPlacerValue = new InteropPlacerValue()
                {
                    EntityId = entityId,
                    IdentifierType = identifierType,
                    InteropPlacerTypeId = interopPlacerTypeId,
                    PlacerValue = placerValue
                };

                await _unitOfWork.Repository<InteropPlacerValue>().AddAsync(interopPlacerValue);
                await _unitOfWork.SaveAsync();

                return interopPlacerValue;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public async Task<PersonContact> UpdatePersonContact(int personId, string mobileNumber, string alternativenumber, int id)
        {
            try
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("exec pr_OpenDecryptedSession;");
                sql.Append($"UPDATE PersonContact SET  MobileNumber = ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{mobileNumber}') ,AlternativeNumber=ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{alternativenumber}') " +
                    $"WHERE PersonId = {personId} and Id={id};");
                sql.Append("exec [dbo].[pr_CloseDecryptedSession];");

                var personContactInsert = await _unitOfWork.Repository<PersonContact>().FromSql(sql.ToString());

                return personContactInsert.FirstOrDefault();
            }
            catch (Exception e)
            {
                throw e;
            }
        }
        public async Task<PersonContact> GetPersonContactByPersonId(int personId)
        {
            try
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("exec pr_OpenDecryptedSession;");
                sql.Append($"SELECT top 1 [Id], [PersonId], CAST(DECRYPTBYKEY([PhysicalAddress]) AS VARCHAR(50)) [PhysicalAddress], CAST(DECRYPTBYKEY([MobileNumber]) AS VARCHAR(50)) [MobileNumber], CAST(DECRYPTBYKEY([AlternativeNumber]) AS VARCHAR(50)) [AlternativeNumber], CAST(DECRYPTBYKEY([EmailAddress]) AS VARCHAR(50)) [EmailAddress], [Active], [DeleteFlag], [CreatedBy]," +
                    $" [CreateDate], AuditData FROM [dbo].[PersonContact] WHERE (DeleteFlag=0 or DeleteFlag is null) and  PersonId ='{personId}'  order by Id desc;");
                sql.Append("exec [dbo].[pr_CloseDecryptedSession];");
                var personContactList = await _unitOfWork.Repository<PersonContact>().FromSql(sql.ToString());

                return personContactList.FirstOrDefault();
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public async Task<List<InteropPlacerValue>> GetInteropPlacerValue(int interopPlacerTypeId, int identifierType, string placerValue)
        {
            try
            {
                var result = await _unitOfWork.Repository<InteropPlacerValue>().Get(x =>
                    x.InteropPlacerTypeId == interopPlacerTypeId && x.IdentifierType == identifierType &&
                    x.PlacerValue == placerValue).ToListAsync();

                return result;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public async Task<PersonRelationship> GetPersonRelationshipByPatientIdPersonId(int patientId, int personId)
        {
            try
            {
                var result = await _unitOfWork.Repository<PersonRelationship>()
                    .Get(x => x.PersonId == personId && x.PatientId == patientId).ToListAsync();

                return result.FirstOrDefault();
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public async Task<PersonRelationship> UpdatePersonRelationship(PersonRelationship personRelationship)
        {
            try
            {
                _unitOfWork.Repository<PersonRelationship>().Update(personRelationship);
                await _unitOfWork.SaveAsync();

                return personRelationship;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw e;
            }
        }

        public async Task<PersonRelationship> addPersonRelationship(int personId, int patientId, int relationshipTypeId, int userId)
        {
            try
            {
                PersonRelationship personRelationship = new PersonRelationship()
                {
                    PersonId = personId,
                    PatientId = patientId,
                    RelationshipTypeId = relationshipTypeId,
                    DeleteFlag = false,
                    CreatedBy = userId,
                    CreateDate = DateTime.Now
                };

                await _unitOfWork.Repository<PersonRelationship>().AddAsync(personRelationship);
                await _unitOfWork.SaveAsync();

                return personRelationship;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public async Task<List<PersonContact>> GetPersonContact(int personId)
        {
            try
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("exec pr_OpenDecryptedSession;");
                sql.Append($"SELECT [Id] ,[PersonId], CAST(DECRYPTBYKEY([PhysicalAddress]) AS VARCHAR(50)) [PhysicalAddress]," +
                           $"CAST(DECRYPTBYKEY([MobileNumber]) AS VARCHAR(50)) [MobileNumber]," +
                           $"CAST(DECRYPTBYKEY([AlternativeNumber]) AS VARCHAR(50)) [AlternativeNumber]," +
                           $"CAST(DECRYPTBYKEY([EmailAddress]) AS VARCHAR(50)) [EmailAddress],[Active]," +
                           $"[DeleteFlag],[CreatedBy],[CreateDate],[AuditData] FROM [dbo].[PersonContact] WHERE PersonId = '{personId}' AND DeleteFlag = 0;");
                sql.Append("exec [dbo].[pr_CloseDecryptedSession];");

                var personContact = await _unitOfWork.Repository<PersonContact>().FromSql(sql.ToString());
                return personContact;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public async Task<PersonContact> UpdatePersonContact(int personId, string physicalAddress, string mobileNumber)
        {
            try
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("exec pr_OpenDecryptedSession;");
                sql.Append($"UPDATE PersonContact SET PhysicalAddress = ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{physicalAddress}'), MobileNumber = ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{mobileNumber}') WHERE PersonId = {personId} AND DeleteFlag = 0;");
                sql.Append($"SELECT [Id] ,[PersonId], CAST(DECRYPTBYKEY([PhysicalAddress]) AS VARCHAR(50)) [PhysicalAddress]," +
                           $"CAST(DECRYPTBYKEY([MobileNumber]) AS VARCHAR(50)) [MobileNumber]," +
                           $"CAST(DECRYPTBYKEY([AlternativeNumber]) AS VARCHAR(50)) [AlternativeNumber]," +
                           $"CAST(DECRYPTBYKEY([EmailAddress]) AS VARCHAR(50)) [EmailAddress],[Active]," +
                           $"[DeleteFlag],[CreatedBy],[CreateDate],[AuditData] FROM [dbo].[PersonContact] WHERE PersonId = '{personId}' AND DeleteFlag = 0;");
                sql.Append("exec [dbo].[pr_CloseDecryptedSession];");

                var personContactInsert = await _unitOfWork.Repository<PersonContact>().FromSql(sql.ToString());

                return personContactInsert.FirstOrDefault();
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public async Task<PersonContact> addPersonContact(int personId, string physicalAddress, string mobileNumber, string alternativeNumber, string emailAddress, int userId)
        {
            try
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("exec pr_OpenDecryptedSession;");
                sql.Append("INSERT INTO PersonContact(PersonId,PhysicalAddress,MobileNumber,AlternativeNumber,EmailAddress,Active,DeleteFlag,CreateDate,CreatedBy, AuditData)");
                sql.Append($"VALUES('{personId}', ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{physicalAddress}'), ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{mobileNumber}'), ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{alternativeNumber}'), ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{emailAddress}'), 1, 0, GETDATE(), '{userId}', NULL);");
                sql.Append("SELECT [Id], [PersonId], CAST(DECRYPTBYKEY([PhysicalAddress]) AS VARCHAR(50)) [PhysicalAddress], CAST(DECRYPTBYKEY([MobileNumber]) AS VARCHAR(50)) [MobileNumber], CAST(DECRYPTBYKEY([AlternativeNumber]) AS VARCHAR(50)) [AlternativeNumber], CAST(DECRYPTBYKEY([EmailAddress]) AS VARCHAR(50)) [EmailAddress], [Active], [DeleteFlag], [CreatedBy], [CreateDate], AuditData FROM [dbo].[PersonContact] WHERE Id = SCOPE_IDENTITY();");
                sql.Append("exec [dbo].[pr_CloseDecryptedSession];");

                var personContactInsert = await _unitOfWork.Repository<PersonContact>().FromSql(sql.ToString());

                return personContactInsert.FirstOrDefault();
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public async Task<List<PersonPriority>> addPersonPriority(int personId, List<int> priorities, int userid)
        {
            try
            {
                List<PersonPriority> personPriorities = new List<PersonPriority>();
                priorities.ForEach(x => personPriorities.Add(new PersonPriority()
                {
                    PersonId = personId,
                    PriorityId = x,
                    DeleteFlag = false,
                    CreatedBy = userid,
                    CreateDate = DateTime.Now
                }));

                await _unitOfWork.Repository<PersonPriority>().AddRangeAsync(personPriorities);
                await _unitOfWork.SaveAsync();

                return personPriorities;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public async Task<List<PersonPopulation>> UpdatePersonPopulation(int personId, List<int> populations, int userId)
        {
            try
            {
                var personPopulations = await _unitOfWork.Repository<PersonPopulation>()
                    .Get(x => x.PersonId == personId && x.DeleteFlag == false).ToListAsync();
                foreach (var population in personPopulations)
                {
                    population.DeleteFlag = true;
                    _unitOfWork.Repository<PersonPopulation>().Update(population);
                    await _unitOfWork.SaveAsync();
                }

                await addPersonPopulation(personId, populations, userId);
                await _unitOfWork.SaveAsync();

                return personPopulations;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public async Task<List<PersonPopulation>> addPersonPopulation(int personId, List<int> populations, int userId)
        {
            try
            {
                List<PersonPopulation> personPopulations = new List<PersonPopulation>();
                var populationType = "Key Population";
                for (int i = 0; i < populations.Count; i++)
                {
                    var keyPop = await _unitOfWork.Repository<LookupItemView>()
                        .Get(x => x.MasterName == "HTSKeyPopulation" && x.ItemId == populations[i])
                        .FirstOrDefaultAsync();

                    if (keyPop != null && keyPop.ItemName == "Not Applicable")
                    {
                        populationType = "General Population";
                    }
                }

                populations.ForEach(t => personPopulations.Add(new PersonPopulation
                {
                    PersonId = personId,
                    PopulationType = populationType,
                    PopulationCategory = t,
                    Active = true,
                    DeleteFlag = false,
                    CreatedBy = userId,
                    CreateDate = DateTime.Now
                }));

                await _unitOfWork.Repository<PersonPopulation>().AddRangeAsync(personPopulations);
                await _unitOfWork.SaveAsync();

                return personPopulations;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public async Task<List<PersonLocation>> GetPersonLocation(int personId)
        {
            try
            {
                var result = await _unitOfWork.Repository<PersonLocation>()
                    .Get(x => x.PersonId == personId && x.DeleteFlag == false).ToListAsync();
                return result;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public async Task<PersonLocation> UpdatePersonLocation(int personId, string landmark)
        {
            try
            {
                var location = await _unitOfWork.Repository<PersonLocation>().Get(x => x.PersonId == personId)
                    .FirstOrDefaultAsync();

                if (location != null)
                {
                    location.LandMark = landmark;
                    _unitOfWork.Repository<PersonLocation>().Update(location);
                    await _unitOfWork.SaveAsync();
                }
                else
                {
                    location = await addPersonLocation(personId, 0, 0, 0, "", landmark, 1);
                }
                return location;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public async Task<PersonLocation> addPersonLocation(int personId, int countyId, int subCountyId, int wardId, string village, string landmark, int userId)
        {
            try
            {
                PersonLocation personLocation = new PersonLocation()
                {
                    PersonId = personId,
                    County = countyId,
                    SubCounty = subCountyId,
                    Ward = wardId,
                    Village = village,
                    Location = "",
                    SubLocation = "",
                    LandMark = landmark,
                    NearestHealthCentre = "",
                    Active = false,
                    DeleteFlag = false,
                    CreateDate = DateTime.Now,
                    CreatedBy = userId
                };

                await _unitOfWork.Repository<PersonLocation>().AddAsync(personLocation);
                await _unitOfWork.SaveAsync();

                return personLocation;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public async Task<List<PersonMaritalStatus>> GetPersonMaritalStatus(int personId)
        {
            try
            {
                var result = await _unitOfWork.Repository<PersonMaritalStatus>()
                    .Get(x => x.PersonId == personId && x.DeleteFlag == false).ToListAsync();

                return result;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public async Task<PersonMaritalStatus> UpdateMaritalStatus(int personId, int maritalStatusId)
        {
            try
            {
                var maritalStatus = await _unitOfWork.Repository<PersonMaritalStatus>().Get(x => x.PersonId == personId && x.DeleteFlag == false)
                    .FirstOrDefaultAsync();

                maritalStatus.MaritalStatusId = maritalStatusId;
                _unitOfWork.Repository<PersonMaritalStatus>().Update(maritalStatus);

                return maritalStatus;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public async Task<PersonMaritalStatus> AddMaritalStatus(int personId, int maritalStatusId, int userId)
        {
            try
            {
                PersonMaritalStatus personMaritalStatus = new PersonMaritalStatus()
                {
                    PersonId = personId,
                    MaritalStatusId = maritalStatusId,
                    Active = true,
                    DeleteFlag = false,
                    CreatedBy = userId,
                    CreateDate = DateTime.Now
                };

                await _unitOfWork.Repository<PersonMaritalStatus>().AddAsync(personMaritalStatus);
                await _unitOfWork.SaveAsync();

                return personMaritalStatus;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public async Task<List<PersonIdentifier>> getPersonIdentifiers(string identifierValue, int identifierId)
        {
            try
            {
                var identifiers = await _unitOfWork.Repository<PersonIdentifier>().Get(x =>
                    x.IdentifierValue == identifierValue && x.IdentifierId == identifierId).ToListAsync();

                return identifiers;
            }
            catch (Exception e)
            {
                throw e;
            }
        }


        public async Task<PersonIdentifier> UpdatePersonIdentifier(PersonIdentifier pmi)
        {
            try {
                _unitOfWork.Repository<PersonIdentifier>().Update(pmi);
                await _unitOfWork.SaveAsync();
                return pmi;
            }
            catch (Exception e)
            {
                throw e;
            }
        }
        public async Task<PersonIdentifier> GetCurrentPersonIdentifier(int identifierId, int PersonId)
        {
            try
            {

                var identifier = await _unitOfWork.Repository<PersonIdentifier>().Get(x => x.IdentifierId == identifierId && x.PersonId == PersonId && !x.DeleteFlag).OrderByDescending(x => x.CreateDate).FirstOrDefaultAsync();
                return identifier;

            }
            catch (Exception e)
            {
                throw e;
            }
        }

    
        public async Task<PersonIdentifier> GetCurrentPersonIdentifier(int personId)
        {
            try
            {
                var identifier = await _unitOfWork.Repository<PersonIdentifier>().Get(x=>x.PersonId == personId && !x.DeleteFlag).OrderByDescending(x => x.CreateDate).FirstOrDefaultAsync();
                return identifier; 
            }
            catch(Exception e)
            {
                throw e;
            }
        }
       
        public async Task<PersonIdentifier> addPersonIdentifiers(int personId, int identifierId, string identifierValue, int userId)
        {
            try
            {
                PersonIdentifier personIdentifier = new PersonIdentifier()
                {
                    PersonId = personId,
                    IdentifierId = identifierId,
                    IdentifierValue = identifierValue,
                    DeleteFlag = false,
                    CreatedBy = userId,
                    CreateDate = DateTime.Now
                };

                await _unitOfWork.Repository<PersonIdentifier>().AddAsync(personIdentifier);
                await _unitOfWork.SaveAsync();

                return personIdentifier;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public async Task<PatientIdentifier> EnrollPatient(string enrollmentNo, int patientId, int serviceAreaId, int createdBy, DateTime dateOfEnrollment)
        {
            try
            {
                var previouslyIdentifiers = await _unitOfWork.Repository<PatientIdentifier>().Get(y =>
                        y.IdentifierValue == enrollmentNo && y.IdentifierTypeId == 8)
                    .ToListAsync();

                if (previouslyIdentifiers.Count > 0)
                {
                    var exception = new Exception("No: " + enrollmentNo + " already exists");
                    throw exception;
                }

                var enrollmentVisitType = await _unitOfWork.Repository<LookupItemView>().Get(x => x.MasterName == "VisitType" && x.ItemName == "Enrollment").FirstOrDefaultAsync();
                int? visitType = enrollmentVisitType != null ? enrollmentVisitType.ItemId : 0;
                var patientMasterVisit = new PatientMasterVisit()
                {
                    PatientId = patientId,
                    ServiceId = serviceAreaId,
                    Start = DateTime.Now,
                    End = null,
                    Active = false,
                    VisitDate = DateTime.Now,
                    VisitType = visitType,
                    Status = 1,
                    CreateDate = DateTime.Now,
                    DeleteFlag = false,
                    CreatedBy = createdBy
                };

                await _unitOfWork.Repository<PatientMasterVisit>().AddAsync(patientMasterVisit);
                await _unitOfWork.SaveAsync();

                var patientEnrollment = new PatientEnrollment()
                {
                    PatientId = patientId,
                    ServiceAreaId = serviceAreaId,
                    EnrollmentDate = dateOfEnrollment,
                    EnrollmentStatusId = 0,
                    TransferIn = false,
                    CareEnded = false,
                    DeleteFlag = false,
                    CreatedBy = createdBy,
                    CreateDate = DateTime.Now

                };

                await _unitOfWork.Repository<PatientEnrollment>().AddAsync(patientEnrollment);
                await _unitOfWork.SaveAsync();

                var patientIdentifier = new PatientIdentifier()
                {
                    PatientId = patientId,
                    PatientEnrollmentId = patientEnrollment.Id,
                    IdentifierTypeId = 8,
                    IdentifierValue = enrollmentNo,
                    DeleteFlag = false,
                    CreatedBy = createdBy,
                    CreateDate = DateTime.Now,
                    Active = true

                };

                await _unitOfWork.Repository<PatientIdentifier>().AddAsync(patientIdentifier);
                await _unitOfWork.SaveAsync();

                return patientIdentifier;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public async Task<List<MstPatient>> InsertIntoBlueCard(string firstName, string lastName, string midName, DateTime dateOfEnrollment, 
            string maritalStatusName, string physicalAddress, string mobileNumber, string sex, string isDobPrecision, DateTime dob, int createdBy, string posId)
        {
            try
            {
                firstName = string.IsNullOrWhiteSpace(firstName) ? "" : firstName.Replace("'", "''");
                midName = string.IsNullOrWhiteSpace(midName) ? "" : midName.Replace("'", "''");
                lastName = string.IsNullOrWhiteSpace(lastName) ? "" : lastName.Replace("'", "''");

                LookupLogic lookupLogic = new LookupLogic(_unitOfWork);
                Facility facility = await _unitOfWork.Repository<Facility>().Get(x => x.PosID == posId).FirstOrDefaultAsync();
                if (facility == null)
                {
                    facility = await _unitOfWork.Repository<Facility>().Get(x => x.DeleteFlag == 0).FirstOrDefaultAsync();
                }

                var referralId = await lookupLogic.GetDecodeIdByName("VCT", 17);

                var maritalStatusId = await lookupLogic.GetDecodeIdByName(maritalStatusName, 17);
                var address = physicalAddress == null ? " " : physicalAddress;
                var phone = mobileNumber == null ? " " : mobileNumber;
                var dobPrecision = isDobPrecision == "ESTIMATED" ? 1 : 0;

                var gender = 0;
                if (sex == "Male")
                {
                    gender = 16;
                }
                else if (sex == "Female")
                {
                    gender = 17;
                }

                string dateOfBirth = dob.ToString("yyyy-MM-dd");

                StringBuilder sql = new StringBuilder();
                sql.Append("exec pr_OpenDecryptedSession;");
                sql.Append("Insert Into mst_Patient(FirstName, LastName, MiddleName, LocationID, PatientEnrollmentID, ReferredFrom, RegistrationDate, Sex, DOB, DobPrecision, MaritalStatus, Address, Phone, UserID, PosId, Status, DeleteFlag, CreateDate,MovedToPatientTable)");
                sql.Append("Values(");
                sql.Append($"ENCRYPTBYKEY(KEY_GUID('Key_CTC'),'{firstName}'),");
                sql.Append($"ENCRYPTBYKEY(KEY_GUID('Key_CTC'),'{lastName}'),");
                sql.Append($"ENCRYPTBYKEY(KEY_GUID('Key_CTC'),'{midName}'),");
                sql.Append($"'{facility.FacilityID}',");
                sql.Append("' ',");
                sql.Append($"'{referralId}',");
                sql.Append($"'{dateOfEnrollment.ToString("yyyy-MM-dd")}',");
                sql.Append($"'{gender}',");
                sql.Append($"'{dateOfBirth}',");
                sql.Append($"'{dobPrecision}',");
                sql.Append($"'{maritalStatusId}',");
                sql.Append($"ENCRYPTBYKEY(KEY_GUID('Key_CTC'),'{address}'),");
                sql.Append($"ENCRYPTBYKEY(KEY_GUID('Key_CTC'),'{phone}'),");
                sql.Append($"'{createdBy}',");
                sql.Append($"'{facility.PosID}',");
                sql.Append("0,");
                sql.Append("0,");
                sql.Append($"'{dateOfEnrollment.ToString("yyyy-MM-dd")}',");
                sql.Append("1");
                sql.Append(");");

                sql.Append("SELECT Ptn_Pk, CAST(DECRYPTBYKEY([FirstName]) AS VARCHAR(50)) AS FirstName, CAST(DECRYPTBYKEY([LastName]) AS VARCHAR(50)) AS LastName, LocationID FROM [dbo].[mst_Patient] WHERE [Ptn_Pk] = SCOPE_IDENTITY();");
                sql.Append("exec [dbo].[pr_CloseDecryptedSession];");

                var result = await _unitOfWork.Repository<MstPatient>().FromSql(sql.ToString());

                StringBuilder sqlBuilder = new StringBuilder();
                sqlBuilder.Append("Insert Into Lnk_PatientProgramStart(Ptn_pk, ModuleId, StartDate, UserID, CreateDate)");
                sqlBuilder.Append("Values(");
                sqlBuilder.Append($"'{result[0].Ptn_Pk}',");
                sqlBuilder.Append("283,");
                sqlBuilder.Append($"'{dateOfEnrollment.ToString("yyyy-MM-dd")}',");
                sqlBuilder.Append($"'{createdBy}',");
                sqlBuilder.Append($"'{dateOfEnrollment.ToString("yyyy-MM-dd")}'");
                sqlBuilder.Append(");");

                var insertResult = await _unitOfWork.Context.Database.ExecuteSqlCommandAsync(sqlBuilder.ToString());

                return result;
            }
            catch (Exception e)
            {
                Log.Error(e.Message);
                Log.Error(e.InnerException.ToString());
                throw e;
            }
        }

        public async Task<Patient> UpdatePatient(int patientId, DateTime dateOfBirth, string facilityId)
        {
            try
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("exec pr_OpenDecryptedSession;");
                sql.Append($"UPDATE Patient SET DateOfBirth = '{dateOfBirth.ToString("yyyy-MM-dd")}', FacilityId = '{facilityId}' WHERE Id = {patientId};");
                sql.Append($"SELECT [Id],[ptn_pk],[PersonId],[PatientIndex],[PatientType],[FacilityId],[Active],[DateOfBirth]," +
                           $"[DobPrecision],CAST(DECRYPTBYKEY(NationalId) AS VARCHAR(50)) [NationalId],[DeleteFlag],[CreatedBy]," +
                           $"[CreateDate],[AuditData],[RegistrationDate] FROM Patient WHERE Id = '{patientId}';");
                sql.Append("exec [dbo].[pr_CloseDecryptedSession];");


                var patientUpdate = await _unitOfWork.Repository<Patient>().FromSql(sql.ToString());
                return patientUpdate.FirstOrDefault();
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public async Task<Patient> AddPatient(int personID, int userId, int ptn_pk, string facilityId = "")
        {
            try
            {
                var facility = await _unitOfWork.Repository<Facility>().Get(x => x.DeleteFlag == 0).FirstOrDefaultAsync();
                var patientType = await _unitOfWork.Repository<LookupItemView>()
                    .Get(x => x.MasterName == "PatientType" && x.ItemName == "New").FirstOrDefaultAsync();

                var patient = await this.GetPatientByPersonId(personID);
                if (patient == null)
                {
                    var person = await this.GetPerson(personID);
                    DateTime dateOfBirth = DateTime.Now;
                    if (person != null)
                    {
                        dateOfBirth = person.DateOfBirth;
                    }

                    if (string.IsNullOrWhiteSpace(facilityId))
                    {
                        facilityId = facility.PosID;
                    }

                    var sqlPatient = "exec pr_OpenDecryptedSession;" +
                                     "Insert Into  Patient(ptn_pk,PersonId,PatientIndex,PatientType,FacilityId,Active,DateOfBirth,NationalId,DeleteFlag,CreatedBy,CreateDate,AuditData,DobPrecision)" +
                                     $"Values({ptn_pk}, {personID}, {DateTime.Now.Year + '-' + personID}, '{patientType.ItemId}', '{facilityId}', 1," +
                                     $"'{dateOfBirth.ToString("yyyy-MM-dd")}', ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '99999999'), 0, '{userId}', GETDATE()," +
                                     $"NULL, 1);" +
                                     $"SELECT [Id],[ptn_pk],[PersonId],[PatientIndex],[PatientType],[FacilityId],[Active],[DateOfBirth]," +
                                     $"[DobPrecision],CAST(DECRYPTBYKEY(NationalId) AS VARCHAR(50)) [NationalId],[DeleteFlag],[CreatedBy]," +
                                     $"[CreateDate],[AuditData],[RegistrationDate] FROM [dbo].[Patient] WHERE Id = SCOPE_IDENTITY();" +
                                     $"exec [dbo].[pr_CloseDecryptedSession];";

                    var patientInsert = await _unitOfWork.Repository<Patient>().FromSql(sqlPatient);


                    return patientInsert.FirstOrDefault();
                }
                else
                {
                    return patient;
                }
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        
        public async Task<Patient> AddPatient(int personID, DateTime dateOfBirth, int userId, string facilityId = "")
        {
            try
            {
                var facility = await _unitOfWork.Repository<Facility>().Get(x => x.DeleteFlag == 0).FirstOrDefaultAsync();
                var patientType = await _unitOfWork.Repository<LookupItemView>()
                    .Get(x => x.MasterName == "PatientType" && x.ItemName == "New").FirstOrDefaultAsync();

                if (string.IsNullOrWhiteSpace(facilityId))
                {
                    facilityId = facility.PosID;
                }


                var sqlPatient = "exec pr_OpenDecryptedSession;" +
                                 "Insert Into  Patient(ptn_pk,PersonId,PatientIndex,PatientType,FacilityId,Active,DateOfBirth,NationalId,DeleteFlag,CreatedBy,CreateDate,AuditData,DobPrecision)" +
                                 $"Values(0, {personID}, {DateTime.Now.Year + '-' + personID}, '{patientType.ItemId}', '{facilityId}', 1," +
                                 $"'{dateOfBirth.ToString("yyyy-MM-dd")}', ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '99999999'), 0, '{userId}', GETDATE()," +
                                 $"NULL, 1);" +
                                 $"SELECT [Id],[ptn_pk],[PersonId],[PatientIndex],[PatientType],[FacilityId],[Active],[DateOfBirth]," +
                                 $"[DobPrecision],CAST(DECRYPTBYKEY(NationalId) AS VARCHAR(50)) [NationalId],[DeleteFlag],[CreatedBy]," +
                                 $"[CreateDate],[AuditData],[RegistrationDate] FROM [dbo].[Patient] WHERE Id = SCOPE_IDENTITY();" +
                                 $"exec [dbo].[pr_CloseDecryptedSession];";

                var patientInsert = await _unitOfWork.Repository<Patient>().FromSql(sqlPatient);

                return patientInsert.FirstOrDefault();
            }
            catch (Exception e)
            {
                Log.Error(e.Message);
                throw e;
            }
        }


        public async Task<Patient> AddPatient(int personID, int userId, string facilityId = "")
        {
            try
            {
                var facility = await _unitOfWork.Repository<Facility>().Get(x => x.DeleteFlag == 0).FirstOrDefaultAsync();
                var patientType = await _unitOfWork.Repository<LookupItemView>()
                    .Get(x => x.MasterName == "PatientType" && x.ItemName == "New").FirstOrDefaultAsync();

                var patient = await this.GetPatientByPersonId(personID);
                if (patient == null)
                {
                    var person = await this.GetPerson(personID);
                    DateTime dateOfBirth = DateTime.Now;
                    if (person != null)
                    {
                        dateOfBirth = person.DateOfBirth;
                    }

                    if (string.IsNullOrWhiteSpace(facilityId))
                    {
                        facilityId = facility.PosID;
                    }

                    var sqlPatient = "exec pr_OpenDecryptedSession;" +
                                     "Insert Into  Patient(ptn_pk,PersonId,PatientIndex,PatientType,FacilityId,Active,DateOfBirth,NationalId,DeleteFlag,CreatedBy,CreateDate,AuditData,DobPrecision)" +
                                     $"Values(0, {personID}, {DateTime.Now.Year + '-' + personID}, '{patientType.ItemId}', '{facilityId}', 1," +
                                     $"'{dateOfBirth.ToString("yyyy-MM-dd")}', ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '99999999'), 0, '{userId}', GETDATE()," +
                                     $"NULL, 1);" +
                                     $"SELECT [Id],[ptn_pk],[PersonId],[PatientIndex],[PatientType],[FacilityId],[Active],[DateOfBirth]," +
                                     $"[DobPrecision],CAST(DECRYPTBYKEY(NationalId) AS VARCHAR(50)) [NationalId],[DeleteFlag],[CreatedBy]," +
                                     $"[CreateDate],[AuditData],[RegistrationDate] FROM [dbo].[Patient] WHERE Id = SCOPE_IDENTITY();" +
                                     $"exec [dbo].[pr_CloseDecryptedSession];";

                    var patientInsert = await _unitOfWork.Repository<Patient>().FromSql(sqlPatient);

                    return patientInsert.FirstOrDefault();
                }
                else
                {
                    return patient;
                }
            }
            catch (Exception e)
            {
                Log.Error(e.Message);
                throw e;
            }
        }

        public async Task<Patient> GetPatientByPersonId(int personId)
        {
            try
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("exec pr_OpenDecryptedSession;");
                sql.Append(
                    "SELECT [Id],[ptn_pk],[PersonId],[PatientIndex],[PatientType],[FacilityId],[Active],[DateOfBirth]," +
                    "[DobPrecision],CAST(DECRYPTBYKEY(NationalId) AS VARCHAR(50)) [NationalId],[DeleteFlag],[CreatedBy]," +
                    $"[CreateDate],[AuditData],[RegistrationDate] FROM [dbo].[Patient] WHERE Personid = '{personId}';");
                sql.Append("exec [dbo].[pr_CloseDecryptedSession];");

                var patient = await _unitOfWork.Repository<Patient>().FromSql(sql.ToString());

                return patient.FirstOrDefault();
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public async Task<Patient> GetPatient(int patientId)
        {
            try
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("exec pr_OpenDecryptedSession;");
                sql.Append(
                    "SELECT [Id],[ptn_pk],[PersonId],[PatientIndex],[PatientType],[FacilityId],[Active],[DateOfBirth]," +
                    "[DobPrecision],CAST(DECRYPTBYKEY(NationalId) AS VARCHAR(50)) [NationalId],[DeleteFlag],[CreatedBy]," +
                    $"[CreateDate],[AuditData],[RegistrationDate] FROM [dbo].[Patient] WHERE Id = '{patientId}';");
                sql.Append("exec [dbo].[pr_CloseDecryptedSession];");

                var patient = await _unitOfWork.Repository<Patient>().FromSql(sql.ToString());

                return patient.FirstOrDefault();
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public async Task<Person> GetPerson(int personId)
        {
            try
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("exec pr_OpenDecryptedSession;");
                sql.Append($"SELECT [Id] , CAST(DECRYPTBYKEY(FirstName) AS VARCHAR(50)) [FirstName] ,CAST(DECRYPTBYKEY(MidName) AS VARCHAR(50)) MidName" +
                           $",CAST(DECRYPTBYKEY(LastName) AS VARCHAR(50)) [LastName] ,[Sex] ,[Active] ,[DeleteFlag] ,[CreateDate] " +
                           $",[CreatedBy] ,[AuditData] ,[DateOfBirth] ,[DobPrecision] FROM [dbo].[Person] WHERE Id = '{personId}';");
                sql.Append("exec [dbo].[pr_CloseDecryptedSession];");

                var person = await _unitOfWork.Repository<Person>().FromSql(sql.ToString());

                return person.FirstOrDefault();
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public async Task<Person> UpdatePerson(int personId, string firstName, string middleName, string lastName, int sex, DateTime dateOfBirth)
        {
            try
            {
                StringBuilder sql = new StringBuilder();
                firstName = string.IsNullOrWhiteSpace(firstName) ? "" : firstName.Replace("'", "''");
                middleName = string.IsNullOrWhiteSpace(middleName) ? "" : middleName.Replace("'", "''");
                lastName = string.IsNullOrWhiteSpace(lastName) ? "" : lastName.Replace("'", "''");

                sql.Append("exec pr_OpenDecryptedSession;");
                sql.Append($"UPDATE Person SET FirstName = ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{firstName}'), " +
                           $"MidName = ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{middleName}'), " +
                           $"LastName = ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{lastName}'), " +
                           $"Sex = {sex}, DateOfBirth = '{dateOfBirth.ToString("yyyy-MM-dd")}', " +
                           $"DobPrecision = 1 WHERE Id = {personId}; ");
                sql.Append($"SELECT [Id] , CAST(DECRYPTBYKEY(FirstName) AS VARCHAR(50)) [FirstName] ,CAST(DECRYPTBYKEY(MidName) AS VARCHAR(50)) MidName" +
                           $",CAST(DECRYPTBYKEY(LastName) AS VARCHAR(50)) [LastName] ,[Sex] ,[Active] ,[DeleteFlag] ,[CreateDate] " +
                           $",[CreatedBy] ,[AuditData] ,[DateOfBirth] ,[DobPrecision] FROM Person WHERE Id = '{personId}';");
                sql.Append("exec [dbo].[pr_CloseDecryptedSession];");

                var personInsert = await _unitOfWork.Repository<Person>().FromSql(sql.ToString());
                return personInsert.FirstOrDefault();
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public async Task<Person> RegisterPerson(string firstName, string middleName, string lastName, int sex, DateTime dateOfBirth, int createdBy)
        {
            try
            {
                firstName = string.IsNullOrWhiteSpace(firstName) ? "" : firstName.Replace("'", "''");
                middleName = string.IsNullOrWhiteSpace(middleName) ? "" : middleName.Replace("'", "''");
                lastName = string.IsNullOrWhiteSpace(lastName) ? "" : lastName.Replace("'", "''");

                var sql =
                    "exec pr_OpenDecryptedSession;" +
                    "Insert Into Person(FirstName, MidName,LastName,Sex,DateOfBirth,DobPrecision,Active,DeleteFlag,CreateDate,CreatedBy)" +
                    $"Values(ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{firstName}'), ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{middleName}')," +
                    $"ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{lastName}'), {sex}, '{dateOfBirth.ToString("yyyy-MM-dd")}', 1," +
                    $"1,0,GETDATE(), '{createdBy}');" +
                    "SELECT [Id] , CAST(DECRYPTBYKEY(FirstName) AS VARCHAR(50)) [FirstName] ,CAST(DECRYPTBYKEY(MidName) AS VARCHAR(50)) MidName" +
                    ",CAST(DECRYPTBYKEY(LastName) AS VARCHAR(50)) [LastName] ,[Sex] ,[Active] ,[DeleteFlag] ,[CreateDate] " +
                    ",[CreatedBy] ,[AuditData] ,[DateOfBirth] ,[DobPrecision] FROM [dbo].[Person] WHERE Id = SCOPE_IDENTITY();" +
                    "exec [dbo].[pr_CloseDecryptedSession];";

                var personInsert = await _unitOfWork.Repository<Person>().FromSql(sql);

                return personInsert.FirstOrDefault();
            }
            catch (Exception e)
            {
                Log.Error(e.Message);
                throw e;
            }
        }

        public async Task<List<PersonEmergencyContact>> GetListEmergencyContacts(int PersonId)
        {

            try
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("exec pr_OpenDecryptedSession;");
                sql.Append($"Select[Id, PersonId, EmeregencyContactPersonId, CAST(DECRYPTBYKEY(MobileContact) as Varchar(100)) as MobileContact, DeleteFlag,ContactType, CreatedBy, CreateDate, AuditData" +
                           $" FROM [dbo].[PersonEmergencyContact] WHERE DeleteFlag='0' and PersonId = '{PersonId}';");
                sql.Append("exec [dbo].[pr_CloseDecryptedSession];");
                var pec = await _unitOfWork.Repository<PersonEmergencyContact>().FromSql(sql.ToString());
                return pec;
            }
            catch(Exception e)
            {
                Log.Error(e.Message);
                throw e;

            }


        }
        public async Task<PersonEmergencyContact> GetSpecificEmergencyContacts(int EmergencyContactPersonId, int PersonId)
        {

            try
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("exec pr_OpenDecryptedSession;");
                sql.Append($"Select  * FROM [dbo].[PersonEmergencyContact] pm inner join [dbo].[LookupItemView] lm on pm.ContactType=lm.ItemId WHERE pm.DeleteFlag='0' and lm.itemName='Emergency' and pm.EmergencyContactPersonId='{EmergencyContactPersonId}' and  pm.PersonId = '{PersonId}';");
                sql.Append("exec [dbo].[pr_CloseDecryptedSession];");
                var pec = await _unitOfWork.Repository<PersonEmergencyContact>().FromSql(sql.ToString());
                return pec.FirstOrDefault();
            }
            catch (Exception e)
            {
                Log.Error(e.Message);
                throw e;

            }


        }

        public async Task<PersonEmergencyContact> GetNextofkinEmergencyContacts(int EmergencyContactPersonId,int PersonId)
        {

            try
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("exec pr_OpenDecryptedSession;");
                sql.Append($"Select  * FROM [dbo].[PersonEmergencyContact] pm inner join [dbo].[LookupItemView] lm on pm.ContactType=lm.ItemId WHERE pm.DeleteFlag='0' and lm.itemName='NextofKin' and pm.EmergencyContactPersonId='{EmergencyContactPersonId}' and  pm.PersonId = '{PersonId}';");
                sql.Append("exec [dbo].[pr_CloseDecryptedSession];");
                var pec = await _unitOfWork.Repository<PersonEmergencyContact>().FromSql(sql.ToString());
                return pec.FirstOrDefault();
            }
            catch (Exception e)
            {
                Log.Error(e.Message);
                throw e;

            }


        }
        public async Task<int> UpdatePersonEmergencyContact(PersonEmergencyContact pmc)
        {
            try
            {
                SqlParameter personIdParameter = new SqlParameter("personIdParameter", SqlDbType.Int);
                personIdParameter.Value = pmc.PersonId;
                SqlParameter EmergencyContactPersonIdParameter = new SqlParameter("EmergencyContactPersonIdParameter", SqlDbType.Int);
                EmergencyContactPersonIdParameter.Value = pmc.EmergencyContactPersonId;
                SqlParameter MobileContactParameter = new SqlParameter("MobileContactParameter", SqlDbType.VarBinary);
                MobileContactParameter.Value = Encoding.ASCII.GetBytes(pmc.MobileContact.ToString());
                SqlParameter userId = new SqlParameter("CreatedBy", SqlDbType.Int);
                userId.Value = pmc.CreatedBy;
                SqlParameter DeleteFlag = new SqlParameter("DeleteFlag", SqlDbType.Bit);
                if (pmc.DeleteFlag == true)
                {
                    DeleteFlag.Value = 1;
                }
                else if (pmc.DeleteFlag == false)
                {
                    DeleteFlag.Value = 0;
                }
                SqlParameter ContactType = new SqlParameter("ContactType", SqlDbType.Int);
                ContactType.Value = pmc.ContactType;

                SqlParameter RegisteredToClinic = new SqlParameter("RegisteredToClinic", SqlDbType.Bit);
                if (pmc.RegisteredToClinic == true)
                {
                    RegisteredToClinic.Value = 1;
                }
                else if(pmc.RegisteredToClinic==false)
                {
                    RegisteredToClinic.Value = 0;
                }

                await  _unitOfWork.Repository<PersonEmergencyContact>().FromSql("exec PersonEmergencyContact_Update @personIdParameter,@EmergencyContactPersonIdParameter,@MobileContactParameter,@CreatedBy,@DeleteFlag,@ContactType,@RegisteredToClinic",
                    personIdParameter,EmergencyContactPersonIdParameter,MobileContactParameter,userId,DeleteFlag,ContactType,RegisteredToClinic
                    );
               int res= await _unitOfWork.SaveChangesAsync();

                return res;
                    
            }
            catch(Exception e)
            {
                Log.Error(e.Message);
                throw e;

            }
        }

        public async Task<PersonEmergencyContact> GetCurrentLatestEmergencyContact(int personId)
        {
            try {

                var pme = await _unitOfWork.Repository<PersonEmergencyContact>().Get(x => x.PersonId == personId & x.DeleteFlag == false).OrderByDescending(x => x.Id).FirstOrDefaultAsync();
                return pme;
            }
            catch (Exception e)
            {
                Log.Error(e.Message);
                throw e;
                   
            }
        }

        public async Task<PersonLocation> GetCurrentPersonLocation(int personId)
        {
            try
            {
                var pme = await _unitOfWork.Repository<PersonLocation>().Get(x => x.PersonId == personId & x.DeleteFlag == false).OrderByDescending(x => x.Id).FirstOrDefaultAsync();
                return pme;
            }
            catch(Exception e)
            {
                Log.Error(e.Message);
                throw e;
                   
            }
        }

        public async Task<int> UpdatePersonLocation(PersonLocation location)
        {
            try
            {
                
               _unitOfWork.Repository<PersonLocation>().Update(location);
                int res = await _unitOfWork.SaveChangesAsync();

                return res;
                
            }
            catch(Exception e)
            {
                Log.Error(e.Message);
                throw e;
            }
        }
        public async Task<int> UpdatePersonContact(PersonContact p)
        {
            try
            {
                SqlParameter personIdParameter = new SqlParameter("personIdParameter", SqlDbType.Int);
                personIdParameter.Value = p.PersonId;

                SqlParameter physicalAdressParameter = new SqlParameter("physicalAddressParameter", SqlDbType.VarBinary);
                physicalAdressParameter.Value = Encoding.ASCII.GetBytes(p.PhysicalAddress);

                SqlParameter mobileNumberParameter = new SqlParameter("mobileNumberParameter", SqlDbType.VarBinary);
                mobileNumberParameter.Value = Encoding.ASCII.GetBytes(p.MobileNumber);

                SqlParameter alternativeNumberParameter = new SqlParameter("alternativeNumberParameter",
                    SqlDbType.VarBinary);
                alternativeNumberParameter.Value = Encoding.ASCII.GetBytes(p.AlternativeNumber);

                SqlParameter emailAddressParameter = new SqlParameter("emailAddressParameter", SqlDbType.VarBinary);
                emailAddressParameter.Value = Encoding.ASCII.GetBytes(p.EmailAddress);

                SqlParameter id = new SqlParameter("Id", SqlDbType.Int);
                id.Value = p.Id;

                await _unitOfWork.Repository<PersonContact>().FromSql("exec PersonContact_Update @personIdParameter, @physicalAddressParameter, @mobileNumberParameter, @alternativeNumberParameter, @emailAddressParameter, @Id",
                    personIdParameter, physicalAdressParameter, mobileNumberParameter, alternativeNumberParameter,
                    emailAddressParameter, id);
                int res = await _unitOfWork.SaveChangesAsync();
                return res;

            }
            catch(Exception ex)
            {
                Log.Error(ex.Message);
                throw ex;
            }
            
        }

        public async Task<PersonContactView> GetCurrentPersonContact (int PersonId)
        {
            try
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("exec pr_OpenDecryptedSession;");
                sql.Append(
                 "SELECT top 1.*   FROM [dbo].[PersonContactView] WHERE " +
                 "(DeleteFlag is null or DeleteFlag=0) and " +
                 "PersonId ="+PersonId+"  order by CreateDate desc;" );
                sql.Append("exec [dbo].[pr_CloseDecryptedSession];");

                var personcontactview = await _unitOfWork.Repository<PersonContactView>().FromSql(sql.ToString());

                return personcontactview.FirstOrDefault();
            }
            catch (Exception e)
            {
                Log.Error(e.Message);
                throw e;

            }
        }

        public async Task<List<PersonEmergencyView>> GetCurrentPersonEmergency(int PersonId)
        {
            try
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("exec pr_OpenDecryptedSession;");
                sql.Append("select * from [dbo].[PersonEmergencyView] where Deleteflag=0 and PersonId =" + PersonId + " Order by CreateDate desc;");
                sql.Append("exec [dbo].[pr_CloseDecryptedSession];");

                var personemergencyview = await _unitOfWork.Repository<PersonEmergencyView>().FromSql(sql.ToString());

                return personemergencyview.ToList();
            }
            catch(Exception e)
            {
                Log.Error(e.Message);
                throw e;

            }

        }

        public async Task<PersonConsent> GetCurrentPersonConsent (int EmergencyContactId,int PersonId)
        {
            try
            {
                var consent = await _unitOfWork.Repository<PersonConsent>().Get(x => x.EmergencyContactId == EmergencyContactId && x.PersonId == PersonId && !x.DeleteFlag).OrderByDescending(x=>x.CreateDate).FirstOrDefaultAsync();
                return consent;
            }
            catch(Exception e)
            {
                Log.Error(e.Message);
                throw e;
            }

        }



        

        public async Task<PersonRelationship>   GetCurrentRelationShip(int PersonId,int RelatedToPersonId)
        {
            try
            {
                var pme = await _unitOfWork.Repository<PersonRelationship>().Get(x => x.PersonId == RelatedToPersonId && x.IndexPersonId == PersonId && !x.DeleteFlag).OrderByDescending(x => x.Id).FirstOrDefaultAsync();
                return pme;
            }
            catch(Exception e)
            {
                Log.Error(e.Message);
                throw e;
            }
            
        }

        public async Task<PersonRelationship> AddPersonRelationship(int PersonId,int RelatedToPersonId,int RelationshipType,int Createdby)
        {
            try
            {
                PersonRelationship pl = new PersonRelationship();
                pl.PersonId = RelatedToPersonId;
                pl.RelationshipTypeId = RelationshipType;
                pl.IndexPersonId = PersonId;
                pl.CreateDate = DateTime.Now;
                pl.DeleteFlag = false;
                pl.CreatedBy = Createdby;


                await _unitOfWork.Repository<PersonRelationship>().AddAsync(pl);
                await _unitOfWork.SaveAsync();

                return pl;
            }
            catch (Exception e)
            {
                Log.Error(e.Message);
                throw e;

            }



        }

        public async Task<PersonEducation> AddPersonEducation(PersonEducation pm)
        {
            try
            {
                await _unitOfWork.Repository<PersonEducation>().AddAsync(pm);
                await _unitOfWork.SaveAsync();
                return pm;
            }
            catch (Exception e)
            {
                throw e;
            }


        }

        public async Task<PersonOccupation> AddPersonOccupation(int userId, int occupation, int personId)
        {
            try
            {
                PersonOccupation pm = new PersonOccupation()
                {
                    PersonId = personId,
                    CreatedBy = userId,
                    Occupation = occupation,
                    CreateDate = DateTime.Now,
                    DeleteFlag = false,

                };
                await _unitOfWork.Repository<PersonOccupation>().AddAsync(pm);
                await _unitOfWork.SaveAsync();
                return pm;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public async Task<int> AddPersonLocation(int personId, int county, int subcounty, int ward, string village, string location, string sublocation, string landmark, string nearesthealthcentre, int userId)
        {
            PersonLocation personLocation = new PersonLocation()
            {
                PersonId = personId,
                County = county,
                SubCounty = subcounty,
                Ward = ward,
                Village = village,
                Location = location,
                SubLocation = sublocation,
                LandMark = landmark,
                NearestHealthCentre = nearesthealthcentre,
                Active = false,
                DeleteFlag = false,
                CreateDate = DateTime.Now,
                CreatedBy = userId
            };
            await _unitOfWork.Repository<PersonLocation>().AddAsync(personLocation);
            int res = await _unitOfWork.SaveChangesAsync();

            return res;

        }
        public async Task<List<Identifier>> GetPersonIdentifierType(string codeName)
        {
            try
            {
                var Identifiers = await _unitOfWork.Repository<Identifier>().Get(x => x.Code == codeName && !x.DeleteFlag).ToListAsync();
                return Identifiers;
            }
            catch (Exception e)
            {
                throw e;
            }
        }
        public async Task<Person> InsertPerson(string firstName, string middleName, string lastName, int sex, int createdBy)
        {
            try
            {
                var facility = await _unitOfWork.Repository<Facility>().Get(x => x.DeleteFlag == 0).FirstOrDefaultAsync();
                var sql =
                    "exec pr_OpenDecryptedSession;" +
                    "Insert Into Person(FirstName, MidName,LastName,Sex,Active,DeleteFlag,CreateDate,CreatedBy,FacilityId)" +
                    $"Values(ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{firstName}'), ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{middleName}')," +
                    $"ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{lastName}'), {sex}," +
                    $"1,0,GETDATE(), '{createdBy}','{facility.FacilityID}');" +
                    "SELECT [Id] , CAST(DECRYPTBYKEY(FirstName) AS VARCHAR(50)) [FirstName] ,CAST(DECRYPTBYKEY(MidName) AS VARCHAR(50)) MidName" +
                    ",CAST(DECRYPTBYKEY(LastName) AS VARCHAR(50)) [LastName] ,[Sex] ,[Active] ,[DeleteFlag] ,[CreateDate] " +
                    ",[CreatedBy] ,[AuditData] ,[DateOfBirth] ,[DobPrecision],FacilityId FROM [dbo].[Person] WHERE Id = SCOPE_IDENTITY();" +
                    "exec [dbo].[pr_CloseDecryptedSession];";

                var personInsert = await _unitOfWork.Repository<Person>().FromSql(sql);

                return personInsert.FirstOrDefault();
            }
            catch (Exception e)
            {
                Log.Error(e.Message);
                throw e;
            }
        }


        public async Task<Person> UpdateEmergencyPerson(Person p)
        {
            try
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("exec pr_OpenDecryptedSession;");
                sql.Append($"UPDATE Person SET FirstName = ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{p.FirstName}'), " +
                           $"MidName = ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{p.MidName}'), " +
                           $"LastName = ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{p.LastName}'), " +
                           $"Sex = {p.Sex} WHERE Id = {p.Id}; ");
                sql.Append($"SELECT [Id] , CAST(DECRYPTBYKEY(FirstName) AS VARCHAR(50)) [FirstName] ,CAST(DECRYPTBYKEY(MidName) AS VARCHAR(50)) MidName" +
                           $",CAST(DECRYPTBYKEY(LastName) AS VARCHAR(50)) [LastName] ,[Sex] ,[Active] ,[DeleteFlag] ,Facilityid,[CreateDate] " +
                           $",[CreatedBy] ,[AuditData] ,[DateOfBirth] ,[DobPrecision] FROM Person WHERE Id = '{p.Id}';");
                sql.Append("exec [dbo].[pr_CloseDecryptedSession];");

                var personInsert = await _unitOfWork.Repository<Person>().FromSql(sql.ToString());
                return personInsert.FirstOrDefault();
            }
            catch (Exception e)
            {
                throw e;
            }
        }



        public async Task<PersonOccupation> UpdateOccupation(PersonOccupation pm)
        {
            try
            {

                _unitOfWork.Repository<PersonOccupation>().Update(pm);
                await _unitOfWork.SaveAsync();
                return pm;
            }
            catch (Exception e)
            {
                throw e;
            }
        }
        public async Task<PersonOccupation> GetCurrentOccupation(int personId)
        {
            try
            {
                var occupation = await _unitOfWork.Repository<PersonOccupation>().Get(x => x.PersonId == personId && x.DeleteFlag == false).OrderByDescending(o => o.CreateDate).FirstOrDefaultAsync();
                return occupation;
            }
            catch (Exception e)
            {
                throw e;
            }
        }



        public async Task<PersonEducation> UpdatePersonEducation(PersonEducation pm)
        {

            try
            {

                _unitOfWork.Repository<PersonEducation>().Update(pm);
                await _unitOfWork.SaveAsync();
                return pm;
            }
            catch (Exception e)
            {
                throw e;
            }

        }

        public async Task<PersonEducation> GetCurrentPersonEducation(int personId)
        {
            try
            {
                PersonEducation pe = await _unitOfWork.Repository<PersonEducation>().Get(x => x.PersonId == personId && x.DeleteFlag == false).OrderByDescending(x => x.Id).Take(1).FirstOrDefaultAsync();
                return pe;
            }
            catch (Exception e)
            {
                throw e;

            }
        }



        public async Task<Patient> UpdateRegistrationPatient(int personID, DateTime RegistrationDate, string NationalID, DateTime dateOfBirth, int userId, string facilityId = "")
        {
            try
            {
                var facility = await _unitOfWork.Repository<Facility>().Get(x => x.DeleteFlag == 0).FirstOrDefaultAsync();
                var patientType = await _unitOfWork.Repository<LookupItemView>()
                    .Get(x => x.MasterName == "PatientType" && x.ItemName == "NotDocumented").FirstOrDefaultAsync();
                var person = await GetPerson(personID);
                var personLocation = await GetCurrentPersonLocation(personID);
                var Gender = await _unitOfWork.Repository<LookupItemView>()
                    .Get(x => x.ItemId == person.Sex).FirstOrDefaultAsync();
                var personcontact = await GetCurrentPersonContact(personID);
                var patient = await GetPatientByPersonId(personID);
                var Dobprecision = 0;

                var gender = 0;
                if (Gender.ItemName.ToLower() == "male")
                {
                    gender = 16;
                }
                else if (Gender.ItemName.ToLower() == "female")
                {
                    gender = 17;
                }

                if (string.IsNullOrWhiteSpace(facilityId))
                {
                    facilityId = facility.PosID;
                }

                if (person.DobPrecision == true)
                {
                    Dobprecision = 1;
                }
                else if (person.DobPrecision == false)
                {
                    Dobprecision = 0;
                }



                StringBuilder sql = new StringBuilder();
                sql.Append("exec pr_OpenDecryptedSession;");
                sql.Append($"UPDATE mst_Patient SET FirstName = ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{person.FirstName}'), " +
                           $"MiddleName = ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{person.MidName}'), " +
                           $"LastName = ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{person.LastName}'), " +
                           $"LocationID='{facilityId}'," +
                           $"Sex = '{gender}'," +
                           $"UserID='{person.CreatedBy}'," +
                           $"DobPrecision='{Dobprecision}', DOB = '{person.DateOfBirth}'," +
                           $"Address= ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{personcontact.PhysicalAddress}')," +
                           $"Phone=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),'{personcontact.MobileNumber}')" +
                           $" WHERE ptn_pk = {patient.Ptn_pk}; ");
                sql.Append($"SELECT Ptn_Pk, CAST(DECRYPTBYKEY([FirstName]) AS VARCHAR(50)) AS FirstName, CAST(DECRYPTBYKEY([LastName]) AS VARCHAR(50)) AS LastName, LocationID FROM [dbo].[mst_Patient] WHERE [Ptn_Pk] = '{patient.Ptn_pk}';");
                sql.Append("exec [dbo].[pr_CloseDecryptedSession];");
                var result = await _unitOfWork.Repository<MstPatient>().FromSql(sql.ToString());

                string PatientIndex = DateTime.Now.Year.ToString() + '-' + personID.ToString();
                StringBuilder sqlpatient = new StringBuilder();
                sqlpatient.Append("exec pr_OpenDecryptedSession;" +
                                  $"UPDATE Patient set FacilityId='{facilityId}'," +
                                  $"DateOfBirth='{person.DateOfBirth}'," +
                                  $"NationalId=ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{NationalID}')," +
                                  $"CreatedBy='{person.CreatedBy}'," +
                                  $"DobPrecision='{Dobprecision}'," +
                                  $"RegistrationDate='{RegistrationDate}'" +
                                  $" where ptn_pk='{patient.Ptn_pk}';");


                sqlpatient.Append($"SELECT [Id],[ptn_pk],[PersonId],[PatientIndex],[PatientType],[FacilityId],[Active],[DateOfBirth]," +
                             $"[DobPrecision],CAST(DECRYPTBYKEY(NationalId) AS VARCHAR(50)) [NationalId],[DeleteFlag],[CreatedBy]," +
                             $"[CreateDate],[AuditData],[RegistrationDate] FROM [dbo].[Patient] WHERE ptn_pk = '{patient.Ptn_pk}';" +
                             $"exec [dbo].[pr_CloseDecryptedSession];");

                var patientInsert = await _unitOfWork.Repository<Patient>().FromSql(sqlpatient.ToString());

                return patientInsert.FirstOrDefault();
            }
            catch (Exception e)
            {
                Log.Error(e.Message);
                throw e;
            }

        }
        public async Task<Patient> AddRegistrationPatient(int personID, DateTime RegistrationDate, string NationalID, DateTime dateOfBirth, int userId, string facilityId = "")
        {
            try
            {
                var facility = await _unitOfWork.Repository<Facility>().Get(x => x.DeleteFlag == 0).FirstOrDefaultAsync();
                var patientType = await _unitOfWork.Repository<LookupItemView>()
                    .Get(x => x.MasterName == "PatientType" && x.ItemName == "NotDocumented").FirstOrDefaultAsync();
                var person = await GetPerson(personID);
                var personLocation = await GetCurrentPersonLocation(personID);
                var Gender = await _unitOfWork.Repository<LookupItemView>()
                    .Get(x => x.ItemId == person.Sex).FirstOrDefaultAsync();
                var personcontact = await GetCurrentPersonContact(personID);

                var Dobprecision = 0;

                var gender = 0;
                if (Gender.ItemName.ToLower() == "male")
                {
                    gender = 16;
                }
                else if (Gender.ItemName.ToLower() == "female")
                {
                    gender = 17;
                }

                if (string.IsNullOrWhiteSpace(facilityId))
                {
                    facilityId = facility.PosID;
                }

                if (person.DobPrecision == true)
                {
                    Dobprecision = 1;
                }
                else if (person.DobPrecision == false)
                {
                    Dobprecision = 0;
                }
                StringBuilder sql = new StringBuilder();
                sql.Append("exec pr_OpenDecryptedSession;");
                sql.Append("Insert Into mst_Patient(FirstName, LastName, MiddleName, LocationID, PatientEnrollmentID, ReferredFrom, RegistrationDate, Sex, DOB, DobPrecision, MaritalStatus, Address, Phone, UserID, PosId, Status, DeleteFlag, CreateDate,MovedToPatientTable)");
                sql.Append("Values(");
                sql.Append($"ENCRYPTBYKEY(KEY_GUID('Key_CTC'),'{person.FirstName}'),");
                sql.Append($"ENCRYPTBYKEY(KEY_GUID('Key_CTC'),'{person.LastName}'),");
                sql.Append($"ENCRYPTBYKEY(KEY_GUID('Key_CTC'),'{person.MidName}'),");
                sql.Append($"'{facility.FacilityID}',");
                sql.Append("' ',");
                sql.Append("' ',");
                sql.Append($"'{RegistrationDate.ToString("yyyy-MM-dd")}',");
                sql.Append($"'{gender}',");
                sql.Append($"'{person.DateOfBirth}',");
                sql.Append($"'{Dobprecision}',");
                sql.Append($"'',");
                sql.Append($"ENCRYPTBYKEY(KEY_GUID('Key_CTC'),'{personcontact.PhysicalAddress}'),");
                sql.Append($"ENCRYPTBYKEY(KEY_GUID('Key_CTC'),'{personcontact.MobileNumber}'),");
                sql.Append($"'{person.CreatedBy}',");
                sql.Append($"'{facility.PosID}',");
                sql.Append("0,");
                sql.Append("0,");
                sql.Append($"'{DateTime.Now}',");
                sql.Append("1");
                sql.Append(");");

                sql.Append("SELECT Ptn_Pk, CAST(DECRYPTBYKEY([FirstName]) AS VARCHAR(50)) AS FirstName, CAST(DECRYPTBYKEY([LastName]) AS VARCHAR(50)) AS LastName, LocationID FROM [dbo].[mst_Patient] WHERE [Ptn_Pk] = SCOPE_IDENTITY();");
                sql.Append("exec [dbo].[pr_CloseDecryptedSession];");

                var result = await _unitOfWork.Repository<MstPatient>().FromSql(sql.ToString());

                string PatientIndex = DateTime.Now.Year.ToString() + '-' + personID.ToString();
                var sqlPatient = "exec pr_OpenDecryptedSession;" +
                                 "Insert Into  Patient(ptn_pk,PersonId,PatientIndex,PatientType,FacilityId,Active,DateOfBirth,NationalId,DeleteFlag,CreatedBy,CreateDate,AuditData,DobPrecision,RegistrationDate)" +
                                 $"Values({result[0].Ptn_Pk}, {personID}, '{PatientIndex}', '{patientType.ItemId}', '{facilityId}', 1," +
                                 $"'{dateOfBirth.ToString("yyyy-MM-dd")}', ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{NationalID}'), 0, '{userId}', GETDATE()," +
                                 $"NULL, 1,'{RegistrationDate}');" +
                                 $"SELECT [Id],[ptn_pk],[PersonId],[PatientIndex],[PatientType],[FacilityId],[Active],[DateOfBirth]," +
                                 $"[DobPrecision],CAST(DECRYPTBYKEY(NationalId) AS VARCHAR(50)) [NationalId],[DeleteFlag],[CreatedBy]," +
                                 $"[CreateDate],[AuditData],[RegistrationDate] FROM [dbo].[Patient] WHERE Id = SCOPE_IDENTITY();" +
                                 $"exec [dbo].[pr_CloseDecryptedSession];";

                var patientInsert = await _unitOfWork.Repository<Patient>().FromSql(sqlPatient);


                return patientInsert.FirstOrDefault();
            }
            catch (Exception e)
            {
                throw e;
            }
        }


        public async Task<Person> RegisterPerson(string firstName, string middleName, string lastName, int sex, DateTime dateOfBirth, int createdBy, int DobPrecision)
        {
            try
            {
                var facility = await _unitOfWork.Repository<Facility>().Get(x => x.DeleteFlag == 0).FirstOrDefaultAsync();
                var sql =
                    "exec pr_OpenDecryptedSession;" +
                    "Insert Into Person(FirstName, MidName,LastName,Sex,DateOfBirth,DobPrecision,Active,DeleteFlag,CreateDate,CreatedBy,FacilityId)" +
                    $"Values(ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{firstName}'), ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{middleName}')," +
                    $"ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{lastName}'), {sex}, '{dateOfBirth.ToString("yyyy-MM-dd")}',{DobPrecision}," +
                    $"1,0,GETDATE(), '{createdBy}','{facility.FacilityID}');" +
                    "SELECT [Id] , CAST(DECRYPTBYKEY(FirstName) AS VARCHAR(50)) [FirstName] ,CAST(DECRYPTBYKEY(MidName) AS VARCHAR(50)) MidName" +
                    ",CAST(DECRYPTBYKEY(LastName) AS VARCHAR(50)) [LastName] ,[Sex] ,[Active] ,[DeleteFlag] ,[CreateDate] " +
                    ",[CreatedBy] ,[AuditData] ,[DateOfBirth] ,[DobPrecision],FacilityId FROM [dbo].[Person] WHERE Id = SCOPE_IDENTITY();" +
                    "exec [dbo].[pr_CloseDecryptedSession];";

                var personInsert = await _unitOfWork.Repository<Person>().FromSql(sql.ToString());

                return personInsert.FirstOrDefault();
            }
            catch (Exception e)
            {
                Log.Error(e.Message);
                throw e;
            }
        }

        public async Task<PersonMaritalStatus> UpdateMaritalStatus(PersonMaritalStatus pms)
        {
            try
            {
                _unitOfWork.Repository<PersonMaritalStatus>().Update(pms);
                await _unitOfWork.SaveAsync();
                var maritalStatus = await _unitOfWork.Repository<PersonMaritalStatus>().Get(x => x.Id == pms.Id).FirstOrDefaultAsync();
                return maritalStatus;
            }
            catch (Exception e)
            {
                throw e;
            }
        }
        public async Task<PersonMaritalStatus> GetFirstPatientMaritalStatus(int personId)
        {
            try
            {
                var maritalstatus = await _unitOfWork.Repository<PersonMaritalStatus>().Get(x => x.PersonId == personId & !x.DeleteFlag).OrderByDescending(o => o.CreateDate).FirstOrDefaultAsync();
                return maritalstatus;
            }
            catch (Exception e)
            {
                throw e;
            }


        }
        public async Task<Person> UpdatePerson(int personId, string firstName, string middleName, string lastName, int sex, int CreatedBy, DateTime dateOfBirth, int DobPrecision)
        {
            try
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("exec pr_OpenDecryptedSession;");
                sql.Append($"UPDATE Person SET FirstName = ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{firstName}'), " +
                           $"MidName = ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{middleName}'), " +
                           $"LastName = ENCRYPTBYKEY(KEY_GUID('Key_CTC'), '{lastName}'), " +
                           $"Sex = {sex}" +
                           $"CreatedBy={CreatedBy}" +
                           $"DobPrecision={DobPrecision}, DateOfBirth = '{dateOfBirth.ToString("yyyy-MM-dd")}' WHERE Id = {personId}; ");
                sql.Append($"SELECT [Id] , CAST(DECRYPTBYKEY(FirstName) AS VARCHAR(50)) [FirstName] ,CAST(DECRYPTBYKEY(MidName) AS VARCHAR(50)) MidName" +
                           $",CAST(DECRYPTBYKEY(LastName) AS VARCHAR(50)) [LastName] ,[Sex] ,[Active] ,[DeleteFlag] ,[CreateDate] " +
                           $",[CreatedBy] ,[AuditData] ,[DateOfBirth] ,[DobPrecision] FROM Person WHERE Id = '{personId}';");
                sql.Append("exec [dbo].[pr_CloseDecryptedSession];");

                var personInsert = await _unitOfWork.Repository<Person>().FromSql(sql.ToString());
                return personInsert.FirstOrDefault();
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public async Task<PersonConsent> AddPersonConsent(PersonConsent pmc)
        {
            try
            {
                var sql = "Insert Into PersonConsent(PersonId, EmergencyContactId,ConsentType,ConsentDate,ConsentValue,ConsentReason,Active,DeleteFlag,CreateDate,CreatedBy)" +
                    $"Values( '{pmc.PersonId}', '{pmc.EmergencyContactId}'," +
                    $"'{pmc.ConsentType}', '{pmc.ConsentDate}', '{pmc.ConsentValue}', '{pmc.ConsentReason}'," +
                    $"1,0,GETDATE(), '{pmc.CreatedBy}');" +
                    "SELECT Id,PersonId, EmergencyContactId,ConsentType,ConsentDate" +
                    ",ConsentValue,ConsentReason,Active,DeleteFlag,CreateDate,CreatedBy,AuditData " +
                    "FROM [dbo].[PersonConsent] WHERE Id = SCOPE_IDENTITY();";
                    

                var personConsent = await _unitOfWork.Repository<PersonConsent>().FromSql(sql);

                return personConsent.FirstOrDefault();
            }
            catch (Exception e)
            {
                Log.Error(e.Message);
                throw e;
            }

        }

        public async Task<int> UpdatePersonConsent(PersonConsent pmc)
        {
            try
            {
                _unitOfWork.Repository<PersonConsent>().Update(pmc);
                int res=await _unitOfWork.SaveChangesAsync();
                return res;
            }
            catch(Exception e)
            {
                Log.Error(e.Message);
                throw e;
            }
        }

       public async Task<PersonEmergencyContact> AddPersonEmergencyContact(PersonEmergencyContact pmc)
        {
            try
            {
                SqlParameter personIdParameter = new SqlParameter("personIdParameter", SqlDbType.Int);
                personIdParameter.Value = pmc.PersonId;
                SqlParameter EmergencyContactPersonIdParameter = new SqlParameter("EmergencyContactPersonIdParameter", SqlDbType.Int);
                EmergencyContactPersonIdParameter.Value = pmc.EmergencyContactPersonId;
                SqlParameter MobileContactParameter = new SqlParameter("MobileContactParameter", SqlDbType.VarBinary);
                MobileContactParameter.Value = Encoding.ASCII.GetBytes(pmc.MobileContact);
                SqlParameter userId = new SqlParameter("UserId", SqlDbType.Int);
                userId.Value = pmc.CreatedBy;
                SqlParameter ContactType = new SqlParameter("ContactType", SqlDbType.Int);
                ContactType.Value = pmc.ContactType;
                SqlParameter RegisteredToClinic = new SqlParameter("RegisteredToClinic", SqlDbType.Bit);

                if (pmc.RegisteredToClinic == true)
                {
                    RegisteredToClinic.Value = 1;
                }
                else if (pmc.RegisteredToClinic == false)
                {
                    RegisteredToClinic.Value = 0;
                }
                
                  await _unitOfWork.Repository<PersonEmergencyContact>().ExecWithStoreProcedureAsync("PersonEmergencyContact_Insert @personIdParameter,@EmergencyContactPersonIdParameter,@MobileContactParameter,@UserId,@ContactType,@RegisteredToClinic",
                     personIdParameter,EmergencyContactPersonIdParameter,MobileContactParameter,userId,ContactType,RegisteredToClinic);
                 await _unitOfWork.SaveChangesAsync();
                return pmc;
            }
            catch (Exception e)
            {
                Log.Error(e.Message);
                throw e;

            }
        }
       

       

  
    }
}