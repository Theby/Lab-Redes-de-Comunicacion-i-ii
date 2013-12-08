//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package laboratorio_01_02;

// Definici�n del Host
module host
{
    //par�metros
    parameters:
        //direcci�n del host
        int direccion;
        //tama�o de trama
        int tamTrama;
        @display("bgl=10;i=device/server2;is=n;bgb=130,335");
    //Puertas de enlace
    gates:
        //puerta de entrada
        input entrada;
        //puerta de salida
        output salida;
    //Llamado a Subm�dulos        
    submodules:
        //Llamado al nivel de aplicaci�n
        varAplicacion: aplicacion {
            //par�metros del nivel
            parameters:
                tamTrama = tamTrama;
                direccion = direccion;
                @display("p=67,50");
        }
        //Llamado al nivel intermedio
        varIntermedio: intermedio {
            //par�metros del nivel
            parameters:
                @display("p=67,158");
        }
        //Llamado al nivel de enlace
        varEnlace: enlace {
            //par�metros del nivel
            parameters:
                tamTrama = tamTrama;
                direccion = direccion;
                @display("p=67,266");
        }
    connections:
        //Desde aplicacion hacia intermedio
        varAplicacion.hacia_abajo --> { } --> varIntermedio.desde_arriba;
        //Desde intermedio a aplicaci�n
        varIntermedio.hacia_arriba --> { } --> varAplicacion.desde_abajo;
        //Desde intermedio a enlace
        varIntermedio.hacia_abajo --> { } --> varEnlace.desde_arriba;
        //Desde enlace a intermedio
        varEnlace.hacia_arriba --> { } --> varIntermedio.desde_abajo;
        //Desde enlace a la salida del host
        varEnlace.hacia_fisico --> { } --> salida;
        //Desde la salida del host hacia enlace
        entrada --> { } --> varEnlace.desde_fisico;
}