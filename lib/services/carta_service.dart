import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:http/http.dart' as http;
import 'package:ygoprodeck/model/arquitepo_model.dart';
import 'package:ygoprodeck/model/carta_model.dart';

class CartaService{
  
   String? urlApi;
   
   CartaService(){
        urlApi=DotEnv.dotenv.get("API_YUGUIO");
   }
  
  Future<List<ArquitepoDto>>consultarArquetipos()async{
    
    List<ArquitepoDto>arquiteposDTO;
    
    String url1="${urlApi}/v7/archetypes.php";
      
      try{
        
        var url=Uri.parse(url1);
        final response=await http.get(url, headers:{
        'Content-Type':'application/json',
        });
        
        arquiteposDTO=arquitepoDtoFromJson(utf8.decode(response.bodyBytes));
        

        
      }catch(ex){
         throw ExceptionControlada(ex.toString());
      }
      
      return arquiteposDTO;
  }
  
  
  Future<CardResponse>consultarCartas({required String arquitepo})async{
    
    CardResponse? cartaResponse;
    
    String url1="${urlApi}/v7/cardinfo.php?archetype=${arquitepo}";
      
      try{
        
        var url=Uri.parse(url1);
        final response=await http.get(url, headers:{
        'Content-Type':'application/json',
        });
        cartaResponse=cardResponseFromJson(utf8.decode(response.bodyBytes));
        

        
      }catch(ex){
         throw ExceptionControlada(ex.toString());
      }
      
      return cartaResponse;
  }
    
    Future<CardResponse>consultarCartasLimitadas({required String banlist})async{
    
    CardResponse? cartaResponse;

    String url1="${urlApi}/v7/cardinfo.php?banlist=${banlist}";
      
      try{
        
        var url=Uri.parse(url1);
        final response=await http.get(url, headers:{
        'Content-Type':'application/json',
        });
        print("cartas limitadas");
        cartaResponse=cardResponseFromJson(utf8.decode(response.bodyBytes));
        

        
      }catch(ex){
         throw ExceptionControlada(ex.toString());
      }
      
      return cartaResponse;
  }







}
 

 class ExceptionControlada implements Exception{
  final String mensaje;
  ExceptionControlada(this.mensaje);
 }