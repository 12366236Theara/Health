import 'package:app_kiloit/controller/controller.dart';
import 'package:app_kiloit/controller/controlller_No_Intenet.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    super.key,
  });

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  HomeController homeController = Get.put(HomeController());
  NetworkController networks = Get.put(NetworkController());
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!networks.isConnectToInternet.value) {
        return const Center(
          child: Icon(
            Icons.signal_wifi_connected_no_internet_4_outlined,
            size: 100,
          ),
        );
      }
      if (homeController.homeSlide.isEmpty) {
        return const Center(child: Text('No images available'));
      } else {
        return Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: CarouselSlider(
                items: homeController.homeSlide
                    .map(
                      (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 17),
                          child: Container(
                            height: MediaQuery.of(context).size.width /
                                2.97, // Responsive height
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  20), // Rounded corners for smoothness
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 3,

                                  offset: Offset(0, 1), // Shadow effect
                                ),
                              ],

                              image: DecorationImage(
                                fit: BoxFit
                                    .cover, // Ensures the image fits within the box
                                image: NetworkImage(
                                    index), // Assuming HomeModelApiInfo has imagePath property
                              ),
                            ),
                          )),
                    )
                    .toList(),
                options: CarouselOptions(
                  viewportFraction: 1,

                  height: MediaQuery.of(context).size.width /
                      2.97, // Ensure height remains consistent
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 4),
                  autoPlayAnimationDuration:
                      const Duration(milliseconds: 800), // Slow transitions
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedSmoothIndicator(
                    effect: const WormEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      activeDotColor:
                          Colors.white, // Make active dot more visible
                    ),
                    activeIndex: currentIndex,
                    count: homeController.homeSlide.length,
                  ),
                ],
              ),
            ),
          ],
        );
      }
    });
  }
}
