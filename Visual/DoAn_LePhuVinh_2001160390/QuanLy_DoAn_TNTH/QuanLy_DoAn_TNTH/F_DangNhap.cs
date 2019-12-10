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
using System.Configuration;

namespace QuanLy_DoAn_TNTH
{
    public partial class F_DangNhap : Form
    {
        public F_DangNhap()
        {
            InitializeComponent();
        }

        private static bool IsServerConnected(string connectionString)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    return true;
                }
                catch (SqlException)
                {
                    return false;
                }
            }
        }
        public static string Id;
        public static string Mk;
        public static string Sr;

        private void btDangNhap_Click(object sender, EventArgs e)
        {

            string id = txtTenDN.Text;
            string mk = txtMatKhau.Text;
            string server = txtServer.Text;            
            string conn = $"Data Source={ server };Initial Catalog=DAMH;User ID={ id };Password={ mk }";
            if (id == "" | mk == "" | server == "")
            {
                MessageBox.Show("Fill all fields !");
                return;
            }
            else if (!IsServerConnected(conn))
            {
                MessageBox.Show("Login failed !");
            }
            else
            {
                Id = txtTenDN.Text;
                Mk = txtMatKhau.Text;
                Sr = txtServer.Text;
                this.Hide();
                F_Main main = new F_Main();
                main.Show();
            }
        }

        private void F_DangNhap_FormClosing(object sender, FormClosingEventArgs e)
        {
            DialogResult dr = MessageBox.Show("Bạn có muốn thoát?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (dr == DialogResult.No)
            {
                e.Cancel = true;
            }
        }

        private void btThoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void F_DangNhap_Load(object sender, EventArgs e)
        {

        }
    }
}
