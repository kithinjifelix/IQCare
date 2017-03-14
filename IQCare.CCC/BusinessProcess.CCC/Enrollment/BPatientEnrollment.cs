﻿using DataAccess.Base;
using DataAccess.CCC.Context;
using DataAccess.CCC.Repository;
using Entities.CCC.Enrollment;
using Interface.CCC.Enrollment;
using System;
using System.Collections.Generic;
using System.Linq;

namespace BusinessProcess.CCC.Enrollment
{
    public class BPatientEnrollment : ProcessBase, IPatientEnrollmentManager
    {
        private readonly UnitOfWork _unitOfWork = new UnitOfWork(new GreencardContext());
        internal int Result;

        public int AddPatientEnrollment(PatientEntityEnrollment patientEnrollment)
        {
            _unitOfWork.PatientEnrollmentRepository.Add(patientEnrollment);
            Result = _unitOfWork.Complete();
            return patientEnrollment.Id;
        }

        public int DeletePatientEnrollment(int id)
        {
            var enrollment = _unitOfWork.PatientEnrollmentRepository.GetById(id);
            _unitOfWork.PatientEnrollmentRepository.Remove(enrollment);
            return _unitOfWork.Complete();
        }

        public int UpdatePatientEnrollment(PatientEntityEnrollment patientEnrollment)
        {
            _unitOfWork.PatientEnrollmentRepository.Update(patientEnrollment);
            _unitOfWork.Complete();
            return patientEnrollment.Id;
        }

        public List<PatientEntityEnrollment> GetPatientEnrollmentByPatientId(int patientId)
        {
            return _unitOfWork.PatientEnrollmentRepository.FindBy(x => x.PatientId == patientId && !x.CareEnded).ToList();
        }

        public PatientEntityEnrollment GetPatientEntityEnrollment(int id)
        {
            return _unitOfWork.PatientEnrollmentRepository.FindBy(x => x.Id == id).First();
        }

        public DateTime GetPatientEnrollmentDate(int patientId)
        {
            DateTime enrollmentDate =
                _unitOfWork.PatientEnrollmentRepository.FindBy(x => x.PatientId == patientId & !x.DeleteFlag)
                    .Select(x => x.EnrollmentDate)
                    .FirstOrDefault();
           return enrollmentDate; 
        }
    }
}
