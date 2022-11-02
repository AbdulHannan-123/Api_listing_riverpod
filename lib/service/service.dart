
import 'dart:convert';

import 'package:http/http.dart';
import 'package:riverpod/riverpod.dart';

import '../models/usermodel.dart';

class ApiService{
  String endpoint = 'https://reqres.in/api/users?page=2';

  Future<List<UserModel>> getUser() async {
    final response = await get(Uri.parse(endpoint));
    if (response.statusCode==200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e)=>UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final changeService = Provider<ApiService>((ref) => ApiService(),);

