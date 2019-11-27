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
    public partial class US_dsPhong : UserControl
    {
        public US_dsPhong()
        {
            InitializeComponent();
        }
        public static US_dsPhong _instance;
        public static US_dsPhong Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new US_dsPhong();
                return _instance;
            }
        }
    }
}
