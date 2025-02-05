import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http; 

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<dynamic>> encuestas;

  @override
  void initState() {
    super.initState();
    encuestas = fetchEncuestas();
  }

  Future<List<dynamic>> fetchEncuestas() async {
    final response = await http.get(Uri.parse('https://api.bitlabs.ai/encuestas'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al cargar las encuestas');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Encuestas'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: encuestas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay encuestas disponibles'));
          } else {
            final encuestasData = snapshot.data!;
            return ListView.builder(
              itemCount: encuestasData.length,
              itemBuilder: (context, index) {
                final encuesta = encuestasData[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(encuesta['titulo']),
                    subtitle: Text(encuesta['descripcion']),
                    trailing: IconButton(
                      icon: const Icon(Icons.check_circle),
                      onPressed: () {
                        // Aquí puedes manejar la selección de la encuesta
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Seleccionaste una encuesta'),
                              content: Text('Has elegido: ${encuesta['titulo']}'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cerrar'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
