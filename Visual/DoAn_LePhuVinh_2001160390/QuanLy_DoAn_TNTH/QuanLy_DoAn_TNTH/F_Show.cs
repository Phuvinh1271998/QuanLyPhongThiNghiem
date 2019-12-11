using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace QuanLy_DoAn_TNTH
{
    public partial class F_Show : Form
    {
        public F_Show()
        {
            InitializeComponent();
        }

        private void F_Show_Load(object sender, EventArgs e)
        {
            SqlConnection sql = DBUtils.GetDBConnection(F_DangNhap.Sr, "DAMH", F_DangNhap.Id, F_DangNhap.Mk);
            sql.Open();
            SqlCommand cm = new SqlCommand("select * from DK_PTN", sql);
            SqlDataAdapter adap = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            dataGridView1.DataSource = dt;
            sql.Close();
        }

        private void btnPhong_Click(object sender, EventArgs e)
        {
            SqlConnection sql = DBUtils.GetDBConnection(F_DangNhap.Sr, "DAMH", F_DangNhap.Id, F_DangNhap.Mk);
            sql.Open();
            SqlCommand cm = new SqlCommand("select * from DK_PTN", sql);
            SqlDataAdapter adap = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            dataGridView1.DataSource = dt;
            sql.Close();
        }

        private void btnHC_Click(object sender, EventArgs e)
        {
            SqlConnection sql = DBUtils.GetDBConnection(F_DangNhap.Sr, "DAMH", F_DangNhap.Id, F_DangNhap.Mk);
            sql.Open();
            SqlCommand cm = new SqlCommand("select * from HoaChat", sql);
            SqlDataAdapter adap = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            dataGridView1.DataSource = dt;
            sql.Close();
        }

        private void btnDC_Click(object sender, EventArgs e)
        {
            SqlConnection sql = DBUtils.GetDBConnection(F_DangNhap.Sr, "DAMH", F_DangNhap.Id, F_DangNhap.Mk);
            sql.Open();
            SqlCommand cm = new SqlCommand("select * from DungCu", sql);
            SqlDataAdapter adap = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            dataGridView1.DataSource = dt;
            sql.Close();
        }

        private void F_Show_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }
    }
}
