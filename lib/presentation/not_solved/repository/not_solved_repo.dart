import '../../../ApiServices/api_endpoints.dart';
import '../../../network/service/data_response.dart';
import '../../../network/service/http_wrapper.dart';
import '../../add_service/models/request_update_service.dart';
import '../models/request_service_visit_update.dart';

class NotSolvedRepository{
  final wpWrapper = DioWrapper(apiType: ApiType.WP);
  Future<DataResponse> updateServiceVisit(RequestServiceVisit requestService) async {
    DataResponse response = await wpWrapper.post(ApiEndPoints.updateServiceVisit,
        shouldShowGlobalErrorToaster: true,
        data: requestService.toJson(),
        showLoader: true);
    if (response.isSuccess == true) {}
    return response;
  }

  Future<DataResponse> serviceStatusUpdate(RequestUpdateServiceStatus requestStatusUpdate) async {
    DataResponse response = await wpWrapper.post(ApiEndPoints.updateServiceStatus,
        shouldShowGlobalErrorToaster: true,
        data: requestStatusUpdate.toJson(),
        showLoader: true);
    if (response.isSuccess == true) {}
    return response;
  }
}