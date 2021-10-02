import 'package:graphql/client.dart';
import 'package:spacex_app/src/models/launches.dart';

class GraphQlApi {
  final _link = HttpLink('https://api.spacex.land/graphql/');

  Future<List<Launches>> fetchLaunches({required String missionName,
      int offset = 0}) async {
    final GraphQLClient client = GraphQLClient(
      link: _link,
      cache: GraphQLCache(),
    );

    final options =
        QueryOptions(document: gql(_buildQuery(missionName, offset)));

    final result = await client.query(options);

    if (result.hasException) {
      throw Exception(result.exception?.graphqlErrors);
    }

    final response = result.data?['data'];
    final listLaunches = (response as List)
        .map((jsonItem) => Launches.fromJson(jsonItem))
        .toList();
    return listLaunches;
  }

  String _buildQuery(String missionName, int offset) {
    return '''{
      launches(find: {mission_name: "${missionName}"}, limit: 10, offset: $offset) {
        mission_name
        details
      }
    }''';
  }
}
