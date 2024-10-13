import 'package:fluttergraphql/presentation/home/controllers/home.controller.dart';
import 'package:get/get.dart';

import '../../../utils/graphql_service.dart';

class DomainLayerDependencyInjectionContainer {
  static Future<void> init() async {
    Get.lazyPut(()=>GraphQLService());

    Get.lazyPut<HomeController>(
      () => HomeController(Get.find()),
      fenix: true,
    );
  }
}
