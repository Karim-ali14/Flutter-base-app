import '../../../../core/models/ResponseModel.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/http_operation.dart';

class AuthRemoteDataSource {
  final HttpOperations _httpOps;

  AuthRemoteDataSource(this._httpOps);

  Future<ResponseModel> login(String? phone) {
    return _httpOps.postFormData(
      endPoint: userLoginEndPoint,
      data: {
        "phone": phone.toString(),
      },
    );
  }

}
