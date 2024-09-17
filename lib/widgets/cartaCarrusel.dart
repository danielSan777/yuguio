
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:card_swiper/card_swiper.dart';

class CartaCarrusel extends StatefulWidget{
  const CartaCarrusel({super.key});

  @override
  State<CartaCarrusel> createState() => _CartaCarruselState();
}

class _CartaCarruselState extends State<CartaCarrusel>{
  
  
  @override
  Widget build(BuildContext context){
    
    final size=MediaQuery.of(context).size;
    
    return Container(
       width:double.infinity,
       height:size.height*0.8,
       color:Colors.red,
       child:Swiper(itemCount:10,
       layout:SwiperLayout.STACK,
       itemWidth:size.width*0.6,
       itemHeight:size.height*0.7,
       itemBuilder:(context,index){
         
         return ClipRRect(
           borderRadius:BorderRadius.circular(20),
           child:FadeInImage(
            placeholder:AssetImage('assets/no-image.jpg'),
            image:NetworkImage('https://images.ygoprodeck.com/images/cards/34541863.jpg')),
            
         );

       },
       ),
    );
  }
  


  

}


