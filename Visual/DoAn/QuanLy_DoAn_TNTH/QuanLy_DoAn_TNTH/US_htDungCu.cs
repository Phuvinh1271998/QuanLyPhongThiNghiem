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
    public partial class US_htDungCu : UserControl
    {
        public US_htDungCu()
        {
            InitializeComponent();
        }
        public static US_htDungCu _instance;
        public static US_htDungCu Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new US_htDungCu();
                return _instance;
            }
        }

        private void btTimKiem_Click(object sender, EventArgs e)
        {
            SqlConnection sql = DBUtils.GetDBConnection();
            sql.Open();
            SqlCommand cmd = new SqlCommand("select dk1.MaNhom, dk2.MaDK_HCDC, dc.TenDC, dk2.SoLuong_DC " +
                                            "from DK_HCDC as dk1, DK_DungCu as dk2, DungCu as dc " +
                                            "where dk1.MaDK_HCDC = dk2.MaDK_HCDC and dk2.MaDC = dc.MaDC and MaNhom = '"+txtMaNhom.Text+"'", sql);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView.DataSource = dt;
        }

        private void dataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 4)
            {
                string Task = dataGridView.Rows[e.RowIndex].Cells[4].Value.ToString();
                if (Task == "Delete")
                {
                    if (MessageBox.Show("Bạn có chắc chắm muốn xóa không?", "Đang xóa...", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                    {
                        int rowIndex = e.RowIndex;
                        dataGridView.Rows.RemoveAt(rowIndex);
                        SqlDataAdapter da = new SqlDataAdapter();
                        DataSet dataset = new DataSet();
                        dataset.Tables["tbl_students"].Rows[rowIndex].Delete();
                        da.Update(dataset, "tbl_students");
                    }
                }
            }
        }
    }
}
