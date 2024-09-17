import 'package:flutter/material.dart';
import 'package:ygoprodeck/providers/CartaProvider.dart';
import 'package:ygoprodeck/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await DotEnv.dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  
  
  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers:[
          ChangeNotifierProvider(create:(_)=>CartaProvider()),
      ],
      child:MaterialApp(
        debugShowCheckedModeBanner:false,
        theme:ThemeData(
          colorScheme:ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3:true,
        ),
        routes:appRoute,
        initialRoute:"CartaPage",
      ),
    );
  }
}

