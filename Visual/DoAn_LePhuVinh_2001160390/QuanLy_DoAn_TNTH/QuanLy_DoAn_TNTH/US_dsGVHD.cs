using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace QuanLy_DoAn_TNTH
{
    public partial class US_dsGVHD : UserControl
    {
        public US_dsGVHD()
        {
            InitializeComponent();
        }
        public static US_dsGVHD _instance;
        public static US_dsGVHD Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new US_dsGVHD();
                return _instance;
            }
        }

        private void US_dsGVHD_Load(object sender, EventArgs e)
        {
            SqlConnection sql = DBUtils.GetDBConnection(F_DangNhap.Sr,"DAMH",F_DangNhap.Id,F_DangNhap.Mk);
            sql.Open();
            string str = "select * from GVHD";
            SqlCommand cmd = new SqlCommand(str, sql);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView_GVHD.DataSource = dt;
            sql.Close();
        }
    }
}
