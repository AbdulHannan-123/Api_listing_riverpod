
import 'dart:convert';

import 'package:http/http.dart';

import '../models/usermodel.dart';

class ApiService{
  String endpoint = 'reqres.in/apu/users?page=2';

  getUser() async {
    final response = await get(Uri.parse(endpoint));
    if (response.statusCode==200) {
      final result = jsonDecode(response.body)['data'];
      return result.map((e)=>UserModel.fromJson(e)).toList();
    } else {
      
    }
  }
}