using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class StudentsDto
    {
        public Int32 StudentId { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public Int32 DistrictId { get; set; }

        public DateTime DateOfBirth { get; set; }

        public string SSN { get; set; }
    }
}
