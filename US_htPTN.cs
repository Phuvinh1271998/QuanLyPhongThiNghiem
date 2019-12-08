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
    public partial class US_htPTN : UserControl
    {
        public US_htPTN()
        {
            InitializeComponent();
        }
        public static US_htPTN _instance;
        public static US_htPTN Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new US_htPTN();
                return _instance;
            }
        }
        public void LoaddataGridView()
        {
            SqlConnection sql = DBUtils.GetDBConnection();
            sql.Open();
            SqlCommand cmd = new SqlCommand("select  *" +
                                            "from DK_PTN " +
                                            "where MaNhom LIKE '%" + txtMaNhom.Text + "%'", sql);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
        }
        private void btTimKiem_Click(object sender, EventArgs e)
        {
            LoaddataGridView();
        }

        private void btXoa_Click(object sender, EventArgs e)
        {
            DialogResult dr = MessageBox.Show("Bạn có muốn Xóa?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (dr == DialogResult.Yes)
            {
                DateTime ngay = DateTime.Parse(this.dataGridView1.Rows[this.dataGridView1.CurrentRow.Index].Cells[0].Value.ToString());
                string nhom = dataGridView1.Rows[dataGridView1.CurrentCell.RowIndex].Cells[2].Value.ToString();
                string buoi = dataGridView1.Rows[dataGridView1.CurrentCell.RowIndex].Cells[1].Value.ToString();
                SqlConnection sql = DBUtils.GetDBConnection();
                sql.Open();
                SqlCommand cmd = new SqlCommand($"delete from DK_PTN where NgayDK='{ngay}' and MaNhom='{nhom}' and MaBuoi='{buoi}'", sql);
                cmd.ExecuteNonQuery();
                sql.Close();
                MessageBox.Show("Xóa thành công");
                LoaddataGridView();
            }
        }
    }
}
