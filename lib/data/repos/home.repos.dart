import 'package:dentalistasyon/core/utils/gql.dart';
import 'package:dentalistasyon/core/utils/helpers.dart';

class HomeRepos {
  static Future<dynamic> getBrands(int page, int limit) async {
    String getBrandsQuery = """
      query GetBrands(\$page: Int, \$limit: Int) {
        getBrandsPaginated(pagination: { page: \$page, limit: \$limit }) {
          items {
            id
            name
            logo
          }
          meta {
            currentPage
            totalPages
            itemsPerPage
            totalItems
            itemCount
          }
        }
      }
    """;
    Map<String, dynamic> variables = {"page": page, "limit": limit};
    var res = await gql(getBrandsQuery, variables: variables);
    return handleData(res, "getBrandsPaginated");
  }
}
