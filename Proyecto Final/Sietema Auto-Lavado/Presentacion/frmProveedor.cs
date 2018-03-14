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
        bool modificar;
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
         
            try
            {
                NProveedor listaPro = new NProveedor();
                ListaProveedor = listaPro.ObtenerListaProveedor();

                var lista = (from pro in ListaProveedor
                             select new
                             {
                                Nombres = pro.nombres,
                                Apellidos = pro.apellidos,
                                Cedula = pro.cedula,
                                Telefono = pro.telefono,
                                 Correo = pro.correo,
                                Direccion = pro.direccion,
                                Estado = pro.estado,
                                 pro.idProveedor
                             }).ToList();
                dgvProveedor.DataSource = lista;
                dgvProveedor.Columns["idProveedor"].Visible = false;
            
                ActualizarProveedor();
                
              
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }

        private void btnnuevo_Click(object sender, EventArgs e)
        {
            Limpiar();
            Habilitar();
            txtnombre.Focus();
            btncancelar.Enabled = true;
            btnguardar.Enabled = true;
            btnmodificar.Enabled = false;          
            btnnuevo.Enabled = false;
        }

        private void btnmodificar_Click(object sender, EventArgs e)
        {
            Habilitar();
            btncancelar.Enabled = true;
            btnguardar.Enabled = true;
            btnmodificar.Enabled = false;
            btnnuevo.Enabled = false;           
            modificar = true;
        }

        private void btnguardar_Click(object sender, EventArgs e)
        {
            try
            {
                if (modificar)
                {
                    EProveedor modProveedor = new EProveedor();
                    modProveedor.idProveedor = Convert.ToInt32(txtnombre.Tag.ToString());
                    modProveedor.nombres = txtnombre.Text;
                    modProveedor.apellidos = txtapellido.Text;
                    modProveedor.cedula = txtcedula.Text;
                    modProveedor.telefono =Convert.ToInt32(txttelefono.Text);
                    modProveedor.correo = txtcorreo.Text;
                    modProveedor.direccion = txtdireccion.Text;
                    modProveedor.estado = cmbestado.Text;

                    NProveedor gestionarProveedor = new NProveedor();
                    gestionarProveedor.Modificar(modProveedor);

                    MessageBox.Show("Se modifico correctamente", "Proveedor", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    EProveedor NuevoProveedor = new EProveedor();
                    NuevoProveedor.nombres = txtnombre.Text;
                    NuevoProveedor.apellidos = txtapellido.Text;
                    NuevoProveedor.cedula = txtcedula.Text;
                    NuevoProveedor.telefono = Convert.ToInt32(txttelefono.Text);
                    NuevoProveedor.correo = txtcorreo.Text;
                    NuevoProveedor.direccion = txtdireccion.Text;
                    NuevoProveedor.estado = cmbestado.Text;


                    NProveedor gestionarProveedor = new NProveedor();
                    gestionarProveedor.Agregar(NuevoProveedor);

                    MessageBox.Show("Se guardo correctamente", "Proveedor", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                ActualizarProveedor();
                dgvProveedor.DataSource = ListaProveedor;
                Limpiar();
                Deshabilitar();
                btncancelar.Enabled = false;               
                btnguardar.Enabled = false;
                btnmodificar.Enabled = false;
                btnnuevo.Enabled = true;
                modificar = false;

            }
            catch (Exception ex)
            {
                
                 MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }



        }

        private void dgvProveedor_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex>=0)
            {
                 txtnombre.Tag = Convert.ToInt32(dgvProveedor.Rows[e.RowIndex].Cells["idProveedor"].Value.ToString());

                 if (dgvProveedor.Rows[e.RowIndex].Cells["nombres"].Value == null)
                     txtnombre.Text = "";
                 else
                     txtnombre.Text = dgvProveedor.Rows[e.RowIndex].Cells["nombres"].Value.ToString();
                 if (dgvProveedor.Rows[e.RowIndex].Cells["apellidos"].Value == null)
                     txtapellido.Text = "";
                 else
                     txtapellido.Text = dgvProveedor.Rows[e.RowIndex].Cells["apellidos"].Value.ToString();
                 if (dgvProveedor.Rows[e.RowIndex].Cells["cedula"].Value == null)
                     txtcedula.Text = "";
                 else
                     txtcedula.Text = dgvProveedor.Rows[e.RowIndex].Cells["cedula"].Value.ToString();

                 if (dgvProveedor.Rows[e.RowIndex].Cells["telefono"].Value == null)
                     txttelefono.Text = "";
                 else
                     txttelefono.Text = dgvProveedor.Rows[e.RowIndex].Cells["telefono"].Value.ToString();
                 if (dgvProveedor.Rows[e.RowIndex].Cells["correo"].Value == null)
                     txtcorreo.Text = "";
                 else
                     txtcorreo.Text = dgvProveedor.Rows[e.RowIndex].Cells["correo"].Value.ToString();
                 if (dgvProveedor.Rows[e.RowIndex].Cells["direccion"].Value == null)
                     txtdireccion.Text = "";
                 else
                     txtdireccion.Text = dgvProveedor.Rows[e.RowIndex].Cells["direccion"].Value.ToString();
                 if (dgvProveedor.Rows[e.RowIndex].Cells["estado"].Value == null)
                     cmbestado.Text = "";
                 else
                     cmbestado.Text = dgvProveedor.Rows[e.RowIndex].Cells["estado"].Value.ToString();


                 btnmodificar.Enabled = true;                
                 btncancelar.Enabled = false;
                 btnguardar.Enabled = false;


            }
        }

        public void filtrar()
        {
            

            if (rbnombre.Checked)
            {
                var resultado = (
               from Proveedor in ListaProveedor
               where Proveedor.nombres.ToUpper().StartsWith(textBox1.Text.ToUpper())
               select Proveedor 
               ).ToList();
                dgvProveedor.DataSource = resultado;

            }
            if (rbncedula.Checked)
            {
                var resultado = (
               from Proveedor in ListaProveedor
               where Proveedor.cedula.ToUpper().StartsWith(textBox1.Text.ToUpper())
               select Proveedor
               ).ToList();
                dgvProveedor.DataSource = resultado;

            }
            if (rbapellido.Checked)
            {
                var resultado = (
               from Proveedor in ListaProveedor
               where Proveedor.apellidos.ToUpper().StartsWith(textBox1.Text.ToUpper())
               select Proveedor
               ).ToList();
                dgvProveedor.DataSource = resultado;

            }


        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            filtrar();
        }

        private void btncancelar_Click(object sender, EventArgs e)
        {
            Limpiar();
            Deshabilitar();
            btnnuevo.Enabled = true;
            btnguardar.Enabled = false;          
            btnmodificar.Enabled = false;
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void pictureBox8_Click(object sender, EventArgs e)
        {
            this.Close();
        }





    }
}
