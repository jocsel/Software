using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Entidad;
using Negocio;

namespace Presentacion
{
    public partial class frmLogin : Form
    {
        public frmLogin()
        {
            InitializeComponent();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void frmLogin_Load(object sender, EventArgs e)
        {

        }

        private void btnAceptar_Click(object sender, EventArgs e)
        {
            try {
                Negocio.Nusuario gestion = new Negocio.Nusuario();
                Entidad.EUsuario usuario = gestion.login(txtUsuario.Text, txtContraseña.Text);
                if (usuario.Empleado.nombres != null) {
                    Global.usuarioSesion = usuario;
                    DialogResult = DialogResult.OK;
                }
                else {
                    MessageBox.Show("Usuario incorrecto");
                }
            }
            catch (Exception ex) {
                MessageBox.Show(ex.Message,"Error",MessageBoxButtons.OK,MessageBoxIcon.Error);
            }
        }
    }
}
