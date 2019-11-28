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
            SqlConnection sql = new SqlConnection(F_DangNhap.SetValueForConn);
            sql.Open();
            SqlCommand cm = new SqlCommand("select MaNhom,TenNhom from NhomSV", sql);
            SqlDataAdapter adap = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            comboBox1.DisplayMember = "TenNhom";
            comboBox1.ValueMember = "MaNhom";
            comboBox1.DataSource = dt;
            textBox1.Text = dt.Rows[comboBox1.SelectedIndex]["MaNhom"].ToString();
            //-----------------HoaChat
            cm = new SqlCommand("select MaHC,TenHC from HoaChat", sql);
            adap = new SqlDataAdapter(cm);
            dt = new DataTable();
            adap.Fill(dt);
            comboBox2.DisplayMember = "TenHC";
            comboBox2.ValueMember = "MaHC";
            comboBox2.DataSource = dt;            
            textBox2.Text = dt.Rows[comboBox2.SelectedIndex]["MaHC"].ToString();
            //-------------------GVQL
            cm = new SqlCommand("select MaGVQL,TenGVQL from GV_QLTN", sql);
            adap = new SqlDataAdapter(cm);
            dt = new DataTable();
            adap.Fill(dt);
            comboBox3.DisplayMember = "TenGVQL";
            comboBox3.ValueMember = "MaGVQL";
            comboBox3.DataSource = dt;                   
            sql.Close();
        }

        private void comboBox1_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void comboBox1_Click(object sender, EventArgs e)
        {
            
        }

        private void comboBox1_SelectedValueChanged(object sender, EventArgs e)
        {
            
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection sql = new SqlConnection(F_DangNhap.SetValueForConn);
            sql.Open();
            SqlCommand cm = new SqlCommand("select MaNhom,TenNhom from NhomSV", sql);
            SqlDataAdapter adap = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            textBox1.Text = dt.Rows[comboBox1.SelectedIndex]["MaNhom"].ToString();
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection sql = new SqlConnection(F_DangNhap.SetValueForConn);
            sql.Open();
            SqlCommand cm = new SqlCommand("select MaHC,TenHC from HoaChat", sql);
            SqlDataAdapter adap = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            textBox2.Text = dt.Rows[comboBox2.SelectedIndex]["MaHC"].ToString();
        }

        private void textBox3_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!Char.IsDigit(e.KeyChar) && !Char.IsControl(e.KeyChar))
                e.Handled = true;
            if (textBox3.Text.Length > 4)
                e.Handled = true;
        }

        public string MaDK_HCDC()
        {
            SqlConnection sql = new SqlConnection(F_DangNhap.SetValueForConn);
            sql.Open();            
            SqlDataAdapter da = new SqlDataAdapter("select MaDK_HCDC from DK_HCDC",sql);
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
                while (kq <= arr[n] ) {
                    kq++;
                };
                n++;
            } while (kq <= arr[n]);
            string mahcdc="";
            if (kq >= 10)
                mahcdc = need + kq.ToString();
            else
                mahcdc = need + "0" + kq.ToString();
            return mahcdc;
        }

        public Boolean exedata(string cmd)
        {
            SqlConnection sql = new SqlConnection(F_DangNhap.SetValueForConn);
            sql.Open();
            Boolean check = false;
            try
            {
                SqlCommand sc = new SqlCommand(cmd,sql);
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
            string MNhom = comboBox1.SelectedValue.ToString();
            string MHC = comboBox2.SelectedValue.ToString();
            int sl = Int32.Parse(textBox3.Text.Trim());
            string MGV = comboBox3.SelectedValue.ToString().Trim();

            string MDKHCDC = MaDK_HCDC();
            //SqlConnection sql = new SqlConnection(F_DangNhap.SetValueForConn);
            //sql.Open();
            //SqlCommand sc = new SqlCommand($"insert into DK_HCDC values('{MDKHCDC}','{MNhom}','{MGV}')", sql);
            //sc.ExecuteNonQuery();



            if (!exedata($"insert into DK_HCDC values('{MDKHCDC}','{MNhom}','{MGV}')"))
                MessageBox.Show("Có Lỗi (DK_HCDC) !");
            else if (!exedata($"insert into DK_HoaChat values('{MDKHCDC}','{MHC}',{sl})"))
                MessageBox.Show("Có Lỗi (DK_HoaChat)!");
        }
    }
}
