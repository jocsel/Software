using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidad
{
    public class EUsuario
    {
        public string usuario { get; set; }
        public string password{ get; set; }
        public string cedula{ get; set; }
        public EPermiso Permiso { get; set; }
        public EEmpleado Empleado { get; set; }

        public EUsuario()
        {
            Permiso = new EPermiso();
            Empleado = new EEmpleado();
        }
    }
}
