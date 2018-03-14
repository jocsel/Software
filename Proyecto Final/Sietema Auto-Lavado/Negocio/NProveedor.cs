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

        public void Modificar(EProveedor ModificarProveedor)
        {
            try
            {
                if (ModificarProveedor.nombres.Length == 0)
                    throw new ArgumentException("Ingresa los nombres del Proveedor");
                if (ModificarProveedor.apellidos.Length == 0)
                    throw new ArgumentException("Ingresa los apellidos del Proveedor");
                if (ModificarProveedor.cedula.Length == 0)
                    throw new ArgumentException("Ingresa la cedula del Proveedor");
                //no estoy seguro de este codigo .value
                if (ModificarProveedor.telefono.Value == null)
                    throw new ArgumentException("Ingresa el numero  telefonico del Proveedor");
                if (ModificarProveedor.correo.Length == 0)
                    throw new ArgumentException("Ingresa el correo del Proveedor");
                if (ModificarProveedor.direccion.Length == 0)
                    throw new ArgumentException("Ingresa la direccion del Proveedor");
                if (ModificarProveedor.estado.Length == 0)
                    throw new ArgumentException("Ingresa el estado del Proveedor");

                DProveedor gestionaProveedor = new DProveedor();
                gestionaProveedor.Modificar(ModificarProveedor);

            }
            catch (Exception ex)
            {
                
                throw ex;
            }


        }

        public void Agregar(EProveedor AgregarProveedor)
        {
            try
            {
                if (AgregarProveedor.nombres.Length == 0)
                    throw new ArgumentException("Ingresa los nombres del Proveedor");
                if (AgregarProveedor.apellidos.Length == 0)
                    throw new ArgumentException("Ingresa los apellidos del Proveedor");
                if (AgregarProveedor.cedula.Length == 0)
                    throw new ArgumentException("Ingresa la cedula del Proveedor");
                //no estoy seguro de este codigo .value
                if (AgregarProveedor.telefono.Value == null)
                    throw new ArgumentException("Ingresa el numero  telefonico del Proveedor");
                if (AgregarProveedor.correo.Length == 0)
                    throw new ArgumentException("Ingresa el correo del Proveedor");
                if (AgregarProveedor.direccion.Length == 0)
                    throw new ArgumentException("Ingresa la direccion del Proveedor");
                if (AgregarProveedor.estado.Length == 0)
                    throw new ArgumentException("Ingresa el estado del Proveedor");

                DProveedor gestionaProveedor = new DProveedor();
                gestionaProveedor.Agregar(AgregarProveedor);
            }
            catch (Exception ex)
            {
                
                throw ex;
            }
        }

    }
}
