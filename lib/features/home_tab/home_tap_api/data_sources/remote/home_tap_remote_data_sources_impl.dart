import 'package:dio/dio.dart';
import 'package:ecommerce/core/exception/app_exception.dart';
import 'package:ecommerce/core/mapper/category_mapper.dart';
import 'package:ecommerce/features/home_tab/data/data_sources/remote/home_tap_remote_data_sources.dart';
import 'package:ecommerce/features/home_tab/domin/entities/category.dart';
import 'package:ecommerce/features/home_tab/home_tap_api/home_web_server.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeTapRemoteDataSources)
class HomeTapRemoteDataSourcesImpl implements HomeTapRemoteDataSources {
  HomeWebServer homeWebServer;
  HomeTapRemoteDataSourcesImpl({required this.homeWebServer});
  @override
  Future<List<Category>?> getAllCategories() async {
    try {
      final categoryResponseDto = await homeWebServer.getAllCategories();
      //todo: categoryDto => category
      return categoryResponseDto.categoryDto!
          .map((categorDto) => categorDto.convertToCategory())
          .toList();
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}
