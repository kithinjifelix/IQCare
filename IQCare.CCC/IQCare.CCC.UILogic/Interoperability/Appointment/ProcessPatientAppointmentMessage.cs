﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IQCare.DTO;
using IQCare.DTO.PatientAppointment;

namespace IQCare.CCC.UILogic.Interoperability.Appointment
{
    public class ProcessPatientAppointmentMessage : IInteropDTO<PatientAppointSchedulingDTO>
    {
        public PatientAppointSchedulingDTO Get(int entityId)
        {
            return AppointmentMessage.Get(entityId);
        }

        public string Save(PatientAppointSchedulingDTO appointment)
        {
            return AppointmentMessage.Save(appointment);
        }

        public string Update(PatientAppointSchedulingDTO appointment)
        {
            return AppointmentMessage.Update(appointment);
        }
    }
}
