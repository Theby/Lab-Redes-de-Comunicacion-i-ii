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

//
// Definici�n del m�dulo
//
module sistema
{
    //Par�metros
    parameters:
        volatile int tamTrama;

        @display("i=device/lan;is=n");
    //Subm�dulos que lo componen
    submodules:
        //Definici�n del host 1
        Host_1: host {
            //Par�metros
            parameters:
                tamTrama = tamTrama;
                //Se suministra la direcci�n que le corresponde al host
                direccion = 1;
                @display("p=70,50");
        }
        //Definici�n del host 2
        Host_2: host {
            //Par�metros
            parameters:
                tamTrama = tamTrama;
                //Se suministra la direcci�n que le corresponde al host
                direccion = 2;
                @display("p=170,50");
        }
    //Conexiones de la red
    connections:
        //Desde el Host 1 hacia el Host 2
        Host_1.salida --> canal --> Host_2.entrada;
        //Desde el Host 2 hacia el Host 1
        Host_2.salida --> canal --> Host_1.entrada;
}

//Definici�n del canal de transmisi�n
channel canal extends ned.DatarateChannel
{
    //Retardo de propagaci�n
    delay = 100ms;
    //Velocidad de datos
    datarate = 128000bps;
}

//Instanciaci�n de la red
network red extends sistema
{
    //Par�metros
    parameters:
        tamTrama @prompt("Ingrese el largo de la palabra, entero mayor a cero:") = default(4);
}