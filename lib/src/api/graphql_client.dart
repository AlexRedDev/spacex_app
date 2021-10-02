import 'package:graphql/client.dart';
import 'package:spacex_app/src/models/launches.dart';

class GraphQlApi {
  final _link = HttpLink('https://api.spacex.land/graphql/');

  Future<List<Launches>> fetchLaunches(String missionName, int offset) async {
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

    final response = result.data?['launches'];
    final list = response.map<Launches>((e) => Launches.fromJson(e)).toList();
    return list;
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
