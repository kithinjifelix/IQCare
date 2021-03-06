﻿using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entities.CCC.Lookup
{
    [Serializable]
    [Table("gcPatientViewSearch")]
    public class PatientLookupSearch
    {
        [Key]
        public int Id { get; set; }
        public int PersonId { get; set; }
        public int? ptn_pk { get; set; }
        public string PatientClinicId { get; set; }
        public string CCCNumber { get; set; }
        public string PatientIndex { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public int Sex { get; set; }
        public bool Active { get; set; }
        public DateTime? RegistrationDate { get; set; }
        public DateTime EnrollmentDate { get; set; }
        public bool? TransferIn { get; set; }
        public DateTime DateOfBirth { get; set; }
        public bool DobPrecision { get; set; }
        public string NationalId { get; set; }
        public int FacilityId { get; set; }
        public int PatientType { get; set; }
        public string PatientStatus { get; set; }
        public string MobileNumber { get; set; }
        public int TBStatus { get; set; }
        public int NutritionStatus { get; set; }
        public int categorization { get; set; }
        [NotMapped]
        public int EnrollmentNumberNormalized { get { return NormalizeNumber(); } }

        public int NormalizeNumber()
        {
            int intNormalNumber;
            if (int.TryParse(this.CCCNumber, out intNormalNumber))
            {
                return intNormalNumber;
            }

            var result = String.Empty;
            if (this.CCCNumber.Length == 11 && this.CCCNumber.Contains("-"))
            {
                result = this.CCCNumber.Replace("-", "");
            }
            else
            {
                if (this.CCCNumber.Contains("/"))
                {
                    result = this.CCCNumber.Split('/')[0];
                }
                else if (this.CCCNumber.Contains("-"))
                {
                    result = this.CCCNumber.Split('-')[0];
                }
                else
                {
                    int intout;
                    if (int.TryParse(this.CCCNumber, out intout))
                    {
                        return intout;
                    }
                }
            }
            return Convert.ToInt32(result);
        }
    }
    [Serializable]
    [Table("PersonExtView")]
    public class PersonExtLookupSearch
    {


        [Key]
        public int PersonId { get; set; }
        public int? ptn_pk { get; set; }
        public string EnrollmentNumber { get; set; }
        public string PatientIndex { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public int Sex { get; set; }
        public bool Active { get; set; }
        public DateTime? RegistrationDate { get; set; }
        public DateTime EnrollmentDate { get; set; }
        public bool? TransferIn { get; set; }
        public DateTime DateOfBirth { get; set; }
        public bool DobPrecision { get; set; }
        public string NationalId { get; set; }
        public int FacilityId { get; set; }
        public int PatientType { get; set; }
        public string PatientStatus { get; set; }
        public string MobileNumber { get; set; }
        public int TBStatus { get; set; }
        public int NutritionStatus { get; set; }
        public int categorization { get; set; }
        public int Id { get; set; }
    }
}
