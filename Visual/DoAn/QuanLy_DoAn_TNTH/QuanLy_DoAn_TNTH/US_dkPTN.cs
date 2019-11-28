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

            txtMaTB.Enabled = false;

            sql.Close();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {

        }

        private void dataGridView_ThietBi_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int numrow;
            numrow = e.RowIndex;
            txtMaTB.Text = dataGridView_ThietBi.Rows[numrow].Cells[0].Value.ToString();
        }
    }
}
