import 'package:dartz/dartz.dart';
import 'package:horario/features/Date/domain/entities/date_entity.dart';

abstract class DateRepository {
  Future<Either<Exception, DateEntity>> insert({required DateEntity date});
  Future<Either<Exception, List<DateEntity>>> getAll();
  Future<Either<Exception, DateEntity>> update({required DateEntity date});
  Future<bool> delete(int id);
}
