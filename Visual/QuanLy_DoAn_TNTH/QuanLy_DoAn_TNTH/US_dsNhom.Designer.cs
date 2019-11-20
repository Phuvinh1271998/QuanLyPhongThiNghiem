namespace QuanLy_DoAn_TNTH
{
    partial class US_dsNhom
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dataGridView_Nhom = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView_Nhom)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView_Nhom
            // 
            this.dataGridView_Nhom.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView_Nhom.Location = new System.Drawing.Point(3, 3);
            this.dataGridView_Nhom.Name = "dataGridView_Nhom";
            this.dataGridView_Nhom.Size = new System.Drawing.Size(546, 306);
            this.dataGridView_Nhom.TabIndex = 0;
            // 
            // US_dsNhom
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.dataGridView_Nhom);
            this.Name = "US_dsNhom";
            this.Size = new System.Drawing.Size(552, 312);
            this.Load += new System.EventHandler(this.US_dsNhom_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView_Nhom)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView_Nhom;
    }
}
