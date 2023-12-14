import 'package:dartz/dartz.dart';
import 'package:horario/features/Date/data/data_sources/date_data_source.dart';
import 'package:horario/features/Date/domain/entities/date_entity.dart';
import 'package:horario/features/Date/domain/repositories/date_repository.dart';

class DateRepositoryImpl implements DateRepository {
  DateRepositoryImpl(this._dataSource);

  final DateDataSource _dataSource;

  @override
  Future<Either<Exception, DateEntity>> insert({required DateEntity date}) async {
    try {
      final res = await _dataSource.insert(date: date);
      return Right(res);
    } catch (err) {
      return Left(Exception('Não foi possível agendar horário\nERRO: $err'));
    }
  }

  @override
  Future<Either<Exception, List<DateEntity>>> getAll() async {
    try {
      final res = await _dataSource.getAll();
      return Right(res);
    } catch (err) {
      return Left(Exception('Não foi possível buscar os horarios\nERRO: $err'));
    }
  }

  @override
  Future<Either<Exception, DateEntity>> update(
      {required DateEntity date}) async {
    try {
      final res = await _dataSource.update(date: date);
      return Right(res);
    } catch (err) {
      return Left(
          Exception('Não foi possível atualizar o horário\nERRO: $err'));
    }
  }

  @override
  Future<bool> delete(int id) async {
    final res = await _dataSource.delete(id);
    return res;
  }
}
