import 'package:dio/dio.dart';

import '../../../ApiServices/api_endpoints.dart';
import '../../../network/service/data_response.dart';
import '../../../network/service/http_wrapper.dart';
import '../../add_service/models/request_update_service.dart';
import '../models/request_feedback.dart';

class SolvedRepository{
  final wpWrapper = DioWrapper(apiType: ApiType.WP);
  Future<DataResponse> addFeedback(RequestFeedback requestFeedback) async {
    DataResponse response = await wpWrapper.post(ApiEndPoints.addFeedback,
        shouldShowGlobalErrorToaster: true,
        data: requestFeedback.toJson(),
        showLoader: true);
    if (response.isSuccess == true) {}
    return response;
  }


  Future<DataResponse> uploadImage(FormData formData) async {
    DataResponse dataResponse =  await wpWrapper.uploadFile(ApiEndPoints.uploadimage, data:formData,
        shouldShowGlobalErrorToaster: false);
    if (dataResponse.isSuccess == true) {
      return dataResponse;
    }else{
      return dataResponse;
    }
  }
}