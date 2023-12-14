import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:horario/core/core_locator.dart';
import 'package:horario/features/Date/presentation/controller/date_controller.dart';
import 'package:horario/features/Date/presentation/date_locator.dart';

final sl = GetIt.instance;

void init() {
  CoreLocator.init(sl);
  DateLocator.init(sl);

  Get.put(DateController());

}
