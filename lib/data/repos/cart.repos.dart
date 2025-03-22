import 'package:dentalistasyon/core/utils/helpers.dart';
import 'package:dentalistasyon/core/utils/gql.dart';

class CartRepos {
  static Future<dynamic> addToCart(String id, int qty) async {
    String addToCartMutation = """
      mutation AddToCart(\$storeProductId: ID!, \$quantity: Int = 1) {
        addToCart(input: { storeProductId: \$storeProductId, quantity: \$quantity }) {
          id
          productId
          productName
          price
          discountedPrice
          quantity
          imageUrl
          totalPrice
          totalDiscountedPrice
          shippingPrice
        }
      }
    """;
    Map<String, dynamic> variables = {"storeProductId": id, "quantity": qty};
    var res = await gql(addToCartMutation, variables: variables);
    return handleData(res, "addToCart");
  }

  static Future<dynamic> cartTotal() async {
    String cartTotalQuery = """
      query GetCartTotal {
        cartTotal
      }
    """;
    var res = await gql(cartTotalQuery);
    return handleData(res, "cartTotal");
  }

  static Future<dynamic> getUserCart(int page, int limit) async {
    String userCartQuery = """
      query GetUserCart(\$page: Int = 1, \$limit: Int = 10) {
        userCart(page: \$page, limit: \$limit) {
          items {
            id
            productId
            productName
            price
            discountedPrice
            quantity
            imageUrl
            totalPrice
            totalDiscountedPrice
            shippingPrice
          }
          meta {
            currentPage
            totalPages
            itemCount
            totalItems
            itemsPerPage
          }
          totalPrice
          totalDiscountedPrice
          totalShippingPrice
        }
      }
    """;
    Map<String, dynamic> variables = {"page": page, "limit": limit};
    var res = await gql(userCartQuery, variables: variables);
    return handleData(res, "userCart");
  }

  static Future<dynamic> updateCartItemQuantity(
    String cartItemId,
    String operation,
  ) async {
    String updateCartItemQuantityMutation = """
      mutation UpdateCartItemQuantity(\$input: UpdateCartItemQuantityInput!) {
        updateCartItemQuantity(input: \$input) {
          id
          productId
          productName
          quantity
          price
          discountedPrice
          imageUrl
          totalPrice
          totalDiscountedPrice
          shippingPrice
        }
      }
    """;
    Map<String, dynamic> variables = {
      "input": {"cartItemId": cartItemId, "operation": operation}
    };
    var res = await gql(updateCartItemQuantityMutation, variables: variables);
    return handleData(res, "updateCartItemQuantity");
  }
}
