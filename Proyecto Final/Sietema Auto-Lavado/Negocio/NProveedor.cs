using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using Entidad;


namespace Negocio
{
    public class NProveedor
    {
        public List<EProveedor> ObtenerListaProveedor()
        {
            try
            {
                DProveedor datosProveedor = new DProveedor();
                return datosProveedor.obtenerlistaProveedor();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
