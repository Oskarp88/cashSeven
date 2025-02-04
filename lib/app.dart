import 'package:bitlabs/bitlabs.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:survey_five/bindings/general_bindings.dart';
import 'package:survey_five/utils/constants/colors.dart';
import 'package:survey_five/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mi App de Encuestas',
      theme: MyAppTheme.myTheme,
      initialBinding: GeneralBindings(),
      home: const Scaffold(
        backgroundColor: MyColors.blueDark7,
        body: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ), 
          ),
      ),    
      );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage>  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String appToken = 'gWkPDBakmTsbsfAsgGzlOVm7VKSwsdgN';
  final String userId = '12938489djands3920sadkkdka';

  @override
  void initState() {
    super.initState();
    BitLabs.instance.init(appToken, userId);
  }
void _mostrarEncuestas() async {
 
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi App de Encuestas'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _mostrarEncuestas,
          child: Text('Mostrar Encuestas'),
        ),
      ),
    );
  }
}
