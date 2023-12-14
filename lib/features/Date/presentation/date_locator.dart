import 'package:get_it/get_it.dart';
import 'package:horario/features/Date/data/data_sources/date_data_source.dart';
import 'package:horario/features/Date/data/repositories/date_repository_impl.dart';
import 'package:horario/features/Date/domain/repositories/date_repository.dart';

class DateLocator {
  static void init(GetIt sl) {
    // Data sources
    sl.registerFactory<DateDataSource>(() => DateDataSourceImpl(sl(), ));

    // Repository
    sl.registerFactory<DateRepository>(() => DateRepositoryImpl(sl()));
  }
}
