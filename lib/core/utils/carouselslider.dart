import 'package:carousel_slider/carousel_slider.dart';
import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/core/utils/shimmer_helper.dart';
import 'package:flutter/material.dart';

class AppSlider extends StatelessWidget {
  final CarouselSliderController carouselController;
  final List<Widget> items;
  final int milliseconds;

  const AppSlider({
    super.key,
    required this.carouselController,
    required this.items,
    required this.milliseconds,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: items.isNotEmpty ? items : [Container()],
      carouselController: carouselController,
      options: CarouselOptions(
        autoPlayAnimationDuration: Duration(milliseconds: milliseconds),
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1,
        aspectRatio: 2.0,
        initialPage: 0,
        padEnds: false,
      ),
    );
  }
}

class AppSliderShimmer extends StatelessWidget {
  final int milliseconds;
  final Widget content;

  const AppSliderShimmer({
    super.key,
    required this.milliseconds,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget>? items = [
      Container(),
      Container(),
      Container(),
      Container(),
      Container(),
    ];
    return CarouselSlider(
      items: items
          .map(
            (item) => content,
          )
          .toList(),
      carouselController: CarouselSliderController(),
      options: CarouselOptions(
        autoPlayAnimationDuration: Duration(milliseconds: milliseconds),
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1,
        aspectRatio: 2.0,
        initialPage: 0,
        padEnds: false,
      ),
    );
  }
}

class AppIndicatorSlider extends StatelessWidget {
  final CarouselSliderController buttonCarouselController;
  final List<Widget> items;
  final int current;
  final Function(int key)? onTap;

  const AppIndicatorSlider({
    super.key,
    required this.buttonCarouselController,
    required this.items,
    required this.current,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider(
          items: items.isNotEmpty ? items : [Container()],
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1,
            aspectRatio: 2.0,
            initialPage: 0,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () {
                onTap!(entry.key);
              },
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Themes.primary
                        .withOpacity(current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class AppIndicatorSliderShimmer extends StatelessWidget {
  final CarouselSliderController? shimmerCarouselController;
  final Function(int key)? onTap;
  final int shimmerCurrent;
  const AppIndicatorSliderShimmer(
      {super.key,
      this.shimmerCarouselController,
      this.onTap,
      required this.shimmerCurrent});

  @override
  Widget build(BuildContext context) {
    List<Widget>? items = [
      Container(),
      Container(),
      Container(),
      Container(),
      Container(),
    ];
    return Column(
      children: <Widget>[
        CarouselSlider(
          items: items
              .map(
                (item) => ClipRRect(
                  borderRadius: Themes.borderRadiusSm,
                  child: ShimmerHelper().buildBasicShimmer(
                    height: 170,
                    width: double.infinity,
                  ),
                ),
              )
              .toList(),
          carouselController: shimmerCarouselController,
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1,
            aspectRatio: 2.0,
            initialPage: 0,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () {
                onTap!(entry.key);
              },
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Themes.shimmerHighlighted
                      .withOpacity(shimmerCurrent == entry.key ? 0.9 : 0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
