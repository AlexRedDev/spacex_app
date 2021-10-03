import 'package:graphql/client.dart';
import 'package:spacex_app/src/api/api_client.dart';
import 'package:spacex_app/src/models/launches.dart';

class GraphQlApi extends ApiClient {
  final _link = HttpLink('https://api.spacex.land/graphql/');
  late GraphQLClient _client;
  int _offset = 0;

  GraphQlApi() {
    _client = GraphQLClient(link: _link, cache: GraphQLCache());
  }

  @override
  Future<List<Launches>> fetchLaunches(String missionName) async {
    _offset = 0;
    final options = QueryOptions(
        document: gql(
      _buildQuery(missionName, _offset),
    ));

    final result = await _client.query(options);

    if (result.hasException) {
      throw Exception(result.exception?.graphqlErrors);
    }

    final response = result.data?['launches'];

    final list = response.map<Launches>((e) => Launches.fromJson(e)).toList();
    return list;
  }

  @override
  Future<List<Launches>> reFetchLaunches(String missionName) async {
    _offset += 10;
    final options = QueryOptions(
        document: gql(
      _buildQuery(missionName, _offset),
    ));

    final result = await _client.query(options);

    if (result.hasException) {
      throw Exception(result.exception?.graphqlErrors);
    }

    final response = result.data?['launches'];

    final list = response.map<Launches>((e) => Launches.fromJson(e)).toList();
    return list;
  }

  String _buildQuery(String missionName, int offset) {
    return '''{
      launches(find: {mission_name: "$missionName"}, limit: 10, offset: $offset) {
        mission_name
        details
        links {
          flickr_images
        }
      }
    }''';
  }
}
