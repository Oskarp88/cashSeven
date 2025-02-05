import 'package:bitlabs/bitlabs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_five/features/personalization/controllers/user_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen>  createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        title: const Text('Mi App de Encuestas'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _mostrarEncuestas,
          child: const Text('Mostrar Encuestas'),
        ),
      ),
    );
  }
}
 