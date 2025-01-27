import '../../../../core/utils/typedefs.dart';

abstract class AuthRepository {

  FutureResponseModel login({String? phone});

}