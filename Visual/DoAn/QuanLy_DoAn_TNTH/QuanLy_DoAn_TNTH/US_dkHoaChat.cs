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
           
        }
    }
}
