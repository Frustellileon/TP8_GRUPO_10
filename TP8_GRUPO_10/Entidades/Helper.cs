using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public static class Helper
    {
        public static bool txtRellenado(string texto)
        {
            if (!string.IsNullOrWhiteSpace(texto))
            {
                return true;
            }

            return false;
        }
    }
}
