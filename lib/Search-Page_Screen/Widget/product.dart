import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  
  const Product({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
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
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(fontSize: 16),
                          "What Are the Stages of New Product  Development? "), //of New Product Development?
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          style: TextStyle(color: Colors.grey),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          "How do you prepare for all three stages of")
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image(
                        fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                        image: NetworkImage(
                            "https://cdn.shopify.com/s/files/1/0070/7032/files/product-label-design.jpg?v=1680902906")),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
