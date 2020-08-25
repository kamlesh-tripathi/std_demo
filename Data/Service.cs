using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class StudentServiceDto
    {
        public Int32 StudentId { get; set; }

        public string SchoolYear { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime EndDate { get; set; }

        //Display Studnet more details
        public string FirstName { get; set; }

        public string LastName { get; set; }
    }
}
