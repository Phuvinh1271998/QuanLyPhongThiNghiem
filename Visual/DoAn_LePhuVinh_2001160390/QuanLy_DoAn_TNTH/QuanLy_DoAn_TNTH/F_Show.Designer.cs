namespace QuanLy_DoAn_TNTH
{
    partial class F_Show
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

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.btnPhong = new System.Windows.Forms.Button();
            this.btnHC = new System.Windows.Forms.Button();
            this.btnDC = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(12, 62);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(776, 376);
            this.dataGridView1.TabIndex = 0;
            // 
            // btnPhong
            // 
            this.btnPhong.Location = new System.Drawing.Point(12, 33);
            this.btnPhong.Name = "btnPhong";
            this.btnPhong.Size = new System.Drawing.Size(122, 23);
            this.btnPhong.TabIndex = 1;
            this.btnPhong.Text = "Phòng thí nghiệm";
            this.btnPhong.UseVisualStyleBackColor = true;
            this.btnPhong.Click += new System.EventHandler(this.btnPhong_Click);
            // 
            // btnHC
            // 
            this.btnHC.Location = new System.Drawing.Point(140, 33);
            this.btnHC.Name = "btnHC";
            this.btnHC.Size = new System.Drawing.Size(75, 23);
            this.btnHC.TabIndex = 2;
            this.btnHC.Text = "Hóa chất";
            this.btnHC.UseVisualStyleBackColor = true;
            this.btnHC.Click += new System.EventHandler(this.btnHC_Click);
            // 
            // btnDC
            // 
            this.btnDC.Location = new System.Drawing.Point(221, 33);
            this.btnDC.Name = "btnDC";
            this.btnDC.Size = new System.Drawing.Size(75, 23);
            this.btnDC.TabIndex = 3;
            this.btnDC.Text = "Dụng cụ";
            this.btnDC.UseVisualStyleBackColor = true;
            this.btnDC.Click += new System.EventHandler(this.btnDC_Click);
            // 
            // F_Show
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnDC);
            this.Controls.Add(this.btnHC);
            this.Controls.Add(this.btnPhong);
            this.Controls.Add(this.dataGridView1);
            this.Name = "F_Show";
            this.Text = "F_Show";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.F_Show_FormClosed);
            this.Load += new System.EventHandler(this.F_Show_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Button btnPhong;
        private System.Windows.Forms.Button btnHC;
        private System.Windows.Forms.Button btnDC;
    }
}