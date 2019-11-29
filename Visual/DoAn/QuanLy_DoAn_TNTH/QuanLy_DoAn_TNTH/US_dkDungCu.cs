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
    public partial class US_dkDungCu : UserControl
    {
        public US_dkDungCu()
        {
            InitializeComponent();
        }
        public static US_dkDungCu _instance;
        public static US_dkDungCu Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new US_dkDungCu();
                return _instance;
            }
        }

        private void cbbMaNhom_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void US_dkDungCu_Load(object sender, EventArgs e)
        {
            //-----------------Nhom
            SqlConnection sql = DBUtils.GetDBConnection();
            sql.Open();
            SqlCommand cm = new SqlCommand("select MaNhom,TenNhom from NhomSV", sql);
            SqlDataAdapter adap = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            cbbMaNhom.DisplayMember = "MaNhom";
            cbbMaNhom.ValueMember = "MaNhom";
            cbbMaNhom.DataSource = dt;
            txtTenNhom.Text = dt.Rows[cbbMaNhom.SelectedIndex]["MaNhom"].ToString();
            //-----------------DungCu
            cm = new SqlCommand("select MaDC,TenDC from DungCu", sql);
            adap = new SqlDataAdapter(cm);
            dt = new DataTable();
            adap.Fill(dt);
            cbbTenDC.DisplayMember = "TenDC";
            cbbTenDC.ValueMember = "MaDC";
            cbbTenDC.DataSource = dt;
            txtMaDC.Text = dt.Rows[cbbTenDC.SelectedIndex]["MaDC"].ToString();
            //-------------------GVQL
            cm = new SqlCommand("select MaGVQL,TenGVQL from GV_QLTN", sql);
            adap = new SqlDataAdapter(cm);
            dt = new DataTable();
            adap.Fill(dt);
            cbbTenGVQL.DisplayMember = "TenGVQL";
            cbbTenGVQL.ValueMember = "MaGVQL";
            cbbTenGVQL.DataSource = dt;
            sql.Close();
            txtMaDK_HCDC.Enabled = false;
            txtMaGVQL.Enabled = false;
            txtTenNhom.Enabled = false;
            LoaddataGridView();
        }

        public void LoaddataGridView()
        {
            SqlConnection sql = DBUtils.GetDBConnection();
            sql.Open();
            string str = "select dk1.MaDK_HCDC, MaNhom, MaGVQL, dk2.MaDC, hc.TenDC, SoLuong_DC from DK_HCDC as dk1, DK_DungCu as dk2, DungCu as hc where dk1.MaDK_HCDC = dk2.MaDK_HCDC and dk2.MaDC = hc.MaDC";
            SqlCommand cmd = new SqlCommand(str, sql);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView.DataSource = dt;
            sql.Close();
        }

        private void cbbTenGVQL_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection sql = DBUtils.GetDBConnection();
            sql.Open();
            SqlCommand cm = new SqlCommand("select * from GV_QLTN", sql);
            SqlDataAdapter adap = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            txtMaGVQL.Text = dt.Rows[cbbTenGVQL.SelectedIndex]["MaGVQL"].ToString();
        }

        public string MaDK_HCDC()
        {
            SqlConnection sql = DBUtils.GetDBConnection();
            sql.Open();
            SqlDataAdapter da = new SqlDataAdapter("select MaDK_HCDC from DK_HCDC", sql);
            DataTable dt = new DataTable();
            da.Fill(dt);
            sql.Close();
            string need = "HCDC";
            int[] arr = new int[100];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string ma = dt.Rows[i]["MaDK_HCDC"].ToString();
                string so = ma.Substring(4, 5);
                int a = Int32.Parse(so);
                arr[i] = a;
            }
            int kq = 0;
            int n = 0;
            do
            {
                while (kq <= arr[n])
                {
                    kq++;
                };
                n++;
            } while (kq <= arr[n]);
            string mahcdc = "";
            if (kq >= 10)
                mahcdc = need + kq.ToString();
            else
                mahcdc = need + "0" + kq.ToString();
            return mahcdc;
        }

        public Boolean exedata(string cmd)
        {
            SqlConnection sql = DBUtils.GetDBConnection();
            sql.Open();
            Boolean check = false;
            try
            {
                SqlCommand sc = new SqlCommand(cmd, sql);
                sc.ExecuteNonQuery();
                check = true;
            }
            catch (Exception)
            {
                check = false;
            }
            sql.Close();
            return check;
        }
        private void btThem_Click(object sender, EventArgs e)
        {
            string MNhom = cbbMaNhom.SelectedValue.ToString();
            string MDC = cbbTenDC.SelectedValue.ToString();
            int sl;
            if (txtSoLuong.Text.Trim() != "")
            {
                sl = Int32.Parse(txtSoLuong.Text.Trim());
            }
            else
            {
                MessageBox.Show("Nhập Số Lượng !");
                return;
            }
            string MGV = cbbTenGVQL.SelectedValue.ToString().Trim();

            string MDKHCDC = MaDK_HCDC();

            if (!exedata($"insert into DK_HCDC values('{MDKHCDC}','{MNhom}','{MGV}')"))
            {
                MessageBox.Show("Có Lỗi (DK_HCDC) !");
                return;
            }
            else if (!exedata($"insert into DK_DungCu values('{MDKHCDC}','{MDC}',{sl})"))
            {
                MessageBox.Show("Có Lỗi (DK_DungCu)!");
                return;
            }
            else
                MessageBox.Show("Thêm thành công");
            LoaddataGridView();
        }

        private void btXoa_Click(object sender, EventArgs e)
        {
            DialogResult dr = MessageBox.Show("Bạn có muốn Xóa?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (dr == DialogResult.Yes)
            {
                SqlConnection sql = DBUtils.GetDBConnection();
                sql.Open();
                SqlCommand cmd1 = new SqlCommand("delete from DK_DungCu where MaDK_HCDC = '" + dataGridView.Rows[dataGridView.CurrentCell.RowIndex].Cells[0].Value.ToString() + "'", sql);
                cmd1.ExecuteNonQuery();
                SqlCommand cmd2 = new SqlCommand("delete from DK_HCDC where MaDK_HCDC = '" + dataGridView.Rows[dataGridView.CurrentCell.RowIndex].Cells[0].Value.ToString() + "'", sql);
                cmd2.ExecuteNonQuery();
                sql.Close();
                MessageBox.Show("Xóa thành công");
                LoaddataGridView();
            }
        }

        private void btSua_Click(object sender, EventArgs e)
        {
            SqlConnection sql = DBUtils.GetDBConnection();
            sql.Open();

            SqlCommand cmd3 = new SqlCommand("update DK_DungCu set SoLuong_DC = '" + txtSoLuong.Text + "' where MaDK_HCDC = '" + txtMaDK_HCDC.Text + "'", sql);
            cmd3.ExecuteNonQuery();

            SqlCommand cmd2 = new SqlCommand("update DK_HCDC set MaNhom='" + cbbMaNhom.Text + "', MaGVQL='" + txtMaGVQL.Text + "' where MaDK_HCDC = '" + txtMaDK_HCDC.Text + "'", sql);
            cmd2.ExecuteNonQuery();

            MessageBox.Show("Sửa thành công");
            sql.Close();
            LoaddataGridView();
        }
    }
}
