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

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void US_dkPTN_Load(object sender, EventArgs e)
        {
            //-----------load nhom
            SqlConnection sql = DBUtils.GetDBConnection();
            sql.Open();
            SqlCommand cm = new SqlCommand("select MaNhom,TenNhom from NhomSV", sql);
            SqlDataAdapter adap = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            cbTenNhom.DisplayMember = "TenNhom";
            cbTenNhom.ValueMember = "MaNhom";
            cbTenNhom.DataSource = dt;
            //-----------load loại TN
            cm = new SqlCommand("select MaLoaiTN,TenLoai from Loai_TN", sql);
            adap = new SqlDataAdapter(cm);
            dt = new DataTable();
            adap.Fill(dt);
            cbLoaiTN.DisplayMember = "TenLoai";
            cbLoaiTN.ValueMember = "MaLoaiTN";
            cbLoaiTN.DataSource = dt;
            //-----------load loại TN
            cm = new SqlCommand("select MaPTN,TenPTN from PhongThiNghiem", sql);
            adap = new SqlDataAdapter(cm);
            dt = new DataTable();
            adap.Fill(dt);
            cbTenPhong.DisplayMember = "TenPTN";
            cbTenPhong.ValueMember = "MaPTN";
            cbTenPhong.DataSource = dt;
            //-------------------GVQL
            cm = new SqlCommand("select MaGVQL,TenGVQL from GV_QLTN", sql);
            adap = new SqlDataAdapter(cm);
            dt = new DataTable();
            adap.Fill(dt);
            cbTenGV.DisplayMember = "TenGVQL";
            cbTenGV.ValueMember = "MaGVQL";
            cbTenGV.DataSource = dt;
            //---------------------Buổi
            cm = new SqlCommand("select MaBuoi,Tiet from Buoi", sql);
            adap = new SqlDataAdapter(cm);
            dt = new DataTable();
            adap.Fill(dt);
            cbBuoi.DisplayMember = "Tiet";
            cbBuoi.ValueMember = "MaBuoi";
            cbBuoi.DataSource = dt;
            //-------------------grid TB
            cm = new SqlCommand("select MaTB,TenTB from ThietBi", sql);
            adap = new SqlDataAdapter(cm);
            dt = new DataTable();
            adap.Fill(dt);            
            dataGridView_ThietBi.DataSource = dt;

            cm = new SqlCommand("select * from ThietBi", sql);
            adap = new SqlDataAdapter(cm);
            dt = new DataTable();
            adap.Fill(dt);
            dataGridView_ThietBi.DataSource = dt;

            cm = new SqlCommand("select * from DK_PTN", sql);
            adap = new SqlDataAdapter(cm);
            dt = new DataTable();
            adap.Fill(dt);
            dataGridView2.DataSource = dt;
            sql.Close();

            txtMaTB.Enabled = false;

            sql.Close();
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
        private void btnThem_Click(object sender, EventArgs e)
        {
            if(txtMaTB.Text.Trim() == "")
            {
                MessageBox.Show("Chọn Thiết Bị !");
                return;
            }
            if (txtSoLuong.Text.Trim() == "")
            {
                MessageBox.Show("Nhập số Lượng !");
                return;
            }
            if (date.Value <= DateTime.Now)
            {
                MessageBox.Show("Nhập Ngày Khác !");
                return;
            }
            string nhom=cbTenNhom.SelectedValue.ToString().Trim(); ;
            string loai= cbLoaiTN.SelectedValue.ToString().Trim(); ;
            DateTime ngay=date.Value;
            string gv=cbTenGV.SelectedValue.ToString().Trim(); ;
            string phong= cbTenPhong.SelectedValue.ToString().Trim(); ;
            string buoi= cbBuoi.SelectedValue.ToString().Trim(); ;
            string tb= txtMaTB.Text.Trim();
            int sl = Int32.Parse(txtSoLuong.Text.Trim());

            if (!exedata($"exec DKPTN '{ngay}','{buoi}','{nhom}','{gv}','{loai}','{phong}','{tb}',{sl};"))
                MessageBox.Show("Có Lỗi !");
            else
                MessageBox.Show("Thành công !");

            //-------------------grid TB
            SqlConnection sql = DBUtils.GetDBConnection();
            sql.Open();            
            SqlCommand cm = new SqlCommand("select * from DK_PTN", sql);
            SqlDataAdapter adap = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            dataGridView2.DataSource = dt;
            sql.Close();
        }

        private void dataGridView_ThietBi_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int numrow;
            numrow = e.RowIndex;
            txtMaTB.Text = dataGridView_ThietBi.Rows[numrow].Cells[0].Value.ToString();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (this.dataGridView2.SelectedRows.Count > 0)
            {
                DateTime ngay = DateTime.Parse(this.dataGridView2.Rows[this.dataGridView2.CurrentRow.Index].Cells[0].Value.ToString());
                if (!exedata($"delete from DK_PTN where NgayDK='{ngay}'"))
                    MessageBox.Show("Có Lỗi !");
                else
                    MessageBox.Show("Thành công !");
                SqlConnection sql = DBUtils.GetDBConnection();
                sql.Open();
                SqlCommand cm = new SqlCommand("select * from DK_PTN", sql);
                SqlDataAdapter adap = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                adap.Fill(dt);
                dataGridView2.DataSource = dt;
                sql.Close();
            }
        }
    }
}
