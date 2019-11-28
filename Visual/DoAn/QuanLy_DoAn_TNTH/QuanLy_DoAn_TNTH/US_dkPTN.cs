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
    public partial class US_dkPTN : UserControl
    {
        public US_dkPTN()
        {
            InitializeComponent();
        }
        public static US_dkPTN _instance;
        public static US_dkPTN Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new US_dkPTN();
                return _instance;
            }
        }

        private void btTimKiem_Click(object sender, EventArgs e)
        {
            SqlConnection sql = DBUtils.GetDBConnection();
            sql.Open();
            SqlCommand cmd = new SqlCommand("Select * from ThietBi where TenTB LIKE '%"+txtTenTB.Text+"%'", sql);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView_ThietBi.DataSource = dt;
        }

        private void dataGridView_ThietBi_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txtMaTB.Text = dataGridView_ThietBi[0, e.RowIndex].Value.ToString();
        }
    }
}
