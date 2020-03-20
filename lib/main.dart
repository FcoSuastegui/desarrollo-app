import 'package:flutter/material.dart';
import 'package:midesarrollo/src/bloc/provider.dart';
import 'package:midesarrollo/src/preferences/preferences.dart';
import 'package:midesarrollo/src/routes/routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new Preferencias();
  await prefs.initPrefs();
  
  runApp(MyApp()); 
}
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _prefs = new Preferencias();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mi desarrollo',
          initialRoute: _prefs.validarToken(),
          routes: routes,
          theme: ThemeData(
            primaryColor: Colors.teal
          ),
      ),
    );
  }
}