
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ygoprodeck/model/arquitepo_model.dart';
import 'package:ygoprodeck/model/carta_model.dart';
import 'package:ygoprodeck/services/carta_service.dart';

class CartaProvider extends ChangeNotifier{
    
    List<ArquitepoDto>listArquitepos=[];
    
    cargaInicial()async{
      
      
       cargarComboArquetipo();


    }
    

    
    cargarComboArquetipo()async{
        
        try{
          
          CartaService cartaService=CartaService();
          List<ArquitepoDto>listArquitepos=await cartaService.consultarArquetipos();
          
          print("Arquitepos response------------->");
          
          
      }catch(ex){
          
          if(ex is  ExceptionControlada){
              print("carga inicial error--->"+ex.mensaje.toString());
          }
           
      }

      
    }
    






}


