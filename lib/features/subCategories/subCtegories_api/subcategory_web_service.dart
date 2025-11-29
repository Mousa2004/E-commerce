import 'package:dio/dio.dart';
import 'package:ecommerce/core/endpoints/api_endpoints.dart';
import 'package:ecommerce/features/subCategories/subCtegories_api/model/subcategories_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'subcategory_web_service.g.dart';

@RestApi()
abstract class SubcategoryWebService {
  factory SubcategoryWebService(Dio dio, {String? baseUrl}) =
      _SubcategoryWebService;

  @GET(ApiEndpoints.apiSubcategories)
  Future<SubcategoriesResponseDto> getSubcategories(@Path() String categoryId);
}
