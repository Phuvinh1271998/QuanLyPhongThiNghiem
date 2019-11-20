﻿using System;
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
    }
}
