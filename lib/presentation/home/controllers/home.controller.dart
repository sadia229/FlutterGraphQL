import 'package:fluttergraphql/infrastructure/utils/graphql_service.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomeController extends GetxController {
  final GraphQLService _graphQLService;
  var characters = [].obs;
  final loading = false.obs;

  HomeController(this._graphQLService);

  @override
  void onInit() {
    super.onInit();
    fetchAllCharacters();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchAllCharacters() async {
    String query = r'''
    query {
      characters() {
        empireHero: results {
          id
          name
          status
          species
          type
          gender
          origin {
            name
          }
          location {
            name
          }
          image
        }
      }
    }
  ''';
    try {
      loading.value = true;
      final GraphQLClient client = _graphQLService.clientToQuery();
      final QueryOptions options = QueryOptions(document: gql(query));

      final QueryResult result = await client.query(options);

      if (result.hasException) {
        loading.value = false;
        print("print graphql exception");
        print(result.exception.toString());
      } else {
        loading.value = false;
        var data = result.data?['characters'];
        print("data response${data.toString()}");
        characters.value = data['empireHero'];
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
