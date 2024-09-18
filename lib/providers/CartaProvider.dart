
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ygoprodeck/model/arquitepo_model.dart';
import 'package:ygoprodeck/model/carta_model.dart';
import 'package:ygoprodeck/services/carta_service.dart';

class CartaProvider extends ChangeNotifier{
    
    List<ArquitepoDto>listArquitepos=[];
    ArquitepoDto? selectArquetipo;
    List<CardDTO>listCarta=[];
    CardDTO? selectCartaDTO;
    
   
    cargaInicial()async{
      
      
       cargarComboArquetipo();


    }
    
    
    cargarComboArquetipo()async{
        
        try{
          
          CartaService cartaService=CartaService();
          listArquitepos=await cartaService.consultarArquetipos();
          listArquitepos.removeWhere((arquetipo)=>arquetipo.archetypeName.trim().toUpperCase()=='"C"'.toUpperCase());
          selectArquetipo=listArquitepos.singleWhere((arquitepo)=>arquitepo.archetypeName.trim().toUpperCase()=="Crystron".toUpperCase());
          cargarCartasPorArquitepos(arquitepo:selectArquetipo!.archetypeName);

          

          
          
      }catch(ex){
          
          if(ex is  ExceptionControlada){
             
          }
           
      }

      
    }
    
    
    cargarCartasPorArquitepos({required String arquitepo})async{
        
         try{
            
            CartaService cartaService=CartaService();
            CardResponse cartaResponse=await cartaService.consultarCartas(arquitepo:arquitepo);
            listCarta=cartaResponse.data;
            cargarCartasLimitadas(cartas:listCarta);
            
         }catch(ex){
             
             if(ex is  ExceptionControlada){
             }
             
         }
    }

    
    selectCarta({required CardDTO cardDTO}){
        
        selectCartaDTO=cardDTO;
        notifyListeners();
        
    }
     
     
     cargarCartasLimitadas({required List<CardDTO>cartas})async{
        
         try{
            
            List<String>banlist=["TCG","OCG","Goat"];
            CartaService cartaService=CartaService();
            List<CardDTO>cartasLimitadas=[];
            List<CardDTO>cartasUsables=[];
            for (var b in banlist){
                CardResponse cartaResponse=await cartaService.consultarCartasLimitadas(banlist:b);
                for(var carta in cartaResponse.data){
                     cartasLimitadas.add(carta);  
                }
            }

            for(var carta in cartas){
                if(!cartasLimitadas.contains(carta)){
                 cartasUsables.add(carta);
              }
            }
            
            listCarta=List.from(cartasUsables);
            notifyListeners();
            
         }catch(ex){
             
             if(ex is  ExceptionControlada){
                
             }
             
         }
    }

    





}


