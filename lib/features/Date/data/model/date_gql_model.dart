import 'package:horario/features/Date/domain/entities/date_entity.dart';

class DateGqlModel {
  static String dateQuery = '''
            id
            name
            telefone
            status
            teste_data''';

  String insert(DateEntity date) => '''mutation {
  insert_horario(
    objects: {
      name: "${date.name}", 
      teste_data: "${date.tDated}",
      telefone: "${date.tel}",
      status: "${date.status}"

    }) {
    returning {
      $dateQuery
    }
  }
}''';

  static String get() {
    return '''query {
                    horario {
                      id
                      name
                      telefone
                      teste_data
                      status
                    }
                  }''';
  }

  String update(DateEntity date) => '''mutation  {
  update_horario(
      where: {
      id: {_eq: ${date.id}}}, 
    _set: {
      name: "${date.name}", 
      teste_data: "${date.tDated}",
      telefone: "${date.tel}"
      status: "${date.status}"
    }) {
    returning {
      $dateQuery
    }
  }
}''';

  static String delete(int id) => '''mutation {
  delete_horario(where: {id: {_eq: $id}}) {
          affected_rows
        }
      }''';
}
