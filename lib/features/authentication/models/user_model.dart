import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String email;

  UserModel({
    required this.id,
    required this.email
  });

  static UserModel empty () => UserModel(id: '', email: '');

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Email': email,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    
    if (data != null) {
      return UserModel(
        id: document.id,
        email: data['Email'] ?? '',
      );
    } else {
      return UserModel.empty();  // Devolver un usuario vacío si no hay datos
    }
  }
}
