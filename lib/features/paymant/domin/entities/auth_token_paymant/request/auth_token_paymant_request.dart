import 'package:ecommerce/core/endpoints/api_endpoints.dart';

class AuthTokenPaymantRequest {
  String apiKey;
  AuthTokenPaymantRequest({this.apiKey = ApiEndpoints.apiKeyPayment});
}
