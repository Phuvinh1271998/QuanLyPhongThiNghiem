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
    public partial class US_dkPTN : UserControl
    {
        public US_dkPTN()
        {
            InitializeComponent();
        }
        public static US_dkPTN _instance;
        public static US_dkPTN Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new US_dkPTN();
                return _instance;
            }
        }
    }
}
