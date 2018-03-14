using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Negocio;
using Entidad;

namespace Presentacion
{
    public partial class frmProveedor : Form
    {
        List<EProveedor> ListaProveedor;
        public frmProveedor()
        {
            InitializeComponent();
            Deshabilitar();
        }

        public  void ActualizarProveedor()
        {
            NProveedor gestionarProveedor = new NProveedor();
            ListaProveedor = gestionarProveedor.ObtenerListaProveedor();
                 
        }

        private void Deshabilitar()
        {
            txtnombre.Enabled = false;
            txtapellido.Enabled = false;
            txtcorreo.Enabled = false;
            txtdireccion.Enabled = false;
            txttelefono.Enabled = false;
            cmbestado.Enabled = false;
            txtcedula.Enabled = false;
        }

        private void Habilitar()
        {
            txtnombre.Enabled = true;
            txtapellido.Enabled = true;
            txtcorreo.Enabled = true;
            txtdireccion.Enabled = true;
            txttelefono.Enabled = true;
            cmbestado.Enabled = true;
            txtcedula.Enabled = true;
        }

        private void Limpiar()
        {

            txtnombre.Text = "";
            txtapellido.Text = "";
            txtcorreo.Text = "";
            txtdireccion.Text = "";
            txttelefono.Text = "";
            cmbestado.Text = "";
            txtcedula.Text = "";
        }

        private void frmProveedor_Load(object sender, EventArgs e)
        {
            dgvProveedor.AutoResizeColumns();
            dgvProveedor.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
            dgvProveedor.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;
            try
            {
                ActualizarProveedor();
                dgvProveedor.DataSource = ListaProveedor;
              
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }



    }
}
