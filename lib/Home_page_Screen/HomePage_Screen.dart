import 'package:app_kiloit/Home_page_Screen/Slider.dart';
import 'package:app_kiloit/Home_page_Screen/component/home_grid_view.dart';
import 'package:app_kiloit/Home_page_Screen/widget/home_tabar.dart';
import 'package:app_kiloit/Model/home_Model_Categories.dart';

import 'package:app_kiloit/controller/contrlller_connetinternet.dart';
import 'package:app_kiloit/controller/controller.dart';
import 'package:app_kiloit/Home_page_Screen/widget/search_bar.dart';
import 'package:app_kiloit/Search-Page_Screen/Search_Screen.dart';
import 'package:app_kiloit/controller/controlller_No_Intenet.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomepageScreen extends StatefulWidget {
  // final List<CategoriesIpi> categories;
  const HomepageScreen({
    super.key,
    required List categories,
  });

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  
  HomeController homeController = Get.put(HomeController());
  final network = Get.find<Connetinernet>();
  NetworkController networks = Get.put(NetworkController());
  @override
  void initState() {
    homeController.homeSlide;

    // _handlegetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(
                  0xffa6d1f8,
                ),
              ),
              child: const Icon(
                Icons.person,
                size: 30,
                color: Colors.blue,
              ),
            )),
        elevation: 0,
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SearchBarHome(
                  onTap: () => Get.to(
                    () => SearchScreen(
                      homeGridItemSearch: homeController.homeGridItem,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Image Slider
                ImageSlider(),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
                  child: Text(
                    "All Categories",
                    style: TextStyle(fontSize: 17, color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<HomeController>(
                  builder: (contrller) {
                    return HomeTabar(
                      item: contrller.categoryItem,
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(height: 10),
                StreamBuilder<List<ConnectivityResult>>(
                    stream: network.connectivity.onConnectivityChanged,
                    builder: (context, snapshot) {
                      return InterNetChecker(
                        snapshot: snapshot,
                        widget: GetBuilder<HomeController>(
                          builder: (controller) => HomeGridView(
                            homeGridItem: homeController.homeGridItem,
                          ),
                        ),
                      );
                    })
              ]),
        ],
      ),
    );
  }
}

class InterNetChecker extends StatelessWidget {
  final AsyncSnapshot<List<ConnectivityResult>> snapshot;
  final Widget widget;
  const InterNetChecker(
      {super.key, required this.snapshot, required this.widget});
  @override
  Widget build(BuildContext context) {
    print(snapshot.connectionState.toString());
    switch (snapshot.connectionState) {
      case ConnectionState.active:
        final state = snapshot.data![0];
        switch (state) {
          case ConnectivityResult.none:
            return Center(child: Text("No Cononnectivity"));
          default:
            Get.find<HomeController>().getUHomeGridItem();
            return widget;
        }
      default:
        Get.find<HomeController>().getUHomeGridItem();
        return widget;
    }
  }
}
