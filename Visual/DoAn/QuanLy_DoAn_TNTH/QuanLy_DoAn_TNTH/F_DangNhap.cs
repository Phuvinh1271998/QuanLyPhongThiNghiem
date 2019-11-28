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

        
        public static string SetValueForConn = "";
        private void btDangNhap_Click(object sender, EventArgs e)
        {
            string id = txtTenDN.Text;
            string mk = txtMatKhau.Text;
            string server = "DESKTOP-AU0H4GF";
            string conn = $"Data Source={ server };Initial Catalog=DAMH;User ID={ id };Password={ mk }";
            if (id == "" | mk == "")
                MessageBox.Show("Fill all fields !");
            else if (!IsServerConnected(conn))
            {
                MessageBox.Show("Login failed !");
            }
            else
            {
                SetValueForConn = conn;
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

        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txtDangNhap = new DevExpress.XtraEditors.TextEdit();
            this.txtMatKhau = new DevExpress.XtraEditors.TextEdit();
            this.btDangNhap = new System.Windows.Forms.Button();
            this.btThoat = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.txtDangNhap.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtMatKhau.Properties)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(29, 25);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(81, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Tên đăng nhập";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(29, 69);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(52, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Mật khẩu";
            // 
            // txtDangNhap
            // 
            this.txtDangNhap.Location = new System.Drawing.Point(116, 22);
            this.txtDangNhap.Name = "txtDangNhap";
            this.txtDangNhap.Size = new System.Drawing.Size(156, 20);
            this.txtDangNhap.TabIndex = 2;
            // 
            // txtMatKhau
            // 
            this.txtMatKhau.Location = new System.Drawing.Point(116, 66);
            this.txtMatKhau.Name = "txtMatKhau";
            this.txtMatKhau.Size = new System.Drawing.Size(156, 20);
            this.txtMatKhau.TabIndex = 3;
            // 
            // btDangNhap
            // 
            this.btDangNhap.Location = new System.Drawing.Point(116, 106);
            this.btDangNhap.Name = "btDangNhap";
            this.btDangNhap.Size = new System.Drawing.Size(75, 23);
            this.btDangNhap.TabIndex = 4;
            this.btDangNhap.Text = "Đăng nhập";
            this.btDangNhap.UseVisualStyleBackColor = true;
            // 
            // btThoat
            // 
            this.btThoat.Location = new System.Drawing.Point(197, 106);
            this.btThoat.Name = "btThoat";
            this.btThoat.Size = new System.Drawing.Size(75, 23);
            this.btThoat.TabIndex = 5;
            this.btThoat.Text = "Thoát";
            this.btThoat.UseVisualStyleBackColor = true;
            // 
            // F_DangNhap
            // 
            this.ClientSize = new System.Drawing.Size(284, 144);
            this.Controls.Add(this.btThoat);
            this.Controls.Add(this.btDangNhap);
            this.Controls.Add(this.txtMatKhau);
            this.Controls.Add(this.txtDangNhap);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "F_DangNhap";
            this.Text = "Đăng nhập";
            ((System.ComponentModel.ISupportInitialize)(this.txtDangNhap.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtMatKhau.Properties)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }
    }
}
