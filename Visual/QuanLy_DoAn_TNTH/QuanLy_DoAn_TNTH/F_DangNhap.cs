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

        public static string ConnVal(string name)
        {
            return ConfigurationManager.ConnectionStrings[name].ConnectionString;
        }
        private void btDangNhap_Click(object sender, EventArgs e)
        {
            string id = txtTenDN.Text;
            string mk = txtMatKhau.Text;
            string server = "DESKTOP-AU0H4GF";
            if (id == "" | mk == "")
                MessageBox.Show("Fill all fields !");
            else if (!IsServerConnected($"Data Source={ server };Initial Catalog=DAMH;User ID={ id };Password={ mk }"))
            {
                MessageBox.Show("Login failed !");
            }
            else
            {
                SqlConnection con = new SqlConnection($"Data Source={server};Initial Catalog=DAMH;User ID={id};Password={mk}");
                F_Main main = new F_Main();
                main.Show();
                this.Visible = false;
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
