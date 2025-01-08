import 'package:app_kiloit/Detail-Page_Screen/Detail-Page_Screen.dart';
import 'package:app_kiloit/Model/home_Model_Api.dart';
import 'package:app_kiloit/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// ignore: must_be_immutable
class HomeGridView extends StatelessWidget {
  final List<HomeGridItemData> homeGridItem;
  HomeGridView({super.key, required this.homeGridItem});

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: homeGridItem.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          mainAxisExtent: 220,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          final itemGrid = homeGridItem[index];
          return InkWell(
            onTap: () => Get.to(
              () => DetailPageScreen(
                itemid: itemGrid.id ?? 0,
              ),
            ),
            child: Card(
              color: Colors.white,
              elevation: 2,
              shadowColor: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.network(
                      width: double.infinity,
                      itemGrid.thumbnail ?? "",
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          itemGrid.name ?? "",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          textAlign: TextAlign.start,
                          itemGrid.createdAt ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
