
import 'package:flutter/material.dart';
import 'package:ygoprodeck/const/const.dart';
import 'package:ygoprodeck/providers/CartaProvider.dart';
import 'package:ygoprodeck/widgets/cartaCarrusel.dart';
import 'package:provider/provider.dart';

class CartaPage  extends StatefulWidget{
  
  @override
  State<CartaPage> createState() => _CartaPageState();
}

class _CartaPageState extends State<CartaPage>{
  
  
  @override
  Widget build(BuildContext context){
    final cartaProvider=Provider.of<CartaProvider>(context);
    cartaProvider.cargaInicial();
    return Scaffold(
      appBar:AppBar(
        title:Text(AppConst.titulo,style:AppStyles.estiloTitulo,
        ),
        backgroundColor:Colors.blue,
        centerTitle:true,
      ),
      body:const Column(
        children:[
           CartaCarrusel()
        ],
      )
    );
  }
  

}