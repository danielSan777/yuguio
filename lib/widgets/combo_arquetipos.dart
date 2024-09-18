
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ygoprodeck/model/arquitepo_model.dart';
import 'package:ygoprodeck/providers/CartaProvider.dart';
import 'package:dropdown_search/dropdown_search.dart';

class ComboArquetipos extends StatelessWidget{
  const ComboArquetipos({super.key});
  
  
  @override
  Widget build(BuildContext context){
    return Consumer<CartaProvider>(builder:(context,arquetipo,child){
           return DropdownSearch<ArquitepoDto>(
              popupProps:PopupProps.menu(
              //title:Text("Tipo"),
              showSelectedItems:false,
              showSearchBox:true,
              searchFieldProps:TextFieldProps(
              keyboardType:TextInputType.text, //Teclado numérico
            ),
            disabledItemFn:(ArquitepoDto a) => a.archetypeName == "C",
            ),
            dropdownDecoratorProps:const DropDownDecoratorProps(
            dropdownSearchDecoration:InputDecoration(
            labelText:"Arquetipos",
            //hintText:"seleccione coche",
            border:OutlineInputBorder(
              borderSide:BorderSide(color:Colors.grey),
            ),
          ),
        ),
            onChanged:(ArquitepoDto? a){
               
                arquetipo.cargarCartasPorArquitepos(arquitepo:a!.archetypeName);
            },
            items:arquetipo.listArquitepos,
            itemAsString:(ArquitepoDto arquetipo)=>
            arquetipo.archetypeName,
            selectedItem:arquetipo.selectArquetipo, 
            

           );
            
    });
  }
  

}