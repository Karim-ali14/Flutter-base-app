import 'package:base_flutter_app/core/utils/extensions/request_handle_extension.dart';
import 'package:base_flutter_app/features/auth/data/models/user_model.dart';
import 'package:base_flutter_app/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/models/ResponseModel.dart';
import '../../../../core/models/StateModel.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase extends StateNotifier<StateModel<User>>{
  final Ref ref;
  final AuthRepository _authRepository;
  LoginUseCase(this.ref, this._authRepository):super(StateModel());

  void call({String? phone})async {
    state = StateModel(state: DataState.LOADING);
    ResponseModel responseModel = await _authRepository.login(phone: phone);
    if (responseModel.isSuccess == true) {
      state = StateModel(state: DataState.SUCCESS,
          data: toUserEntity(UserModel.fromJson(responseModel.data)),
          message: responseModel.message);
    } else {
      state = StateModel(state: DataState.ERROR, message: responseModel.getFullError());
    }
  }
}