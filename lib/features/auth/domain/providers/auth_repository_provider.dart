import 'package:base_flutter_app/features/auth/data/poviders/authRemoteDataSourceProvider.dart';
import 'package:base_flutter_app/features/auth/data/repositories/auth_repository_imp.dart';
import 'package:base_flutter_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


  /* Provide repositories */

final authRepoProvider = Provider<AuthRepository>((ref)  {
  return AuthRepositoryImp(ref.watch(authRemoteDataSourceProvider));
});
