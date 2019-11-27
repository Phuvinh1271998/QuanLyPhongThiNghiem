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
    public partial class US_dsHoaChat : UserControl
    {
        public US_dsHoaChat()
        {
            InitializeComponent();
        }
        public static US_dsHoaChat _instance;
        public static US_dsHoaChat Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new US_dsHoaChat();
                return _instance;
            }
        }
    }
}
