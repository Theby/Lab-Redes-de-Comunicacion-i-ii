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

simple enlace
{
    //Par�metros del nivel de Enlace
    parameters:
        //Direcci�n de destino
        int direccion;
        //Tama�o de trama
        int tamTrama;
        //Conexiones
        @display("i=block/ifcard;is=n");
    gates:
        //Con el nivel inferior
        input desde_fisico;
        output hacia_fisico;

        //con el nivel superior
        input desde_arriba;
        output hacia_arriba;
}