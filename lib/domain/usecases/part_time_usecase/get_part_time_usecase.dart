


import 'package:openflutterecommerce/data/model/part_time_data_model/part_time_model_task_one.dart';
import 'package:openflutterecommerce/data/repositories/abstract/part_time_task_one_repository.dart';
import 'package:openflutterecommerce/data/repositories/part_time_repository_impl.dart';

import '../../../locator.dart';
import '../base_use_case.dart';


abstract class GetPartTimeTaskOneUseCase
    implements BaseUseCase<PartTimeTaskOneResult, PartTimeTaskOneParams> {}



class GetPartTimeTaskOneUseCaseImpl implements GetPartTimeTaskOneUseCase {

  @override
  Future<PartTimeTaskOneResult> execute(
      PartTimeTaskOneParams params) async {
    PartTimeTaskOneRepository productRepository = sl();
    await productRepository.getCartPartTime();
    try {
      PartTimeTaskOneRepository productRepository = sl();
      return PartTimeTaskOneResult(
        collections: await productRepository.getCartPartTime(),
        result: true,
      );
    } catch (e) {
      return PartTimeTaskOneResult(
          collections: [],
          result: false,
          exception: PartTimeTaskOneException()
      );
    }
  }
}



class PartTimeTaskOneParams {}


class PartTimeTaskOneResult extends UseCaseResult {
   List<Rs> collections;

  PartTimeTaskOneResult({this.collections,  Exception exception, bool result})
      : super(exception: exception, result: result);
}

class PartTimeTaskOneException implements Exception {}

abstract class PartTimeUsecase implements BaseUseCase<PartTimeTaskOneResult, PartTimeTaskOneParams> {}