using System.Collections.Generic;
using System.Linq;
using Data;
using Microsoft.AspNetCore.Mvc;
using RepoDB;

namespace Services.Controllers
{
    [ApiController]
    public class StudentController : ControllerBase
    {
        [Route("api/GetAllStudents")]
        public List<StudentsDto> GetAllStudents(int districtId)
        {
            using (var context = new StudentDBEntities())
            {
                return (from u in context.Students.Where(x => x.DistrictId == districtId)
                        orderby u.FirstName
                        select new StudentsDto()
                        {
                            StudentId = u.StudentId,
                            FirstName = u.FirstName,
                            LastName = u.LastName,
                            SSN = u.SSN,
                            DistrictId = u.DistrictId
                        }).ToList();

            }
        }

        [Route("api/GetAllStudentEnrollments")]
        public List<StudentEnrollmentDto> GetAllStudentEnrollments(string schoolYear)
        {
            using (var context = new StudentDBEntities())
            {
                return (from u in context.Enrollments
                        join od in context.Students on u.StudentId equals od.StudentId
                        where u.SchoolYear == schoolYear
                        orderby u.StudentId
                        select new StudentEnrollmentDto()
                        {
                            StudentId = u.StudentId,
                            SchoolYear = u.SchoolYear,
                            StartDate = u.StartDate,
                            EndDate = u.EndDate,
                            FirstName = od.FirstName,
                            LastName = od.LastName
                        }).ToList();

            }
        }

        [Route("api/GetAllStudentServices")]
        public List<StudentServiceDto> GetAllStudentServices(string schoolYear)
        {
            using (var context = new StudentDBEntities())
            {
                return (from u in context.Services
                        join od in context.Students on u.StudentId equals od.StudentId
                        where u.SchoolYear == schoolYear
                        orderby u.StudentId
                        select new StudentServiceDto()
                        {
                            StudentId = u.StudentId,
                            SchoolYear = u.SchoolYear,
                            StartDate = u.StartDate,
                            EndDate = u.EndDate,
                            FirstName = od.FirstName,
                            LastName = od.LastName
                        }).ToList();

            }
        }
    }
}