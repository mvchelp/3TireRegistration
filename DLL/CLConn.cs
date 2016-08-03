using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;

namespace DLL
{
    public class CLConn
    {
        string SqlConnectionString = String.Empty;

        public CLConn()
        {
            SqlConnectionString = "Data Source=.;Initial Catalog=User;Integrated Security=True";
        }

        public object ExcuteScalre(string SpName, params SqlParameter[] sqlParamList)
        {
            object objResult = null;
            try
            {
                using (TransactionScope Scop = new TransactionScope())
                {
                    using (SqlConnection Myconn = new SqlConnection(SqlConnectionString))
                    {

                        using (SqlCommand cmd = new SqlCommand(SpName, Myconn))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            if (sqlParamList != null)
                            {
                                foreach (SqlParameter paraobj in sqlParamList)
                                {
                                    cmd.Parameters.Add(paraobj);
                                }
                            }

                            Myconn.Open();
                            objResult = cmd.ExecuteScalar();
                        }
                    }
                    Scop.Complete();
                }
                return objResult;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public DataTable ExcuteDataTable(string SpName, params SqlParameter[] SqlParamList)
        {
            DataTable dt = new DataTable();
            try
            {
                using (TransactionScope Scop = new TransactionScope())
                {
                    using (SqlConnection Myconn = new SqlConnection(SqlConnectionString))
                    {

                        using (SqlCommand cmd = new SqlCommand(SpName, Myconn))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            if (SqlParamList != null)
                            {
                                foreach (SqlParameter paraobj in SqlParamList)
                                {
                                    cmd.Parameters.Add(paraobj);
                                }
                            }

                            Myconn.Open();
                            SqlDataAdapter sqlad = new SqlDataAdapter(cmd);
                            sqlad.Fill(dt);
                        }
                    }
                    Scop.Complete();
                }
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
