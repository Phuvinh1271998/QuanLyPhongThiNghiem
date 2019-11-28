using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLy_DoAn_TNTH
{
    public partial class US_dkDungCu : UserControl
    {
        public US_dkDungCu()
        {
            InitializeComponent();
        }
        public static US_dkDungCu _instance;
        public static US_dkDungCu Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new US_dkDungCu();
                return _instance;
            }
        }

        private void cbbMaNhom_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
