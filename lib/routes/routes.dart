
import 'package:flutter/material.dart';
import 'package:ygoprodeck/pages/cartas.dart';
import 'package:ygoprodeck/pages/detalle_carta.dart';

final Map<String,Widget Function(BuildContext)>appRoute={
  "CartaPage":(_)=>CartaPage(),
  "DetalleCarta":(_)=>DetalleCarta()
};

