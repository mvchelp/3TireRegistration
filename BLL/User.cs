using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class User
    {
        private int _UserId;
        private string _FirstName;
        private string _LastName;
        private int _Gender;
        private string _Email;
        private string _Password;

        public int UserId
        {
            get { return _UserId; }
            set { _UserId = value; }
        }
        public string FirstName
        {
            get { return _FirstName; }
            set { _FirstName = value; }
        }
        public string LastName
        {
            get { return _LastName; }
            set { _LastName = value; }
        }
        public int Gender
        {
            get { return _Gender; }
            set { _Gender = value; }
        }
        public string Email
        {
            get { return _Email; }
            set { _Email = value; }
        }
        public string Password
        {
            get { return _Password; }
            set { _Password = value; }
        }
    }
}
