using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Presentacion
{
    public partial class frmInicio : Form
    {
        public frmInicio()
        {
            InitializeComponent();
        }

        private void frmInicio_Load(object sender, EventArgs e)
        {
            lblUsuario.Text = Global.usuarioSesion.Empleado.nombres;
            lblVenta.Enabled = Global.usuarioSesion.Permiso.venta;
            lblMantenimiento.Enabled = Global.usuarioSesion.Permiso.mantenimiento;
            lblLavado.Enabled = Global.usuarioSesion.Permiso.lavado;
            lblCompra.Enabled = Global.usuarioSesion.Permiso.compra;
            lblEmpleado.Enabled = Global.usuarioSesion.Permiso.empleado;
            lblTusuario.Enabled = Global.usuarioSesion.Permiso.Tusuario;
            lblProducto.Enabled = Global.usuarioSesion.Permiso.producto;
            lblProveedor.Enabled = Global.usuarioSesion.Permiso.proveedor;

        }

        private void lblVenta_Click(object sender, EventArgs e)
        {
            frmVenta venta = new frmVenta();
            venta.Show();
            this.Hide();
        }

        private void lblMantenimiento_Click(object sender, EventArgs e)
        {
            frmMantenimiento mantenimiento = new frmMantenimiento();
            mantenimiento.Show();
            this.Hide();
        }

        private void lblLavado_Click(object sender, EventArgs e)
        {
            frmLavado lavado = new frmLavado();
            lavado.Show();
            this.Hide();
        }

        private void lblCompra_Click(object sender, EventArgs e)
        {
            frmCompra compra = new frmCompra();
            compra.Show();
            this.Hide();
        }

        private void lblTusuario_Click(object sender, EventArgs e)
        {
            frmUsuario usuario = new frmUsuario();
            usuario.Show();
            this.Hide();
        }

        private void lblProducto_Click(object sender, EventArgs e)
        {
            frmProducto producto = new frmProducto();
            producto.Show();
            this.Hide();
        }

        private void lblProveedor_Click(object sender, EventArgs e)
        {
            frmProveedor proveedor = new frmProveedor();
            proveedor.Show();
            this.Hide();
        }

        private void lblEmpleado_Click(object sender, EventArgs e)
        {
            frmEmpleado empleado = new frmEmpleado();
            empleado.Show();
            this.Hide();
        }
    }
}
