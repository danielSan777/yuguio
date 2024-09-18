
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ygoprodeck/const/const.dart';
import 'package:ygoprodeck/providers/CartaProvider.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:translator/translator.dart';

class DetalleCarta extends StatefulWidget{
  const DetalleCarta({super.key});
  
  @override
  State<DetalleCarta> createState() => _DetalleCartaState();
}

class _DetalleCartaState extends State<DetalleCarta>{
  
  final translator=GoogleTranslator();

  @override
  Widget build(BuildContext context){
    final cartaProvider=Provider.of<CartaProvider>(context,listen:true);
    final size=MediaQuery.of(context).size;
    final String carta=ModalRoute.of(context)?.settings.arguments.toString()??"";
    
    return SafeArea(
      child:Scaffold(
         appBar:AppBar(
            title:Text(AppConst.titulo,style:AppStyles.estiloTitulo),
            backgroundColor:HexColor("#152f88"),
            centerTitle:true,
         leading:IconButton(
            icon:const Icon(Icons.arrow_back,color:Colors.white,),
            onPressed:(){
                 Navigator.pushReplacementNamed(context,"CartaPage",arguments:"a");              // Regresa a la pantalla anterior
            },
          ),
         ),
         body:CustomScrollView(
            slivers:[
              _CartaAppBar(),
              SliverList(
                delegate:SliverChildListDelegate(
                [
                  Container(
                     width:size.width,
                     height:size.height,
                     color:HexColor("#175aca"),
                     child:Column(
                      crossAxisAlignment:CrossAxisAlignment.center,
                      children:[
                          const SizedBox(height:20),
                          construirTraductorASpanish(cartaProvider:cartaProvider,size:size),
                          const SizedBox(height:25),
                          info_carta(size: size, label: "Inglés",texto:cartaProvider.selectCartaDTO!.name.toString(),url:null),
                          const SizedBox(height:25),
                          construirTraductorAJapones(cartaProvider:cartaProvider,size:size),
                          const SizedBox(height:25),
                          info_carta(size: size,label:"Carta",texto:cartaProvider.selectCartaDTO!.type?.toString()??"",url:'assets/carta.PNG'),
                          const SizedBox(height:25),
                          info_carta(size: size,label:"Atributo",texto:cartaProvider.selectCartaDTO!.attribute?.toString()??"",url:null),
                          const SizedBox(height:25),
                          info_carta(size: size,label:"Enlace",texto:cartaProvider.selectCartaDTO!.linkval?.toString()??"",url:null),
                          const SizedBox(height:25),
                          info_carta(size: size,label:"Tipo",texto:cartaProvider.selectCartaDTO!.humanReadableCardType?.toString()??"",url:null),
                          const SizedBox(height:25),
                          info_carta(size: size,label:"ATK",texto:cartaProvider.selectCartaDTO!.atk?.toString()??"",url:'assets/ataque.png'),
                          const SizedBox(height:20),
                          info_carta(size: size,label:"Nivel",texto:cartaProvider.selectCartaDTO!.level?.toString()??"",url:null),
                     ],),
                  )
                ]
              ))
            ],
         ),
      ),
    );
  }
  
  Future<String>traductorAYnglish({required String texto,required String a})async{
    var translation=await translator
    .translate(texto,from:'en',to:a);
     return translation.text;
  }

  Future<String>traductorASpanish({required String texto})async{
    var translation=await translator
    .translate(texto,from:'en',to:"es");
     return translation.text;
  }
  
  Widget construirTraductorASpanish({required CartaProvider cartaProvider,required Size size}){
    return FutureBuilder<String>(
      future: traductorASpanish(texto:cartaProvider.selectCartaDTO!.name!),
      builder: (context, snapshot){
        if (snapshot.connectionState==ConnectionState.waiting){
          // Mientras se espera el resultado, muestra un indicador de carga
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // En caso de error, muestra un mensaje de error
          return Text('Error al traducir');
        } else if (snapshot.hasData) {
          // Cuando se complete el `Future`, muestra el texto traducido
          return info_carta(size: size, label: "Nombre", texto: snapshot.data!,url:null);
        } else {
          return Text('Sin datos');
        }
      },
    );
  }
  
  Widget construirTraductorAYnglish({required CartaProvider cartaProvider,required Size size}){
    return FutureBuilder<String>(
    future:traductorAYnglish(texto: cartaProvider.selectCartaDTO!.name!,a:"es"),
    builder:(context,snapshot){
      if (snapshot.connectionState == ConnectionState.waiting){
        // Mientras se espera el resultado, muestra un indicador de carga
        return CircularProgressIndicator();
      } else if (snapshot.hasError){
        // En caso de error, muestra un mensaje de error
        return Text('Error al traducir');
      } else if (snapshot.hasData){
        // Cuando se complete el `Future`, muestra el texto traducido
        return info_carta(size: size, label: "Inglés", texto: snapshot.data!,url:null);
      } else {
        return Text('Sin datos');
      }
    },
  );
  }

  Widget construirTraductorAJapones({required CartaProvider cartaProvider,required Size size}){
      
    return  FutureBuilder<String>(
    future: traductorAYnglish(texto: cartaProvider.selectCartaDTO!.name!,a:"ja"),
    builder: (context, snapshot){
      if (snapshot.connectionState == ConnectionState.waiting){
        // Mientras se espera el resultado, muestra un indicador de carga
        return CircularProgressIndicator();
      } else if (snapshot.hasError){
        // En caso de error, muestra un mensaje de error
        return Text('Error al traducir');
      } else if (snapshot.hasData) {
        // Cuando se complete el `Future`, muestra el texto traducido
        return info_carta(size: size, label: "Japonés", texto: snapshot.data!,url:null);
      } else {
        return Text('Sin datos');
      }
    },
  );
  }



}





class info_carta extends StatelessWidget{
  const info_carta({
    super.key,
    required this.size,
    required this.label,
    required this.texto,
    required this.url
  });

  final Size size;
  final String label;
  final String texto;
  final String? url;
  
  @override
  Widget build(BuildContext context){
    final size=MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment:MainAxisAlignment.start,
      children:[
        Container(
           margin:const EdgeInsets.only(left:10),
           width:size.width/3,
           child:Text(label,style:AppStyles.estiloDescripcion),
        ),
        if(url!=null)
        Image.asset(
          url!, // Ruta de la imagen en tu carpeta assets
          width: 24.0,       // Ancho de la imagen
          height: 24.0,      // Alto de la imagen
        ),
        Container(
           width:size.width/2,
           child:Text(texto,style:TextStyle(
              color:HexColor("#d1e0f5")
           ),),
         ),
      ],
    );
  }
}

class _CartaAppBar extends StatelessWidget{
  
  
  @override
  Widget build(BuildContext context){
     final cartaProvider=Provider.of<CartaProvider>(context,listen:true);
     final size=MediaQuery.of(context).size;
     
     return SliverAppBar(
        backgroundColor:Colors.indigo,
        expandedHeight:300,
        floating:false,
        pinned:true,
        
        flexibleSpace:FlexibleSpaceBar(
           centerTitle:true,
          /*  title:Row(
             mainAxisAlignment:MainAxisAlignment.start,
             children:[
               Text(cartaProvider.selectCartaDTO!.name!,style:TextStyle(color:Colors.blue),),
             ],
           ), */
           background:FadeInImage(
              fit:BoxFit.fill,
              placeholder:const AssetImage('assets/no-image.jpg'),
              image:NetworkImage(cartaProvider.selectCartaDTO!.cardImages![0].imageUrl)),
        ),
     );
  }
}








