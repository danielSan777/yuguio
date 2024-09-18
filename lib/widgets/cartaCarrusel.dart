
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:ygoprodeck/providers/CartaProvider.dart';
import 'package:provider/provider.dart';

class CartaCarrusel extends StatefulWidget{
  const CartaCarrusel({super.key});

  @override
  State<CartaCarrusel> createState() => _CartaCarruselState();
}

class _CartaCarruselState extends State<CartaCarrusel>{
  
  
  @override
  Widget build(BuildContext context){
    final cartaProvider=Provider.of<CartaProvider>(context,listen:true);
    final size=MediaQuery.of(context).size;
    
    return SafeArea(
      child:Container(
         width:double.infinity,
         height:size.height*0.6,
         //color:Colors.red,
         child:Consumer<CartaProvider>(builder:(context,carta,child){
            return Swiper(itemCount:carta.listCarta.length,
         layout:SwiperLayout.STACK,
         itemWidth:size.width*0.6,
         itemHeight:size.height*0.7,
         itemBuilder:(context,index){
           
           return GestureDetector(
             onTap:(){
                
                cartaProvider.selectCarta(cardDTO:carta.listCarta[index]);
                Navigator.pushReplacementNamed(context,"DetalleCarta",arguments:"a");              
             },
             child:ClipRRect(
               borderRadius:BorderRadius.circular(20),
               child:FadeInImage(
                placeholder:AssetImage('assets/no-image.jpg'),
                image:NetworkImage(carta.listCarta[index].cardImages![0].imageUrl)),
                
             ),
           );
      
         },
         );

         })
         
         
      ),
    );
  }
  


  

}


