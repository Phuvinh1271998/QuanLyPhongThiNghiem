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
    public partial class US_dsNhom : UserControl
    {
        public US_dsNhom()
        {
            InitializeComponent();
        }
        public static US_dsNhom _instance;
        public static US_dsNhom Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new US_dsNhom();
                return _instance;
            }
        }
        private void US_dsNhom_Load(object sender, EventArgs e)
        {

        }
    }
}
