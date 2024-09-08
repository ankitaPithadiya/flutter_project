import '../../../ApiServices/api_endpoints.dart';
import '../../../network/service/data_response.dart';
import '../../../network/service/http_wrapper.dart';

class UserRepository {
  final wpWrapper = DioWrapper(apiType: ApiType.WP);

  Future<DataResponse> login(String userName, String password) async {
    DataResponse response = await wpWrapper.post(ApiEndPoints.loginApi,
        bodytype: BodyType.FORMDATA,
        shouldShowGlobalErrorToaster: true,
        showLoader: true);
    if (response.isSuccess == true) {}
    return response;
  }
}
