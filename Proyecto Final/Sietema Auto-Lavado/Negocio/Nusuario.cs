using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using Entidad;
using System.Data;

namespace Negocio
{
    public class Nusuario
    {
        public Entidad.EUsuario login(string usuario, string password)
        {
            try {
                Datos.Dlogin logear = new Datos.Dlogin();
                return logear.login(usuario, password);
            }
            catch (Exception ex) {
                throw ex;
            }
        }
        public List<EUsuario> SelectRow()
        {
            try
            {
                Dusuario listaUsuario = new Dusuario();
                return listaUsuario.SelectRow();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void InsertRow(EUsuario Iusuario)
        {
            try
            {
                if (Iusuario.usuario.Length == 0)
                    throw new ArgumentException("Ingrese el Nombre del usuario");
                if (Iusuario.password.Length == 0)
                    throw new ArgumentException("Ingrese la contraseña");
                if (Iusuario.cedula.Length == 0)
                    throw new ArgumentException("Ingrese la cedula");
                Dusuario gestioUsuario = new Dusuario();
                gestioUsuario.InsertRow(Iusuario);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void UpdateRow(EUsuario Uusuario)
        {
            try
            {
                if (Uusuario.usuario.Length == 0)
                    throw new ArgumentException("Ingrese el Nombre del usuario");
                if (Uusuario.password.Length == 0)
                    throw new ArgumentException("Ingrese la contraseña");
                if (Uusuario.cedula.Length == 0)
                    throw new ArgumentException("Ingrese la cedula");
                Dusuario gestioUsuario = new Dusuario();
                gestioUsuario.UpdateRow(Uusuario);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
