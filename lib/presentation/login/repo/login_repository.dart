import '../../../ApiServices/api_endpoints.dart';
import '../../../network/service/data_response.dart';
import '../../../network/service/http_wrapper.dart';
import '../models/request_login.dart';

class UserRepository {
  final wpWrapper = DioWrapper(apiType: ApiType.WP);

  Future<DataResponse> login(String userName, String password) async {

    RequestLogin requestLogin=RequestLogin(userName:userName,password:password
    );

    DataResponse response = await wpWrapper.post(ApiEndPoints.loginApi,
        shouldShowGlobalErrorToaster: true,
        data:requestLogin.toJson(),
        showLoader: true);
    if (response.isSuccess == true) {}
    return response;
  }
}
