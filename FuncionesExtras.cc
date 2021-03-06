/* * FuncionesExtras.cc
 *
 *  Created on: 10-12-2013
 *      Author: Esteban Gaete
 */

#include "FuncionesExtras.h"

#include <vector>
#include <math.h>
#include <string.h>
#include <cstdlib>
#include <iostream>
 #include <stdio.h>

using namespace std;

int FuncionesExtras::getValorId(const char* input_complete_name){
    string nombre_completo = input_complete_name;

    //Para guardar el tamaño del resto del mensaje
    int rest_tam_msg=0;

    for(int i=0;nombre_completo[i]!= ',';i++){
        rest_tam_msg++;
    }
    rest_tam_msg++;

    string nombre;
    if(nombre_completo[0] == 'A' || nombre_completo[0] == 'D'){
        //Obtiene el ID y lo guarda en "nombre"
        for(unsigned int i=rest_tam_msg;i<nombre_completo.length();i++){
            nombre.push_back(nombre_completo[i]);
        }
    }else{
        for(unsigned int i=rest_tam_msg;nombre_completo[i]!=',';i++){
            //nombre[i-rest_tam_msg] = nombre_completo[i];
            nombre.push_back(nombre_completo[i]);
        }
    }

    //Lo transforma a entero
    return atoi(nombre.c_str());
}

int FuncionesExtras::getValorPF(const char* input_complete_name){
    string nombre_completo = input_complete_name;

    //Para guardar el tamaño del resto del mensaje
    int rest_tam_msg=0;

    int contador;
    for(contador=0;nombre_completo[contador]!= ',';contador++){
        rest_tam_msg++;
    }
    rest_tam_msg++;
    contador++;

    //lee hasta la siguiente coma
    for(int i=contador;nombre_completo[i]!= ',';i++){
        rest_tam_msg++;
    }
    rest_tam_msg++;

    string nombre;
    if(nombre_completo[0] == 'A' || nombre_completo[0] == 'D'){
        //Obtiene el ID y lo guarda en "nombre"
        for(unsigned int i=rest_tam_msg;i<nombre_completo.length();i++){
            nombre.push_back(nombre_completo[i]);
        }
    }else{
        for(unsigned int i=rest_tam_msg;nombre_completo[i]!=',';i++){
            nombre.push_back(nombre_completo[i]);
        }
    }

    //Lo transforma a entero
    return atoi(nombre.c_str());
}

const char* FuncionesExtras::getNombreTrama(const char* input_complete_name){
    string nombre_original = input_complete_name;
    string nombre;

    for(int i=0;nombre_original[i]!=',';i++){
        nombre.push_back(nombre_original[i]);
    }

    return nombre.c_str();
}

const char* FuncionesExtras::nombrandoTrama(const char* input_original_name,const char* input_new_name){
    string nombre_original = input_original_name;
    string nuevo_nombre = input_new_name;

    //ID del mensaje obtenido del nombre_original
    int msg_id;

    //Obtiene el valor del id
    msg_id = getValorId(nombre_original.c_str());

    string name_msg_id;

    name_msg_id = intToString(msg_id);

    //Para el nuevo nombre
    string buffer;
    buffer = nuevo_nombre + name_msg_id;

    //retorna el nuevo nombre con el ID
    return buffer.c_str();
}

const char* FuncionesExtras::nombrando(const char* input_original_name, int valor){
    string nombre_original = input_original_name;
    string nombre_valor;

    nombre_valor = intToString(valor);

    //Para el nombre de la trama
    string buffer;
    buffer = nombre_original + nombre_valor;

    return buffer.c_str();
}

const char* FuncionesExtras::nombrando(const char* input_original_name, char coma, int valor){
    string nombre_original = input_original_name;
    string nombre_valor;
    string separador;
    separador.push_back(coma);

    nombre_valor = intToString(valor);

    //Para el nombre de la trama
    string buffer;
    buffer = nombre_original + coma + nombre_valor;

    return buffer.c_str();
}

const char* FuncionesExtras::intToString(int numero){
    //String con el numero invertido
    string inv_numero;

    //Numero real
    string real_numero;

    if(numero !=0 ){
        //caracter auxiliar para calcular cada digito
        char digito;
        for(int i=0;numero!=0;i++){
            digito = (numero%10) + 48;
            inv_numero.push_back(digito);
            numero /= 10;
        }

        int index = inv_numero.length()-1;
        for(unsigned int i=0;i<inv_numero.length();i++){
            real_numero.push_back(inv_numero[index-i]);
        }

    }else{
        real_numero.push_back(48);
    }

    return real_numero.c_str();
}

int* FuncionesExtras::intToBitArray(int numero, int tamano){
    int* bitArray;
    bitArray = (int*)malloc(sizeof(int)*tamano);

    if(numero != 0){
        vector<int> numero_binario;

        //Transforma numero a un número binario
        for(int i=0;numero>0;i++){
            numero_binario.push_back(numero%2);
            numero /= 2;
        }

        int offset = tamano - numero_binario.size();

        for(int i=0;i < offset;i++){
            bitArray[i] = 0;
        }
        cout << "---" << endl;
        for(int i=offset;i < tamano;i++){
            bitArray[i] = numero_binario.back();
            numero_binario.pop_back();
            cout << bitArray[i] << endl;
        }
        cout << "---" << endl;
    }else{
        for(int i=0;i<tamano;i++){
            bitArray[i] = 0;    
        }        
    }

    return bitArray;
}

int* FuncionesExtras::intToBitArray(int numero){
    int* bitArray;
    bitArray = (int*)malloc(sizeof(int)*8);

    for(int i=0;i<8;i++){
        bitArray[i]=0;
    }

    if(numero==1){
        bitArray[7]=1;
    }else if(numero==2){
        bitArray[6]=1;
    }else if(numero==3){
        bitArray[6]=1;
        bitArray[7]=1;
    }

    return bitArray;
}

int FuncionesExtras::tamBitArray(int numero){
    if(numero != 0){
        int tam=1;

        //Calcula el tamaño que tendrá el array
        for(tam=0;numero>1;tam++){
            numero /= 2;
        }

        return tam;
    }else{
        return 1;
    }
}

int FuncionesExtras::bitArrayToInt(int* numero_binario, int size){
    int numero=0;
    std::vector<int> vector_binario; 
    int* direccion_binaria = numero_binario;

    for(int i=0;i<size;i++){
        vector_binario.push_back(direccion_binaria[i]);
    }

    for(int i=0;i<size;i++){
        numero += pow(2,i)*vector_binario.back();
        vector_binario.pop_back();
    }

    return numero;
}
