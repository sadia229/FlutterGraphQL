import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  GraphQLClient clientToQuery() {
    final HttpLink httpLink = HttpLink(
      'https://rickandmortyapi.com/graphql',
    );

    return GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    );
  }
}
