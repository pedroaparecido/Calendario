import 'package:hasura_connect/hasura_connect.dart';

abstract class GraphqlService {
  Future queryGql({required String query});
  Future mutationGql({required String mutationQuery});
}

class GraphqlServiceImpl implements GraphqlService {
  String urlBase = 'https://XXXXXXXXXXXXXXXXXXXXXXXXXx';
  static const _timeOut = Duration(seconds: 3);

  Future<HasuraConnect> _hasuraConnect() async {
    var hasuraConnect = HasuraConnect(
      urlBase,
      headers: {
        'content-type': 'application/json',
        'x-hasura-admin-secret':
            'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
      },
    );

    return hasuraConnect;
  }

  @override
  Future mutationGql({required String mutationQuery}) async {
    final connection = await _hasuraConnect().timeout(_timeOut);
    final res = await connection.mutation(mutationQuery);
    return res['data'];
  }

  @override
  Future queryGql({required String query}) async {
    final connection = await _hasuraConnect().timeout(_timeOut);
    final res = await connection.query(query);
    return res['data'];
  }
}
