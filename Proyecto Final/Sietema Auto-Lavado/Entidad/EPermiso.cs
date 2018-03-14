using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidad
{
    public class EPermiso
    {
        public string usuario{ get; set; }
        public bool venta{ get; set; }
        public bool mantenimiento{ get; set; }
        public bool lavado{ get; set; }
        public bool compra{ get; set; }
        public bool empleado { get; set; }
        public bool Tusuario{ get; set; }
        public bool producto{ get; set; }
        public bool proveedor{ get; set; }
    }
}
