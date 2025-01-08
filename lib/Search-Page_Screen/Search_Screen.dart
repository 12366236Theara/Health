import 'package:app_kiloit/Model/home_Model_Api.dart';
import 'package:app_kiloit/Search-Page_Screen/Widget/search_Category.dart';
import 'package:app_kiloit/controller/controller_Get_Api_search_Category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  final List<HomeGridItemData> homeGridItemSearch;

  const SearchScreen({
    super.key,
    required this.homeGridItemSearch,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  final ControllerGetApiSearchCategory searchController =
      Get.put(ControllerGetApiSearchCategory());
  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Container(
            alignment: Alignment.center,
            height: 50,
            padding: EdgeInsets.only(left: 30, right: 10, top: 10, bottom: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 2,
                  ),
                ],
                borderRadius: BorderRadius.circular(30)),
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.mic),
                border: InputBorder.none,
                hintText: 'Search article, information...',
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: GetBuilder<ControllerGetApiSearchCategory>(
              builder: (searchController) {
                return SearchCategory(
                  searchCategories: searchController.searchCategory,
                );
              },
            ),
          ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 12),
          itemCount: widget.homeGridItemSearch.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 230,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.homeGridItemSearch[index].name ?? '',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            widget.homeGridItemSearch[index].description ?? '',
                            style: const TextStyle(color: Colors.grey),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Image.network(
                          widget.homeGridItemSearch[index].thumbnail ?? '',
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
