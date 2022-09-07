
import 'package:bloc_base_source/presentation/feature/home/model/color_model.dart';

import '../../../../../core/common/result.dart';

abstract class HomeRepository {
  Future<Result<List<ColorModel>>> loadColorRandom();
}
