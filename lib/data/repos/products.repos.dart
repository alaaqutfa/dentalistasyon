import 'package:dentalistasyon/core/utils/helpers.dart';
import 'package:dentalistasyon/core/utils/gql.dart';

class ProductsRepos {
  static Future<dynamic> searchProducts(String term) async {
    String searchProductsQuery = """
      query SearchProducts(\$term: String!) {
        search(term: \$term)
      }
    """;
    Map<String, dynamic> variables = {"term": term};
    var res = await gql(searchProductsQuery, variables: variables);
    return handleData(res, "search");
  }

  static Future<dynamic> activeHotDeals(int page, int limit) async {
    String activeHotDealsQuery = """
      query GetActiveHotDeals(\$page: Int, \$limit: Int) {
        activeHotDeals(pagination: { page: \$page, limit: \$limit }) {
          items {
            id
            title
            discounted_price
            newPrice
            discountPercentage
            quantity
            start_at
            end_at
            is_active
            created_at
            updated_at
            averageRating
            storeProduct {
              id
              price
              discounted_price
              stock_quantity
              sold_quantity
              is_express
              is_featured
              product {
                id
                name
                productImages {
                  id
                  image_url
                  is_main
                }
                brand {
                  id
                  name
                  logo
                }
              }
            }
            hotDealReviews {
              base_review_id
              baseReview {
                id
                rating_product
                rating_shipping
                rating_shop
                comment
                created_at
                user {
                  id
                  name
                }
              }
            }
          }
          meta {
            totalItems
            itemCount
            itemsPerPage
            totalPages
            currentPage
          }
        }
      }
    """;
    Map<String, dynamic> variables = {"page": page, "limit": limit};
    var res = await gql(activeHotDealsQuery, variables: variables);
    return handleData(res, "activeHotDeals");
  }

  static Future<dynamic> newArrivals(int page, int limit) async {
    String newArrivalsQuery = """
      query GetNewArrivals(\$page: Int, \$limit: Int) {
        newArrivals(page: \$page, limit: \$limit) {
          items {
            id
            name
            price
            discountedPrice
            imageUrl
            averageRating
            isInWishlist
            soldQuantity
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
    var res = await gql(newArrivalsQuery, variables: variables);
    return handleData(res, "newArrivals");
  }

  static Future<dynamic> featuredProducts(int page, int limit) async {
    String featuredProductsQuery = """
      query GetFeaturedProducts(\$page: Int, \$limit: Int) {
        featuredProducts(page: \$page, limit: \$limit) {
          items {
            id
            name
            price
            discountedPrice
            imageUrl
            averageRating
            isInWishlist
            soldQuantity
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
    var res = await gql(featuredProductsQuery, variables: variables);
    return handleData(res, "featuredProducts");
  }

  static Future<dynamic> buyMoreSaveMorePromotions(int page, int limit) async {
    String buyMoreSaveMorePromotionsQuery = """
      query GetBuyMoreSaveMorePromotions(\$page: Int, \$limit: Int) {
        promotionsWithRandomProducts(page: \$page, limit: \$limit) {
          items {
            id
            name
            description
            promotionType
            createdAt
            updated_at
            randomProduct {
              id
              name
              price
              discountedPrice
              imageUrl
              averageRating
              isInWishlist
              soldQuantity
            }
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
    Map<String, dynamic> variables = {"page": 1, "limit": 10};
    var res = await gql(buyMoreSaveMorePromotionsQuery, variables: variables);
    return handleData(res, "promotionsWithRandomProducts");
  }

  static Future<dynamic> popularProducts(int page, int limit) async {
    String popularProductsQuery = """
      query GetPopularProducts(\$page: Int, \$limit: Int) {
        popularProducts(page: \$page, limit: \$limit) {
          items {
            id
            name
            price
            discountedPrice
            imageUrl
            averageRating
            isInWishlist
            soldQuantity
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
    var res = await gql(popularProductsQuery, variables: variables);
    return handleData(res, "popularProducts");
  }

  static Future<dynamic> backInStockProducts(int page, int limit) async {
    String backInStockProductsQuery = """
      query GetBackInStockProducts(\$page: Int, \$limit: Int) {
        backInStockProducts(page: \$page, limit: \$limit) {
          items {
            id
            name
            price
            discountedPrice
            imageUrl
            averageRating
            isInWishlist
            soldQuantity
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
    var res = await gql(backInStockProductsQuery, variables: variables);
    return handleData(res, "backInStockProducts");
  }

  static Future<dynamic> expressProducts(int page, int limit) async {
    String expressProductsQuery = """
      query GetExpressProducts(\$page: Int, \$limit: Int) {
        expressProducts(page: \$page, limit: \$limit) {
          items {
            id
            name
            price
            discountedPrice
            imageUrl
            averageRating
            isInWishlist
            soldQuantity
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
    var res = await gql(expressProductsQuery, variables: variables);
    return handleData(res, "expressProducts");
  }

  static Future<dynamic> randomProducts(int page, int limit) async {
    String randomProductsQuery = """
      query GetRandomProducts(\$page: Int = 1, \$limit: Int = 10) {
        randomProducts(page: \$page, limit: \$limit) {
          items {
            id
            name
            price
            discountedPrice
            imageUrl
            averageRating
            isInWishlist
          }
          meta {
            currentPage
            totalPages
            itemCount
            totalItems
          }
        }
      }
    """;
    Map<String, dynamic> variables = {"page": page, "limit": limit};
    var res = await gql(randomProductsQuery, variables: variables);
    return handleData(res, "randomProducts");
  }

  static Future<dynamic> storeProduct(
    String id,
    int reviewsPage,
    int reviewsLimit,
    int relatedProductsPage,
    int relatedProductsLimit,
  ) async {
    String storeProductQuery = """
      query GetStoreProduct(
        \$id: String!,
        \$reviewsPage: Float,
        \$reviewsLimit: Float,
        \$relatedProductsPage: Float,
        \$relatedProductsLimit: Float
      ) {
        storeProduct(
          id: \$id
          reviewsPage: \$reviewsPage
          reviewsLimit: \$reviewsLimit
          relatedProductsPage: \$relatedProductsPage
          relatedProductsLimit: \$relatedProductsLimit
        ) {
          id
          name
          price
          discountedPrice
          averageRating
          isInWishlist
          isBuyMoreSaveMore
          
          productImages {
            id
            image_url
            is_main
          }
          
          reviews {
            items {
              id
              comment
              ratingProduct
              ratingShipping
              ratingShop
              createdAt
              user {
                id
                name
                avatar_url
              }
            }
            meta {
              currentPage
              totalPages
              itemsPerPage
              totalItems
            }
          }
          
          relatedProducts {
            items {
              id
              name
              imageUrl
              price
              discountedPrice
              averageRating
              isInWishlist
            }
            meta {
              currentPage
              totalPages
              itemCount
              totalItems
            }
          }
        }
      }
    """;
    Map<String, dynamic> variables = {
      "id": id,
      "reviewsPage": reviewsPage,
      "reviewsLimit": reviewsLimit,
      "relatedProductsPage": relatedProductsPage,
      "relatedProductsLimit": relatedProductsLimit,
    };
    var res = await gql(storeProductQuery, variables: variables);
    return handleData(res, "storeProduct");
  }

}
