import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:http/http.dart' as http;
import 'package:ygoprodeck/model/carta_model.dart';

class CartaService{
  
   String? urlApi;
   
   CartaService(){
        urlApi=DotEnv.dotenv.get("API_YUGUIO");
   }
  
  Future<CardResponse>consultarArquetipos()async{
    
    CardResponse? cardResponse;
    
    String url1="${urlApi}/v7/archetypes.php";
    
      try{
        
        var url=Uri.parse(url1);
        final response=await http.get(url, headers:{
        'Content-Type':'application/json',
        });
        
        cardResponse=cardResponseFromJson(utf8.decode(response.bodyBytes));
        
      }catch(ex){
         throw ExceptionControlada(ex.toString());
      }
      
      return cardResponse;
  }

}
 

 class ExceptionControlada implements Exception{
  final String mensaje;
  ExceptionControlada(this.mensaje);
 }