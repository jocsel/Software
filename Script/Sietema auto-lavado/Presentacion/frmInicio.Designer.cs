namespace Presentacion
{
    partial class frmInicio
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
            this.lblUsuario = new System.Windows.Forms.Label();
            this.lblVenta = new System.Windows.Forms.Label();
            this.lblMantenimiento = new System.Windows.Forms.Label();
            this.lblLavado = new System.Windows.Forms.Label();
            this.lblCompra = new System.Windows.Forms.Label();
            this.lblEmpleado = new System.Windows.Forms.Label();
            this.lblTusuario = new System.Windows.Forms.Label();
            this.lblProducto = new System.Windows.Forms.Label();
            this.lblProveedor = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // lblUsuario
            // 
            this.lblUsuario.AutoSize = true;
            this.lblUsuario.Location = new System.Drawing.Point(541, 277);
            this.lblUsuario.Name = "lblUsuario";
            this.lblUsuario.Size = new System.Drawing.Size(43, 13);
            this.lblUsuario.TabIndex = 0;
            this.lblUsuario.Text = "Usuario";
            // 
            // lblVenta
            // 
            this.lblVenta.AutoSize = true;
            this.lblVenta.Location = new System.Drawing.Point(83, 68);
            this.lblVenta.Name = "lblVenta";
            this.lblVenta.Size = new System.Drawing.Size(35, 13);
            this.lblVenta.TabIndex = 1;
            this.lblVenta.Text = "Venta";
            this.lblVenta.Click += new System.EventHandler(this.lblVenta_Click);
            // 
            // lblMantenimiento
            // 
            this.lblMantenimiento.AutoSize = true;
            this.lblMantenimiento.Location = new System.Drawing.Point(83, 127);
            this.lblMantenimiento.Name = "lblMantenimiento";
            this.lblMantenimiento.Size = new System.Drawing.Size(76, 13);
            this.lblMantenimiento.TabIndex = 2;
            this.lblMantenimiento.Text = "Mantenimiento";
            this.lblMantenimiento.Click += new System.EventHandler(this.lblMantenimiento_Click);
            // 
            // lblLavado
            // 
            this.lblLavado.AutoSize = true;
            this.lblLavado.Location = new System.Drawing.Point(83, 187);
            this.lblLavado.Name = "lblLavado";
            this.lblLavado.Size = new System.Drawing.Size(43, 13);
            this.lblLavado.TabIndex = 3;
            this.lblLavado.Text = "Lavado";
            this.lblLavado.Click += new System.EventHandler(this.lblLavado_Click);
            // 
            // lblCompra
            // 
            this.lblCompra.AutoSize = true;
            this.lblCompra.Location = new System.Drawing.Point(83, 243);
            this.lblCompra.Name = "lblCompra";
            this.lblCompra.Size = new System.Drawing.Size(43, 13);
            this.lblCompra.TabIndex = 4;
            this.lblCompra.Text = "Compra";
            this.lblCompra.Click += new System.EventHandler(this.lblCompra_Click);
            // 
            // lblEmpleado
            // 
            this.lblEmpleado.AutoSize = true;
            this.lblEmpleado.Location = new System.Drawing.Point(196, 243);
            this.lblEmpleado.Name = "lblEmpleado";
            this.lblEmpleado.Size = new System.Drawing.Size(54, 13);
            this.lblEmpleado.TabIndex = 5;
            this.lblEmpleado.Text = "Empleado";
            this.lblEmpleado.Click += new System.EventHandler(this.lblEmpleado_Click);
            // 
            // lblTusuario
            // 
            this.lblTusuario.AutoSize = true;
            this.lblTusuario.Location = new System.Drawing.Point(196, 68);
            this.lblTusuario.Name = "lblTusuario";
            this.lblTusuario.Size = new System.Drawing.Size(43, 13);
            this.lblTusuario.TabIndex = 6;
            this.lblTusuario.Text = "Usuario";
            this.lblTusuario.Click += new System.EventHandler(this.lblTusuario_Click);
            // 
            // lblProducto
            // 
            this.lblProducto.AutoSize = true;
            this.lblProducto.Location = new System.Drawing.Point(196, 127);
            this.lblProducto.Name = "lblProducto";
            this.lblProducto.Size = new System.Drawing.Size(50, 13);
            this.lblProducto.TabIndex = 7;
            this.lblProducto.Text = "Producto";
            this.lblProducto.Click += new System.EventHandler(this.lblProducto_Click);
            // 
            // lblProveedor
            // 
            this.lblProveedor.AutoSize = true;
            this.lblProveedor.Location = new System.Drawing.Point(196, 187);
            this.lblProveedor.Name = "lblProveedor";
            this.lblProveedor.Size = new System.Drawing.Size(56, 13);
            this.lblProveedor.TabIndex = 8;
            this.lblProveedor.Text = "Proveedor";
            this.lblProveedor.Click += new System.EventHandler(this.lblProveedor_Click);
            // 
            // frmInicio
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(678, 476);
            this.Controls.Add(this.lblProveedor);
            this.Controls.Add(this.lblProducto);
            this.Controls.Add(this.lblTusuario);
            this.Controls.Add(this.lblEmpleado);
            this.Controls.Add(this.lblCompra);
            this.Controls.Add(this.lblLavado);
            this.Controls.Add(this.lblMantenimiento);
            this.Controls.Add(this.lblVenta);
            this.Controls.Add(this.lblUsuario);
            this.Name = "frmInicio";
            this.Text = "frmInicio";
            this.Load += new System.EventHandler(this.frmInicio_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblUsuario;
        private System.Windows.Forms.Label lblVenta;
        private System.Windows.Forms.Label lblMantenimiento;
        private System.Windows.Forms.Label lblLavado;
        private System.Windows.Forms.Label lblCompra;
        private System.Windows.Forms.Label lblEmpleado;
        private System.Windows.Forms.Label lblTusuario;
        private System.Windows.Forms.Label lblProducto;
        private System.Windows.Forms.Label lblProveedor;
    }
}