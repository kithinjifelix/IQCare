﻿using Entities.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Interface.CCC
{
    public interface IPersonManager
    {
        int AddPerson(Person p);
        Person GetPerson(int id);
        void DeletePerson(int id);
        int UpdatePerson(Person p,int id);
        //string VoidPerson(int id);
        //string DeletePerson(int id);
    }
}
