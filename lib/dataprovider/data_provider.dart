

import 'package:api_calling_reverpod/models/usermodel.dart';
import 'package:api_calling_reverpod/service/service.dart';
import 'package:riverpod/riverpod.dart';

final userChangingmodel = FutureProvider<List<UserModel>>((ref)async {
  return ref.watch(changeService).getUser();
});