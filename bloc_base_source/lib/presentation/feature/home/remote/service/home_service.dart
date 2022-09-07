import 'package:bloc_base_source/presentation/feature/home/model/color_model.dart';
import 'package:bloc_base_source/presentation/feature/home/model/home_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../data/remote/dto/model_base_response.dart';

part 'home_service.g.dart';

@RestApi()
abstract class HomeService {
  factory HomeService(Dio dio) = _HomeService;

  @GET('/colors/random?format=json')
  Future<ModelBaseResponse<List<ColorModel>>> loadColorRandom();
}
