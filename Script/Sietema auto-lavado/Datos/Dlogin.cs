using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidad;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class Dlogin
    {
        public Entidad.EUsuario login(string usuario, string password)
        {
            try {

                SqlConnection conex = new SqlConnection(Properties.Settings.Default.cnnString);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "DBAutoLavado..sp_validarUsuario";
               /* cmd.CommandText = "select empleado.nombres, Usuario.Password \n"
               + "permiso.usuario,permiso.venta, permiso.mantenimiento, permiso.lavado \n"
               + "permiso.compra, permiso.empleado,permiso.Tusuario,permiso.producto,permiso.proveedor \n"
               + " from empleado inner join usuario on empleado.cedula = usuario.cedula inner join \n"
               + "permiso on usuario.usuario = permiso.usuario " +
               "where Usuario.usuario = @i_usuario and Usuario.Password = @i_password";*/

                cmd.Parameters.AddWithValue("@usuario", usuario);
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Connection = conex;
                conex.Open();
                SqlDataReader leer = cmd.ExecuteReader();
                EUsuario validarUsuario = new EUsuario();
                while (leer.Read())
                {
                    validarUsuario.Empleado.nombres = leer.GetString(0);
                    validarUsuario.Permiso.usuario = leer.GetString(2);
                    validarUsuario.Permiso.venta = leer.GetBoolean(3);
                    validarUsuario.Permiso.mantenimiento = leer.GetBoolean(4);
                    validarUsuario.Permiso.lavado = leer.GetBoolean(5);
                    validarUsuario.Permiso.compra = leer.GetBoolean(6);
                    validarUsuario.Permiso.empleado = leer.GetBoolean(7);
                    validarUsuario.Permiso.Tusuario = leer.GetBoolean(8);
                    validarUsuario.Permiso.producto = leer.GetBoolean(9);
                    validarUsuario.Permiso.proveedor = leer.GetBoolean(10);
                }
                return validarUsuario;
            }
            catch (Exception ex) {
                throw ex;
            }
        }
    }
}
