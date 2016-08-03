using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DLL;
using System.Data;

namespace BLL
{
    public class UserFactory
    {
        public object ValidateUser(User objUser)
        {
            CLConn objCon = new CLConn();
            object result = 0;

            try
            {
                SqlParameter[] parameters = {  
                                                new SqlParameter("@Email",SqlDbType.VarChar,50){Value=objUser.Email},
                                                new SqlParameter("@Password",SqlDbType.VarChar,16){Value=objUser.Password}
                                            };
                result = objCon.ExcuteScalre("ValidateUser", parameters);
            }
            catch (Exception ex)
            {
                throw new Exception("something wrong");
            }

            return result;
        }

        public object ForgetEmail(string Email)
        {
            CLConn objCon = new CLConn();
            object result = 0;

            try
            {
                SqlParameter[] parameters = {  
                                                new SqlParameter("@Email",SqlDbType.VarChar,50){Value=Email}
                                            };
                result = objCon.ExcuteScalre("GetUser", parameters);
            }
            catch (Exception ex)
            {
                throw new Exception("something wrong");
            }

            return result;
        }

        public object SaveUser(User objUser)
        {
            CLConn objCon = new CLConn();
            object result = 0;

            try
            {
                SqlParameter[] parameters = {  
                                                new SqlParameter("@FirstName",SqlDbType.VarChar,20){Value=objUser.FirstName},
                                                new SqlParameter("@LastName",SqlDbType.VarChar,20){Value=objUser.LastName},
                                                new SqlParameter("@Gender",SqlDbType.Int,1){Value=objUser.Gender},
                                                new SqlParameter("@Email",SqlDbType.VarChar,50){Value=objUser.Email},
                                                new SqlParameter("@Password",SqlDbType.VarChar,16){Value=objUser.Password},
                                            };
                result = objCon.ExcuteScalre("AddUser", parameters);
            }
            catch (Exception ex)
            {
                throw new Exception("something wrong");
            }

            return result;
        }

        public object ResetPassword(User objUser)
        {
            CLConn objCon = new CLConn();
            object result = 0;

            try
            {
                SqlParameter[] parameters = {  
                                                new SqlParameter("@UserId",SqlDbType.VarChar,50){Value=objUser.UserId},
                                                new SqlParameter("@Password",SqlDbType.VarChar,16){Value=objUser.Password}
                                            };
                result = objCon.ExcuteScalre("ResetPassword", parameters);
            }
            catch (Exception ex)
            {
                throw new Exception("something wrong");
            }

            return result;
        }
    }
}
