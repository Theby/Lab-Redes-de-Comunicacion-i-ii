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

simple aplicacion
{
    //Parámetros de la aplicación
    parameters:
        //Tamaño de la trama
        int tamTrama;

        //Dirección de Destino
        int direccion_dest;

        //Dirección de Destino
        int direccion_host;

        //número de tramas que envia
        int numTramas_env;
        
        //número de tramas que recibe
        int numTramas_rec;
        
        //número de tramas enviadas
        int contTramas_env = default(0);
        
        //número de tramas recibidas
        int contTramas_rec = default(0);

        //Define cual host(0 o 1) comienza la comunicación
        int starter;
        
        //Para saber el estado del nivel de aplicacion
        volatile string estado = default("NONE");
        
        //Para saber si esta conectado o no
        volatile bool conectado = default(false);

        @display("i=block/cogwheel,black;is=n");

    gates:
        //Recepción de datos desde abajo
        input desde_abajo;
        //Envío de datos desde abajo
        output hacia_abajo;

}
