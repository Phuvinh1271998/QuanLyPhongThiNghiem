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
    public partial class US_dsHoaChat : UserControl
    {
        public US_dsHoaChat()
        {
            InitializeComponent();
        }
        public static US_dsHoaChat _instance;
        public static US_dsHoaChat Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new US_dsHoaChat();
                return _instance;
            }
        }

        private void US_dsHoaChat_Load(object sender, EventArgs e)
        {
            SqlConnection sql = DBUtils.GetDBConnection(F_DangNhap.Sr,"DAMH",F_DangNhap.Id,F_DangNhap.Mk);
            sql.Open();
            string str = "select * from HoaChat";
            SqlCommand cmd = new SqlCommand(str, sql);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView_HoaChat.DataSource = dt;
            sql.Close();
        }
    }
}
