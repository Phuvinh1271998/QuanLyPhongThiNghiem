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
using System.Data.Sql;

namespace QuanLy_DoAn_TNTH
{
    public partial class US_dkHoaChat : UserControl
    {
        public US_dkHoaChat()
        {
            InitializeComponent();
        }
        public static US_dkHoaChat _instance;
        public static US_dkHoaChat Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new US_dkHoaChat();
                return _instance;
            }
        }
        private void US_dkHoaChat_Load(object sender, EventArgs e)
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
            //-----------------HoaChat
            cm = new SqlCommand("select MaHC,TenHC from HoaChat", sql);
            adap = new SqlDataAdapter(cm);
            dt = new DataTable();
            adap.Fill(dt);
            cbbTenHC.DisplayMember = "TenHC";
            cbbTenHC.ValueMember = "MaHC";
            cbbTenHC.DataSource = dt;
            txtMaHC.Text = dt.Rows[cbbTenHC.SelectedIndex]["MaHC"].ToString();
            //-------------------GVQL
            cm = new SqlCommand("select MaGVQL,TenGVQL from GV_QLTN", sql);
            adap = new SqlDataAdapter(cm);
            dt = new DataTable();
            adap.Fill(dt);
            cbbTenGVQL.DisplayMember = "TenGVQL";
            cbbTenGVQL.ValueMember = "MaGVQL";
            cbbTenGVQL.DataSource = dt;
            sql.Close();

            LoaddataGridView();
        }



        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection sql = DBUtils.GetDBConnection();
            sql.Open();
            SqlCommand cm = new SqlCommand("select MaNhom,TenNhom from NhomSV", sql);
            SqlDataAdapter adap = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            txtTenNhom.Text = dt.Rows[cbbMaNhom.SelectedIndex]["TenNhom"].ToString();
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection sql = DBUtils.GetDBConnection();
            sql.Open();
            SqlCommand cm = new SqlCommand("select MaHC,TenHC from HoaChat", sql);
            SqlDataAdapter adap = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            txtMaHC.Text = dt.Rows[cbbTenHC.SelectedIndex]["MaHC"].ToString();
        }

        private void textBox3_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!Char.IsDigit(e.KeyChar) && !Char.IsControl(e.KeyChar))
                e.Handled = true;
            if (txtSoLuong.Text.Length > 4)
                e.Handled = true;
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
        private void button1_Click(object sender, EventArgs e)
        {
            string MNhom = cbbMaNhom.SelectedValue.ToString();
            string MHC = cbbTenHC.SelectedValue.ToString();
            int sl = Int32.Parse(txtSoLuong.Text.Trim());
            string MGV = cbbTenGVQL.SelectedValue.ToString().Trim();

            string MDKHCDC = MaDK_HCDC();

            if (!exedata($"insert into DK_HCDC values('{MDKHCDC}','{MNhom}','{MGV}')"))
                MessageBox.Show("Có Lỗi (DK_HCDC) !");
            else if (!exedata($"insert into DK_HoaChat values('{MDKHCDC}','{MHC}',{sl})"))
                MessageBox.Show("Có Lỗi (DK_HoaChat)!");

            LoaddataGridView();
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

        private void dataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txtMaHC.Text = dataGridView[3, e.RowIndex].Value.ToString();
            cbbMaNhom.Text = dataGridView[1, e.RowIndex].Value.ToString();
            txtSoLuong.Text = dataGridView[5, e.RowIndex].Value.ToString();
            txtMaGVQL.Text = dataGridView[2, e.RowIndex].Value.ToString();
            cbbTenHC.Text = dataGridView[4, e.RowIndex].Value.ToString();
        }

        public void LoaddataGridView()
        {
            SqlConnection sql = DBUtils.GetDBConnection();
            sql.Open();
            string str = "select dk1.MaDK_HCDC, MaNhom, MaGVQL, dk2.MaHC, hc.TenHC, SoLuong_HC from DK_HCDC as dk1, DK_HoaChat as dk2, HoaChat as hc where dk1.MaDK_HCDC = dk2.MaDK_HCDC and dk2.MaHC = hc.MaHC";
            SqlCommand cmd = new SqlCommand(str, sql);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView.DataSource = dt;
            sql.Close();
        }

        private void btXoa_Click(object sender, EventArgs e)
        {
            DialogResult dr = MessageBox.Show("Bạn có muốn Xóa?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (dr == DialogResult.Yes)
            {
                SqlConnection sql = DBUtils.GetDBConnection();
                SqlCommand cmd = new SqlCommand("delete from DK_HCDC where MaDK_HCDC = '"+dataGridView.)+"'", sql);

                foreach (DataGridViewRow item in this.dataGridView.SelectedRows)
                {
                    dataGridView.Rows.RemoveAt(item.Index);
                }
            }
        }

        private void btSua_Click(object sender, EventArgs e)
        {
            SqlConnection sql = DBUtils.GetDBConnection();
            sql.Open();
            SqlCommand cmd = new SqlCommand("update DK_HCDC set MaNhom='" + cbbMaNhom.Text + "', MaGVHD='" + txtMaGVQL.Text + "' where MaDK_HCDC = '" + dataGridView.Rows[0].ToString()+ "'", sql);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            dataGridView.DataSource = cmd.ExecuteNonQuery();
            sql.Close();

        }
    }
}
