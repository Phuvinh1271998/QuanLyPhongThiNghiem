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
            LoaddataGridView();
        }
        public void LoaddataGridView()
        {
            SqlConnection sql = DBUtils.GetDBConnection(F_DangNhap.Sr,"DAMH",F_DangNhap.Id,F_DangNhap.Mk);;
            sql.Open();
            SqlCommand cmd = new SqlCommand("select  dk2.MaDK_HCDC, dk1.MaNhom, dc.MaDC, dc.TenDC, dk2.SoLuong_DKDC " +
                                            "from DK_HCDC as dk1, DK_DungCu as dk2, DungCu as dc " +
                                            "where dk1.MaDK_HCDC = dk2.MaDK_HCDC and dk2.MaDC = dc.MaDC and MaNhom LIKE '%" + txtMaNhom.Text + "%'", sql);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView.DataSource = dt;
        }
        private void btXoa_Click(object sender, EventArgs e)
        {
            DialogResult dr = MessageBox.Show("Bạn có muốn Xóa?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (dr == DialogResult.Yes)
            {
                string ma = dataGridView.Rows[dataGridView.CurrentCell.RowIndex].Cells[0].Value.ToString();
                string dc = dataGridView.Rows[dataGridView.CurrentCell.RowIndex].Cells[2].Value.ToString();
                SqlConnection sql = DBUtils.GetDBConnection(F_DangNhap.Sr,"DAMH",F_DangNhap.Id,F_DangNhap.Mk);;
                sql.Open();
                SqlCommand cmd1 = new SqlCommand($"delete from DK_DUNGCU where MaDK_HCDC = '{ma}' and MaDC = '{dc}'", sql);
                cmd1.ExecuteNonQuery();
                SqlCommand cm = new SqlCommand($"select count(*) as SoLuong from DK_HoaChat where MaDK_HCDC = '{ma}'", sql);
                SqlDataAdapter adap = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                adap.Fill(dt);
                string so = dt.Rows[0]["SoLuong"].ToString();
                if (Int32.Parse(so) == 0)
                {
                    SqlCommand cmd3 = new SqlCommand($"delete from DK_HCDC where MaDK_HCDC = '{ma}'", sql);
                    cmd3.ExecuteNonQuery();
                }
                else
                {
                    SqlCommand cmd3 = new SqlCommand($"delete from DK_HoaChat where MaDK_HCDC = '{ma}'", sql);
                    cmd3.ExecuteNonQuery();
                    cmd3 = new SqlCommand($"delete from DK_HCDC where MaDK_HCDC = '{ma}'", sql);
                    cmd3.ExecuteNonQuery();
                }
                sql.Close();
                MessageBox.Show("Xóa thành công");
                LoaddataGridView();
            }
        }
    }
}
