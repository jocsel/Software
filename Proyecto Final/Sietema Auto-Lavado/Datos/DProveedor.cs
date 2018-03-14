using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidad;
using System.Data.SqlClient;
using System.Data;

namespace Datos
{
   public class DProveedor
    {
        public List<EProveedor> obtenerlistaProveedor()
        {
            try
            {
                SqlConnection conexion = new SqlConnection(Properties.Settings.Default.cnnString);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_proveedor";
                cmd.Parameters.Add("@i_operacion", SqlDbType.VarChar, 1).Value = "S";
                cmd.Connection = conexion;
                conexion.Open();
                SqlDataReader leer = cmd.ExecuteReader();
                List<EProveedor> listaProveedor = new List<EProveedor>();
                while (leer.Read())
                {
                    EProveedor datosproveedor = new EProveedor();

                    datosproveedor.idProveedor = leer.GetInt32(0);

                    if (leer.IsDBNull(1))
                        datosproveedor.nombres = null;
                    else
                        datosproveedor.nombres = leer.GetString(1);
                    if (leer.IsDBNull(2))
                        datosproveedor.apellidos = null;
                    else
                        datosproveedor.apellidos = leer.GetString(2);
                    if (leer.IsDBNull(3))
                        datosproveedor.cedula = null;
                    else
                        datosproveedor.cedula = leer.GetString(3);
                    if (leer.IsDBNull(4))
                        datosproveedor.telefono = null;
                    else
                        datosproveedor.telefono = leer.GetInt32(4);

                    if (leer.IsDBNull(5))
                        datosproveedor.correo = null;
                    else
                        datosproveedor.correo = leer.GetString(5);

                    if (leer.IsDBNull(6))
                        datosproveedor.direccion = null;
                    else
                        datosproveedor.direccion = leer.GetString(6);
                    if (leer.IsDBNull(7))
                        datosproveedor.estado = null;
                    else
                        datosproveedor.estado = leer.GetString(7);
                
                }
                return listaProveedor;
            }
            catch (Exception ex)
            {
                throw ex;
            }

              
        }



    }
}
