using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace WebUI.Controllers
{
    public class StudentController : Controller
    {
        static string baseUrl = "https://localhost:44376/api/";

        // GET: Student
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult GetDetails(int? districtId = null)
        {
            List<StudentsDto> customers = GetAllStudents(districtId);
            return View(customers);
        }

        [HttpPost]
        public ActionResult GetEnrollmentDetails(string schoolYear)
        {
            List<StudentEnrollmentDto> customers = GetAllStudentEnrollments(schoolYear);
            return View(customers);
        }
            
        [HttpPost]
        public ActionResult GetServiceDetails(string schoolYear)
        {
            List<StudentServiceDto> customers = GetAllStudentServices(schoolYear);
            return View(customers);
        }

        private static List<StudentsDto> GetAllStudents(int? districtId)
        {
            //var input = new
            //{
            //    DistrictId = districtId,
            //};
            //string inputJson = (new JavaScriptSerializer()).Serialize(input);
            WebClient client = new WebClient();
            client.Headers["Content-type"] = "application/json";
            client.Encoding = Encoding.UTF8;
            client.QueryString.Add("districtId", Convert.ToString(districtId));
            string json = client.DownloadString(baseUrl + "/GetAllStudents");
            List<StudentsDto> students = (new JavaScriptSerializer()).Deserialize<List<StudentsDto>>(json);
            return students;
        }


        private static List<StudentEnrollmentDto> GetAllStudentEnrollments(string schoolYear)
        {
            WebClient client = new WebClient();
            client.Headers["Content-type"] = "application/json";
            client.Encoding = Encoding.UTF8;
            client.QueryString.Add("schoolYear", schoolYear);
            string json = client.DownloadString(baseUrl + "/GetAllStudentEnrollments");
            List<StudentEnrollmentDto> students = (new JavaScriptSerializer()).Deserialize<List<StudentEnrollmentDto>>(json);
            return students;
        }

        private static List<StudentServiceDto> GetAllStudentServices(string schoolYear)
        {
            WebClient client = new WebClient();
            client.Headers["Content-type"] = "application/json";
            client.Encoding = Encoding.UTF8;
            client.QueryString.Add("schoolYear", schoolYear);
            string json = client.DownloadString(baseUrl + "/GetAllStudentServices");
            List<StudentServiceDto> students = (new JavaScriptSerializer()).Deserialize<List<StudentServiceDto>>(json);
            return students;
        }
    }
}
