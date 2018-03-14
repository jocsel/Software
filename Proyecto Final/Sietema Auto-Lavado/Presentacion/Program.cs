using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Presentacion
{
    static class Program
    {
        /// <summary>
        /// Punto de entrada principal para la aplicación.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            /* Application.Run(new frmLogin());*/
            Application.Run(new frmProveedor());
           /* frmLogin login = new frmLogin();
            if (login.ShowDialog() == DialogResult.OK)
                Application.Run(new frmInicio());
            else
                Application.Exit();*/
        }
    }
}
