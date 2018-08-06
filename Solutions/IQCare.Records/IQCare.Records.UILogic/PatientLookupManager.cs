﻿using Application.Presentation;
using Entities.Records;
using Interface.Records;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IQCare.Records.UILogic
{
   public class PatientLookupManager
    {
        readonly IPatientLookupmanager _patientLookupmanager = (IPatientLookupmanager)ObjectFactory.CreateInstance("BusinessProcess.Records.BPatientLookupManager, BusinessProcess.Records");

        public PatientLookup GetPatientDetailSummary(int id)
        {
            var patientDetails = _patientLookupmanager.GetPatientDetailsLookup(id);
            // call invoke application decryption
            return patientDetails;
        }

        public int GetPatientSexId(int patientId)
        {
            try
            {
                return _patientLookupmanager.GetPatientSexId(patientId);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public List<PatientLookup> GetPatientSearchListPayload(string patientId, string firstName = null, string middleName = null, string lastName = null)
        {
            var patientDetails = _patientLookupmanager.GetPatientSearchPayload(patientId, firstName, middleName, lastName);

            return patientDetails;
        }

        public List<PatientLookup> GetPatientSearchListPayload()
        {
            var patientDetails = _patientLookupmanager.GetPatientSearchPayload();

            return patientDetails;
        }

        public List<PatientLookup> GetPatientSearchPayloadWithParameter(string patientId, string fname, string mname,
            string lname, DateTime doB, int sex, int facility, int start, int length)
        {
            IPatientLookupmanager patientLookupmanager = (IPatientLookupmanager)ObjectFactory.CreateInstance("BusinessProcess.CCC.BPatientLookupManager, BusinessProcess.CCC");

            var patientList = patientLookupmanager.GetPatientSearchPayloadWithParameter(patientId, fname, mname, lname,
                doB, sex, facility, start, length);
            return patientList;
        }


        public int GetTotalpatientCount()
        {
            return _patientLookupmanager.GetTotalpatientCount();
        }

        public List<PatientLookup> GetPatientByPersonId(int personId)
        {
            return _patientLookupmanager.GetPatientByPersonId(personId);
        }

       //// public string GetPatientTypeId(int patientId)
       // {
       //     return LookupLogic.GetLookupNameById(_patientLookupmanager.GetPatientTypeId(patientId));
       // }

        public string GetDobByPersonId(int personId)
        {
            var person = _patientLookupmanager.GetPatientByPersonId(personId);
            if (person.Count > 0)
            {
                DateTime dob = person[0].DateOfBirth;
                string stringDob = dob.ToString("dd-MMM-yyyy");
                return stringDob;
            }
            else
            {
                return "";
            }
        }

        public int IsPatientExists(int personId)
        {
            var person = _patientLookupmanager.GetPatientByPersonId(personId);
            var retVal = person.Count > 0 ? 1 : 0;
            return retVal;
        }

        public int PatientId(int personId)
        {
            var person = _patientLookupmanager.GetPatientByPersonId(personId);
            var retVal = person.Count > 0 ? person[0].Id : 0;
            return retVal;
        }

        public List<PatientLookup> GetPatientListByParams(int patientId, string firstName, string middleName, string lastName, int sex)
        {
            try
            {
                return _patientLookupmanager.GetPatientListByParams(patientId, firstName, middleName, lastName, sex);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public PatientLookup GetPatientByCccNumber(string cccNumber)
        {
            cccNumber = cccNumber.Trim();
            PatientLookup patient = null;
            try
            {
                patient = _patientLookupmanager.GetPatientByCccNumber(cccNumber);
                if (patient == null)
                {
                    if (cccNumber.Contains("-"))
                    {
                        string[] numbers = cccNumber.Split('-');
                        patient = _patientLookupmanager.GetPatientByCccNumber(numbers[1]);
                        if (patient == null)
                        {
                            string cccAfterRemoveLeading = numbers[1].TrimStart('0');
                            patient = _patientLookupmanager.GetPatientByCccNumber(cccAfterRemoveLeading);
                        }
                    }
                    else
                    {
                        int cccNumberLength = cccNumber.Length;
                        if (cccNumberLength == 10)
                        {
                            string ccc = cccNumber.Substring(5, 5);
                            patient = _patientLookupmanager.GetPatientByCccNumber(ccc);
                            if (patient == null)
                            {
                                patient = _patientLookupmanager.GetPatientByCccNumber(ccc.TrimStart('0'));
                            }
                        }
                        else
                        {
                            patient = _patientLookupmanager.GetPatientByCccNumber(cccNumber.TrimStart('0'));
                        }
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            return patient;
        }
    }
}
