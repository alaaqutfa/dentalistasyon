import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/core/utils/shimmer_helper.dart';
import 'package:dentalistasyon/view/widgets/partials/appBtn.dart';
import 'package:dentalistasyon/view/widgets/partials/appImg.dart';
import 'package:dentalistasyon/view/widgets/partials/fields.dart';
import 'package:dentalistasyon/view/widgets/partials/product.dart';
import 'package:dentalistasyon/view/widgets/partials/refreshpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartBody extends StatelessWidget {
  final bool ready;
  final Future<void> Function() onRefresh;
  final List<dynamic> cart;
  final String cartTotal;
  final String totalPrice;
  final String totalDiscountedPrice;
  final String shippingPrice;
  final String totalAmount;
  final RxMap<String, RxInt> productQuantities;
  final Map<String, TextEditingController> quantitiesControllers;
  final Function(String) onPressedDecreaseQuantity;
  final Function(String) onPressedIncreaseQuantity;
  final Function(String, String) onSubmittedQuantity;
  const CartBody({
    super.key,
    required this.ready,
    required this.onRefresh,
    required this.cart,
    required this.cartTotal,
    required this.productQuantities,
    required this.quantitiesControllers,
    required this.onPressedDecreaseQuantity,
    required this.onPressedIncreaseQuantity,
    required this.onSubmittedQuantity,
    required this.totalPrice,
    required this.totalDiscountedPrice,
    required this.shippingPrice,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return AppRefreshPage(
      onRefresh: onRefresh,
      child: ready
          ? buildContent(
              context,
              cart,
              cartTotal,
              totalPrice,
              totalDiscountedPrice,
              shippingPrice,
              totalAmount,
              productQuantities,
              quantitiesControllers,
              onPressedDecreaseQuantity,
              onPressedIncreaseQuantity,
              onSubmittedQuantity,
            )
          : buildContentShimmer(context),
    );
  }
}

Widget buildContent(
  BuildContext context,
  List<dynamic> cart,
  String cartTotal,
  String totalPrice,
  String totalDiscountedPrice,
  String shippingPrice,
  String totalAmount,
  RxMap<String, RxInt> productQuantities,
  Map<String, TextEditingController> quantitiesControllers,
  Function(String) onPressedDecreaseQuantity,
  Function(String) onPressedIncreaseQuantity,
  Function(String, String) onSubmittedQuantity,
) {
  return Container(
    padding: Themes.edgeMd,
    color: Themes.light,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Themes.spaceY16,
        Text(
          "Cart",
          style: Themes.title_xl,
        ),
        Themes.spaceY16,
        buildCartProducts(
          cart,
          productQuantities,
          quantitiesControllers,
          onPressedDecreaseQuantity,
          onPressedIncreaseQuantity,
          onSubmittedQuantity,
        ),
        Themes.spaceY16,
        buildCalculations(
          totalPrice,
          totalDiscountedPrice,
          shippingPrice,
          totalAmount,
        ),
        Themes.spaceY16,
        buildCheckout(context, cartTotal),
        Themes.spaceY16,
      ],
    ),
  );
}

Widget buildCartProducts(
  List<dynamic> cart,
  RxMap<String, RxInt> productQuantities,
  Map<String, TextEditingController> quantitiesControllers,
  Function(String) onPressedDecreaseQuantity,
  Function(String) onPressedIncreaseQuantity,
  Function(String, String) onSubmittedQuantity,
) {
  return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: cart.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            cartProduct(
              cart[index],
              productQuantities,
              quantitiesControllers,
              onPressedDecreaseQuantity,
              onPressedIncreaseQuantity,
              onSubmittedQuantity,
            ),
            Themes.spaceY8,
          ],
        );
      });
}

Widget cartProduct(
  Map<String, dynamic> product,
  RxMap<String, RxInt> productQuantities,
  Map<String, TextEditingController> quantitiesControllers,
  Function(String) onPressedDecreaseQuantity,
  Function(String) onPressedIncreaseQuantity,
  Function(String, String) onSubmittedQuantity,
) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        width: 1,
        color: Themes.stroke,
      ),
      borderRadius: Themes.borderRadiusMd,
    ),
    child: Stack(
      children: [
        Row(
          children: [
            cartProductImg(product["img"]),
            cartProductContent(
              product,
              productQuantities,
              quantitiesControllers,
              onPressedDecreaseQuantity,
              onPressedIncreaseQuantity,
              onSubmittedQuantity,
            ),
          ],
        ),
        Positioned(
          top: Spacing.md,
          right: Spacing.md,
          child: InkWell(
            //TODO Need to remove item from cart
            onTap: () {},
            child: Image.asset(
              AppImg.trash_icon,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget cartProductImg(String img) {
  //TODO Product cart image not correct in incomming data
  return Container(
    width: 130,
    height: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Spacing.md),
        bottomLeft: Radius.circular(Spacing.md),
      ),
      color: Colors.transparent,
    ),
    clipBehavior: Clip.antiAlias,
    child: AppNetworkImg(
      img,
      width: 130,
      height: 150,
      fit: BoxFit.contain,
      assetFit: BoxFit.cover,
    ),
  );
}

Widget cartProductContent(
  Map<String, dynamic> product,
  RxMap<String, RxInt> productQuantities,
  Map<String, TextEditingController> quantitiesControllers,
  Function(String) onPressedDecreaseQuantity,
  Function(String) onPressedIncreaseQuantity,
  Function(String, String) onSubmittedQuantity,
) {
  return Container(
    padding: Themes.edgeMd,
    height: 150,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisSize: MainAxisSize.min,
      children: [
        cartDiscountPrice(
          product["discountedPrice"],
          product["price"],
          "TL",
        ),
        defProductEllipsisName(product["productName"], 170, 2),
        buildQuantityCounter(
          product["id"],
          productQuantities,
          quantitiesControllers,
          onPressedDecreaseQuantity,
          onPressedIncreaseQuantity,
          onSubmittedQuantity,
        ),
      ],
    ),
  );
}

Widget cartDiscountPrice(
  String newPrice,
  String discounted_price,
  String currency,
) {
  return Row(
    children: [
      Row(
        children: [
          // السعر بعد الخصم
          Text(
            newPrice,
            style: Themes.title_lg.copyWith(
              color: Themes.error,
              fontSize: Spacing.md + 2,
            ),
          ),
          Themes.spaceX4,
          // العملة
          Text(
            currency,
            style: Themes.text_xs.copyWith(
              color: Themes.error,
            ),
          ),
        ],
      ),
      Themes.spaceX4,
      Row(
        children: [
          // السعر القديم
          Text(
            discounted_price,
            style: Themes.text_sm.copyWith(
              decoration: TextDecoration.lineThrough,
              decorationColor: Themes.grayText.withOpacity(0.8),
              color: Themes.grayText.withOpacity(0.8),
            ),
          ),
          Themes.spaceX4,
          // العملة
          Text(
            currency,
            style: Themes.text_xs.copyWith(
              decoration: TextDecoration.lineThrough,
              decorationColor: Themes.grayText.withOpacity(0.8),
              color: Themes.grayText.withOpacity(0.8),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget buildQuantityCounter(
  String id,
  RxMap<String, RxInt> productQuantities,
  Map<String, TextEditingController> quantitiesControllers,
  Function(String) onPressedDecreaseQuantity,
  Function(String) onPressedIncreaseQuantity,
  Function(String, String) onSubmittedQuantity,
) {
  return Container(
    width: 150,
    height: 35,
    decoration: BoxDecoration(
      border: Border.all(
        width: 1,
        color: Themes.stroke,
      ),
      borderRadius: Themes.borderRadiusSm,
    ),
    clipBehavior: Clip.antiAlias,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      children: [
        // زر الزيادة
        Container(
          width: 35,
          height: 35,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Themes.primary,
            border: Border(
              right: BorderSide(
                width: 1,
                color: Themes.stroke,
              ),
            ),
          ),
          child: InkWell(
            onTap: () {
              onPressedIncreaseQuantity(id);
            },
            child: Icon(
              Icons.add,
              color: Themes.light,
            ),
          ),
        ),
        // عرض القيمة
        //TODO Need to update QTY by set a value not just increase or decrease quantity
        Obx(
          () {
            productQuantities[id]?.value ?? 0;
            return SizedBox(
              width: 70,
              child: TextField(
                controller: quantitiesControllers[id],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  isDense: true, // تقليل المساحة الداخلية
                  // contentPadding: EdgeInsets.symmetric(vertical: 8),
                ),
                onSubmitted: (value) {
                  onSubmittedQuantity(id, value);
                },
              ),
            );
          },
        ),
        // زر الإنقاص
        Container(
          width: 35,
          height: 35,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                width: 1,
                color: Themes.stroke,
              ),
            ),
          ),
          child: InkWell(
            onTap: () {
              onPressedDecreaseQuantity(id);
            },
            child: Icon(
              Icons.remove,
              color: Themes.primary,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildCalculations(
  String totalPrice,
  String totalDiscountedPrice,
  String shippingPrice,
  String totalAmount,
) {
  return Container(
    width: double.infinity,
    padding: Themes.edgeMd,
    decoration: BoxDecoration(
      borderRadius: Themes.borderRadiusSm,
      color: Themes.whiteGray,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        calculationsRow("Total", totalPrice, true),
        calculationsRow("Total discounted", "-$totalDiscountedPrice", true),
        calculationsRow("Shipping", "+$shippingPrice", true),
        promoRow("Promo code"),
        calculationsRow("Total Amount", totalAmount, false),
      ],
    ),
  );
}

Widget calculationsRow(String text, String price, bool bordered) {
  return Container(
    padding: Themes.edgeSm,
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          width: bordered ? 1 : 0,
          color: bordered ? Themes.stroke : Colors.transparent,
        ),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text.tr,
          style: Themes.text_sm.copyWith(
            color: Themes.grayText,
          ),
        ),
        defPrice(price, "TL"),
      ],
    ),
  );
}

Widget promoRow(String text) {
  //TODO Need to add promo code
  return Container(
    padding: Themes.edgeSm,
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          width: 1,
          color: Themes.stroke,
        ),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text.tr,
          style: Themes.text_sm.copyWith(
            color: Themes.grayText,
          ),
        ),
        Themes.spaceY8,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: Spacing.md,
                    vertical: Spacing.sm,
                  ),
                  hintText: "Enter code to get discount".tr,
                  hintStyle: Themes.text_sm.copyWith(
                    color: Themes.grayText,
                    fontSize: FontSizes.sm - 2,
                  ),
                  border: inputBorder(Themes.stroke, 1),
                  enabledBorder: inputBorder(Themes.stroke, 1),
                  focusedBorder: inputBorder(Themes.primary, 2),
                  errorBorder: inputBorder(Themes.error, 1),
                  focusedErrorBorder: inputBorder(Themes.error, 2),
                ),
              ),
            ),
            Themes.spaceX8,
            Container(
              height: 45,
              padding: EdgeInsets.symmetric(
                horizontal: Spacing.md,
                vertical: Spacing.sm,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Themes.primary,
                borderRadius: Themes.borderRadiusSm,
              ),
              child: InkWell(
                onTap: () {},
                child: Text(
                  "Apply".tr,
                  style: Themes.text_sm.copyWith(
                    color: Themes.light,
                    fontSize: FontSizes.sm - 2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}

Widget buildCheckout(BuildContext context, String cartTotal) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Total",
            style: Themes.text_sm.copyWith(
              fontSize: FontSizes.sm - 2,
              color: Themes.grayText,
            ),
          ),
          Themes.spaceY8,
          defPrice(cartTotal, "TL"),
        ],
      ),
      //TODO Need to add shipping price to cartTotal
      defBtn(
        MediaQuery.of(context).size.width - 130,
        Themes.primary,
        () {},
        "Checkout",
        true,
      ),
    ],
  );
}

Widget buildContentShimmer(BuildContext context) {
  return Container(
    padding: Themes.edgeMd,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Themes.spaceY16,
        Text(
          "Cart",
          style: Themes.title_xl,
        ),
        Themes.spaceY16,
        buildCartProductsShimmer(),
        Themes.spaceY16,
        buildCalculationsShimmer(),
        Themes.spaceY16,
        buildCheckoutShimmer(context),
        Themes.spaceY16,
      ],
    ),
  );
}

Widget buildCartProductsShimmer() {
  return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            cartProductShimmer(),
            Themes.spaceY8,
          ],
        );
      });
}

Widget cartProductShimmer() {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        width: 1,
        color: Themes.stroke,
      ),
      borderRadius: Themes.borderRadiusMd,
    ),
    child: Stack(
      children: [
        Row(
          children: [
            cartProductImgShimmer(),
            cartProductContentShimmer(),
          ],
        ),
        Positioned(
          top: Spacing.md,
          right: Spacing.md,
          child: ShimmerHelper().buildDefaultShimmer(Image.asset(
            AppImg.trash_icon,
          )),
        ),
      ],
    ),
  );
}

Widget cartProductImgShimmer() {
  return Container(
    width: 130,
    height: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Spacing.md),
        bottomLeft: Radius.circular(Spacing.md),
      ),
      color: Colors.transparent,
    ),
    clipBehavior: Clip.antiAlias,
    child: ShimmerHelper().buildDefaultShimmer(AppNetworkImg(
      "",
      width: 130,
      height: 150,
      fit: BoxFit.contain,
      assetFit: BoxFit.cover,
    )),
  );
}

Widget cartProductContentShimmer() {
  return Container(
    padding: Themes.edgeMd,
    height: 150,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisSize: MainAxisSize.min,
      children: [
        ShimmerHelper()
            .buildDefaultShimmer(cartDiscountPrice("00", "00", "TL")),
        ShimmerHelper().buildDefaultShimmer(defProductName("Loading...")),
        ShimmerHelper().buildDefaultShimmer(buildQuantityCounterShimmer()),
      ],
    ),
  );
}

Widget buildQuantityCounterShimmer() {
  return Container(
    width: 150,
    height: 35,
    decoration: BoxDecoration(
      color: Themes.stroke,
      borderRadius: Themes.borderRadiusSm,
    ),
    clipBehavior: Clip.antiAlias,
  );
}

Widget buildCalculationsShimmer() {
  return Container(
    width: double.infinity,
    padding: Themes.edgeMd,
    decoration: BoxDecoration(
      borderRadius: Themes.borderRadiusSm,
      color: Themes.whiteGray,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ShimmerHelper().buildDefaultShimmer(calculationsRow("Total", "00", true)),
        ShimmerHelper().buildDefaultShimmer(calculationsRow("Total discounted", "-00", true)),
        ShimmerHelper().buildDefaultShimmer(calculationsRow("Shipping", "+00", true)),
        ShimmerHelper().buildDefaultShimmer(promoRow("Promo code")),
        ShimmerHelper().buildDefaultShimmer(calculationsRow("Total Amount", "00", false)),
      ],
    ),
  );
}

Widget buildCheckoutShimmer(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ShimmerHelper().buildDefaultShimmer(Text(
            "Total",
            style: Themes.text_sm.copyWith(
              fontSize: FontSizes.sm - 2,
              color: Themes.grayText,
            ),
          )),
          Themes.spaceY8,
          ShimmerHelper().buildDefaultShimmer(defPrice("00", "TL")),
        ],
      ),
      ShimmerHelper().buildDefaultShimmer(defBtn(
        MediaQuery.of(context).size.width - 130,
        Themes.primary,
        () {},
        "Checkout",
        true,
      )),
    ],
  );
}
