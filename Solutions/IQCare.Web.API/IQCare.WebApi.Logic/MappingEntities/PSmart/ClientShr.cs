﻿using System;
using System.CodeDom;
using System.Collections.Generic;

namespace IQCare.WebApi.Logic.MappingEntities.PSmart
{
    public class ClientShr
    {
        public ClientShr()
        {
            PATIENT_IDENTIFICATION = new PATIENTIDENTIFICATION();
            NEXT_OF_KIN = new List<NEXTOFKIN>();
            HIV_TEST = new List<HIVTEST>();
            IMMUNIZATION = new List<IMMUNIZATION>();
            CARD_DETAILS = new CARDDETAILS();
        }

        public PATIENTIDENTIFICATION PATIENT_IDENTIFICATION { get; set; }
        public List<NEXTOFKIN> NEXT_OF_KIN { get; set; }
        public List<HIVTEST> HIV_TEST { get; set; }
        public List<IMMUNIZATION> IMMUNIZATION { get; set; }
        public CARDDETAILS CARD_DETAILS { get; set; }
    }

    public class EXTERNALPATIENTID
        {
            public string ID { get; set; }
            public string IDENTIFIER_TYPE { get; set; }
            public string ASSIGNING_AUTHORITY { get; set; }
            public string ASSIGNING_FACILITY { get; set; }
        }

        public class INTERNALPATIENTID
        {
            public string ID { get; set; }
            public string IDENTIFIER_TYPE { get; set; }
            public string ASSIGNING_AUTHORITY { get; set; }
            public string ASSIGNING_FACILITY { get; set; }
        }

        public class PATIENTNAME
        {
            public string FIRST_NAME { get; set; }
            public string MIDDLE_NAME { get; set; }
            public string LAST_NAME { get; set; }
        }

        public class PHYSICALADDRESS
        {
            public string VILLAGE { get; set; }
            public string WARD { get; set; }
            public string SUB_COUNTY { get; set; }
            public string COUNTY { get; set; }
            public string NEAREST_LANDMARK { get; set; }
        }

        public class PATIENTADDRESS
        {
            public PHYSICALADDRESS PHYSICAL_ADDRESS { get; set; }
            public string POSTAL_ADDRESS { get; set; }
        }

        public class MOTHERNAME
        {
            public string FIRST_NAME { get; set; }
            public string MIDDLE_NAME { get; set; }
            public string LAST_NAME { get; set; }
        }

        public class MOTHERIDENTIFIER
        {
            public string ID { get; set; }
            public string IDENTIFIER_TYPE { get; set; }
            public string ASSIGNING_AUTHORITY { get; set; }
            public string ASSIGNING_FACILITY { get; set; }
        }

        public class MOTHERDETAILS
        {
            public MOTHERNAME MOTHER_NAME { get; set; }
            public List<MOTHERIDENTIFIER> MOTHER_IDENTIFIER { get; set; }
        }

        public class PATIENTIDENTIFICATION
        {
            public EXTERNALPATIENTID EXTERNAL_PATIENT_ID { get; set; }
            public List<INTERNALPATIENTID> INTERNAL_PATIENT_ID { get; set; }
            public PATIENTNAME PATIENT_NAME { get; set; }
            public DateTime? DATE_OF_BIRTH { get; set; }
            public string DATE_OF_BIRTH_PRECISION { get; set; }
            public string SEX { get; set; }
           // public DateTime DEATH_DATE { get; set; }
            public string DEATH_INDICATOR { get; set; }
            public PATIENTADDRESS PATIENT_ADDRESS { get; set; }
            public string PHONE_NUMBER { get; set; }
            public string MARITAL_STATUS { get; set; }
            public MOTHERDETAILS MOTHER_DETAILS { get; set; }
        }

        public class NOKNAME
        {
            public string FIRST_NAME { get; set; }
            public string MIDDLE_NAME { get; set; }
            public string LAST_NAME { get; set; }
        }

        public class NEXTOFKIN
        {
            public NOKNAME NOK_NAME { get; set; }
            public string RELATIONSHIP { get; set; }
            public string ADDRESS { get; set; }
            public string PHONE_NUMBER { get; set; }
            public string SEX { get; set; }
            public string DATE_OF_BIRTH { get; set; }
            public string CONTACT_ROLE { get; set; }
        }

        public class PROVIDERDETAILS
        {
            public string NAME { get; set; }
            public int? ID { get; set; }
        }

        public class HIVTEST
        {
            public DateTime DATE { get; set; }
            public string RESULT { get; set; }
            public string TYPE { get; set; }
            public string FACILITY { get; set; }
            public string STRATEGY { get; set; }
            public PROVIDERDETAILS PROVIDER_DETAILS { get; set; }
        }

        public class IMMUNIZATION
        {
            public string NAME { get; set; }
            public string DATE_ADMINISTERED { get; set; }
        }

        public class CARDDETAILS
        {
            public string STATUS { get; set; }
            public string REASON { get; set; }
            public string LAST_UPDATED { get; set; }
            public string LAST_UPDATED_FACILITY { get; set; }
        }
}