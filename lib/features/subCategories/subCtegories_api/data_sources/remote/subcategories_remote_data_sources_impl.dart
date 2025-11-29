import 'package:dio/dio.dart';
import 'package:ecommerce/core/exception/app_exception.dart';
import 'package:ecommerce/core/mapper/subcategories_response_mapper.dart';
import 'package:ecommerce/features/subCategories/data/data_sources/remote/subcategories_remote_date_sources.dart';
import 'package:ecommerce/features/subCategories/domin/entities/subcategories_response.dart';
import 'package:ecommerce/features/subCategories/subCtegories_api/subcategory_web_service.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubcategoriesRemoteDateSources)
class SubcategoriesRemoteDataSourcesImpl
    implements SubcategoriesRemoteDateSources {
  SubcategoryWebService subcategoryWebService;
  SubcategoriesRemoteDataSourcesImpl({required this.subcategoryWebService});
  @override
  Future<SubcategoriesResponse> getSubcategories({String? categoryId}) async {
    try {
      final subCategoriesResponseDto = await subcategoryWebService
          .getSubcategories(categoryId!);
      //todo: subCategoriesResponseDto => subCategoriesResponse
      return subCategoriesResponseDto.convertToSubcategoriesResponse();
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}
