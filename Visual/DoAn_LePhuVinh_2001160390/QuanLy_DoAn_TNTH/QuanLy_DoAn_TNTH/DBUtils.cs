using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLy_DoAn_TNTH
{
    class DBUtils
    {
        public DBUtils() 
        {
        
        }
        public static SqlConnection GetDBConnection(string datasource, string database, string username, string password)
        {
            return DBSQLServerUtils.GetDBConnection(datasource, database, username, password);
        }
    }
}
