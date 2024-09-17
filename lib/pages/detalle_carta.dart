
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetalleCarta extends StatefulWidget{
  const DetalleCarta({super.key});
  
  @override
  State<DetalleCarta> createState() => _DetalleCartaState();
}

class _DetalleCartaState extends State<DetalleCarta>{
  
  
  @override
  Widget build(BuildContext context){
    
    final String carta=ModalRoute.of(context)?.settings.arguments.toString()??"";
    
    return SafeArea(
      child:Scaffold(
        
         body:CustomScrollView(
            slivers:[
              _CartaAppBar(),
              SliverList(delegate:SliverChildListDelegate(
                [
                 const Text("Hola Mundo")
                ]
              ))
            ],
         ),
      ),
    );

  }
}

class _CartaAppBar extends StatelessWidget{
  
  
  @override
  Widget build(BuildContext context){
    
     return SliverAppBar(
        backgroundColor:Colors.indigo,
        expandedHeight:300,
        floating:false,
        pinned:true,
         leading:IconButton(
            icon:Icon(Icons.arrow_back,color:Colors.white,),
            onPressed:(){
              Navigator.pop(context); // Regresa a la pantalla anterior
            },
          ),
        flexibleSpace:const FlexibleSpaceBar(
           centerTitle:true,
           title:Text('prueba'),
           background:FadeInImage(
              fit:BoxFit.fill,
              placeholder:AssetImage('assets/no-image.jpg'),
              image:NetworkImage('https://images.ygoprodeck.com/images/cards/34541863.jpg')),
        ),
     );
  }
}

class DescripcionCarta extends StatefulWidget{
  const DescripcionCarta({super.key});

  @override
  State<DescripcionCarta> createState() => _DescripcionCartaState();
}

class _DescripcionCartaState extends State<DescripcionCarta>{
  
  @override
  Widget build(BuildContext context){
    return Container(
        margin:EdgeInsets.only(top:20),
        padding:EdgeInsets.symmetric(horizontal:20),
        child:Row(children:[
            
        ],),
    );
  }

}






