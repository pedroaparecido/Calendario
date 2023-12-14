import 'package:horario/core/services/graphql_service.dart';
import 'package:horario/features/Date/data/model/date_gql_model.dart';
import 'package:horario/features/Date/data/model/date_model.dart';
import 'package:horario/features/Date/domain/entities/date_entity.dart';

abstract class DateDataSource {
  Future<DateEntity> insert({required DateEntity date});
  Future<List<DateEntity>> getAll();
  Future<DateEntity> update({required DateEntity date});
  Future<bool> delete(int id);
}

class DateDataSourceImpl implements DateDataSource {
  DateDataSourceImpl(this._graphqlService);

  final GraphqlService _graphqlService;

  @override
  Future<DateEntity> insert({required DateEntity date}) async {
    final res = await _graphqlService.mutationGql(
        mutationQuery: DateGqlModel().insert(date));

    return DateModel.fromMap(res['insert_horario']['returning'][0]);
  }

  @override
  Future<List<DateEntity>> getAll() async {
    final res = await _graphqlService.queryGql(query: DateGqlModel.get());

    return DateModel.fromListMap(res['horario']);
  }

  @override
  Future<bool> delete(int id) async {
    final res = await _graphqlService.mutationGql(
        mutationQuery: DateGqlModel.delete(id));

    if (res['delete_horario']['affected_rows'] == 1) return true;
    return false;
  }

  @override
  Future<DateEntity> update({required DateEntity date}) async {
    final res = await _graphqlService.mutationGql(mutationQuery: DateGqlModel().update(date));

    return DateModel.fromMap(res['update_horario']['returning'][0]);
  }
}
