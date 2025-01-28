import 'dart:convert';
import 'package:base_flutter_app/core/providers/http_provider.dart';
import 'package:base_flutter_app/features/auth/data/models/user_model.dart';
import 'package:base_flutter_app/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/Constants.dart';
import '../../../../main.dart';

class UserProvider extends StateNotifier<User?> {
  final Ref ref;
  UserProvider(this.ref) : super(null);

  UserModel? checkIfUserExist() {
    print("userModel = ${prefs.getString(USER_KEY)}");
    UserModel? user = prefs.getString(USER_KEY) != null
        ? UserModel.fromJson(
        json.decode(prefs.getString(USER_KEY) ?? ""))
        : null;
    print("userModel = $user");
    return user;
  }

  void setUser(UserModel? user){
    if(user != null) {
      state = toUserEntity(user);
    }
    prefs.setString(USER_KEY, json.encode(user?.toJson()));
    print("clint model saved $user");
    ref.read(httpOperationsProvider).userToken = user?.token; // update token
  }

  Future<bool> logout() async{
    state = null;
    await prefs.remove(USER_KEY);
    return true;
  }
}


final userProvider = StateNotifierProvider<UserProvider,User?>((ref)  {
  return UserProvider(ref);
});
