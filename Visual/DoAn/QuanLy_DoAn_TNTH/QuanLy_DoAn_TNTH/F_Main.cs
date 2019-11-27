using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLy_DoAn_TNTH
{
    public partial class F_Main : Form
    {
        public F_Main()
        {
            InitializeComponent();
        }

        private void btDangNhap_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            F_DangNhap dn = new F_DangNhap();
            dn.Show();
        }

        private void F_Main_Load(object sender, EventArgs e)
        {
            btDangXuat.Enabled = false;
        }

        private void barButtonItem2_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (!this.Controls.Contains(US_dsNhom.Instance))
            {
                this.Controls.Add(US_dsNhom.Instance);
                US_dsNhom.Instance.Dock = DockStyle.Fill;
                US_dsNhom.Instance.BringToFront();
            }
            US_dsNhom.Instance.BringToFront();
        }

        private void barButtonItem9_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (!this.Controls.Contains(US_dkHoaChat.Instance))
            {
                this.Controls.Add(US_dkHoaChat.Instance);
                US_dkHoaChat.Instance.Dock = DockStyle.Fill;
                US_dkHoaChat.Instance.BringToFront();
            }
            US_dkHoaChat.Instance.BringToFront();
        }

        private void barButtonItem28_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (!this.Controls.Contains(US_dkDungCu.Instance))
            {
                this.Controls.Add(US_dkDungCu.Instance);
                US_dkDungCu.Instance.Dock = DockStyle.Fill;
                US_dkDungCu.Instance.BringToFront();
            }
            US_dkDungCu.Instance.BringToFront();
        }

        private void barButtonItem10_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (!this.Controls.Contains(US_dsHoaChat.Instance))
            {
                this.Controls.Add(US_dsHoaChat.Instance);
                US_dsHoaChat.Instance.Dock = DockStyle.Fill;
                US_dsHoaChat.Instance.BringToFront();
            }
            US_dsHoaChat.Instance.BringToFront();
        }

        private void barButtonItem30_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (!this.Controls.Contains(US_dkPTN.Instance))
            {
                this.Controls.Add(US_dkPTN.Instance);
                US_dkPTN.Instance.Dock = DockStyle.Fill;
                US_dkPTN.Instance.BringToFront();
            }
            US_dkPTN.Instance.BringToFront();
        }

        private void barButtonItem33_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (!this.Controls.Contains(US_dsPhong.Instance))
            {
                this.Controls.Add(US_dsPhong.Instance);
                US_dsPhong.Instance.Dock = DockStyle.Fill;
                US_dsPhong.Instance.BringToFront();
            }
            US_dsPhong.Instance.BringToFront();
        }

        private void barButtonItem34_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (!this.Controls.Contains(US_dsThietBi.Instance))
            {
                this.Controls.Add(US_dsThietBi.Instance);
                US_dsThietBi.Instance.Dock = DockStyle.Fill;
                US_dsThietBi.Instance.BringToFront();
            }
            US_dsThietBi.Instance.BringToFront();
        }
    }
}
