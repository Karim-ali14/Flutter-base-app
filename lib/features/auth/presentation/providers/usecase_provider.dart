import 'package:base_flutter_app/core/models/StateModel.dart';
import 'package:base_flutter_app/features/auth/data/models/user_model.dart';
import 'package:base_flutter_app/features/auth/domain/entities/user_entity.dart';
import 'package:base_flutter_app/features/auth/domain/providers/auth_repository_provider.dart';
import 'package:base_flutter_app/features/auth/domain/use_cases/login_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginStateNotifierProvider =
    StateNotifierProvider.autoDispose<LoginUseCase, StateModel<User>>(
        (ref) => LoginUseCase(ref, ref.read(authRepoProvider)));
