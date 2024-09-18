
import 'package:flutter/material.dart';
import 'package:ygoprodeck/const/const.dart';
import 'package:ygoprodeck/providers/CartaProvider.dart';
import 'package:ygoprodeck/widgets/cartaCarrusel.dart';
import 'package:provider/provider.dart';
import 'package:ygoprodeck/widgets/combo_arquetipos.dart';

class CartaPage  extends StatefulWidget{
  
  @override
  State<CartaPage> createState() => _CartaPageState();
}

class _CartaPageState extends State<CartaPage>{
  
  
  @override
  Widget build(BuildContext context){
     final size=MediaQuery.of(context).size;
    final cartaProvider=Provider.of<CartaProvider>(context);
    cartaProvider.cargaInicial();
    return Scaffold(
      appBar:AppBar(
        title:Text(AppConst.titulo,style:AppStyles.estiloTitulo,
        ),
        backgroundColor:Colors.blue,
        centerTitle:true,
      ),
      body:Column(
        children:[
        Container(
            width:size.width,
            height:70,
            margin: const EdgeInsets.all(10),
            child:const Row(
              children:[
                Expanded(child: ComboArquetipos()),
               ],
             ),
          ),
          const CartaCarrusel()
        ],
      )
    );
  }
  

}