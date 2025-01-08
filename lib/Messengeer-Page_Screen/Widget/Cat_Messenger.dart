import 'package:flutter/material.dart';

class CatMessenger extends StatelessWidget {
  const CatMessenger({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 3, left: 16 ,top: 20, bottom:20),
      child: Stack(
        children: [
          const SizedBox(
            height: 65,
            width: 65,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://s3-alpha-sig.figma.com/img/56bb/8acb/2f227843f201021c0855e01bc59be905?Expires=1736121600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=E9i1okjnfLhJ6uito3EcfbIxmvhVkw-3zpHBA0LGrtZ6uku7ydExrZkIsvWZHcgFDYACVLEFeiKtlygvAUcDTzccSNcr3GJdcpG8oO9zI-FTylVg9QlIEMjBKi2LcVKBtZggcDSaGhevw9GXHpjEZWdC69d6USvJHfGNS8iDBgCJ92a3wXZmlzl7PkqFPWPctwizU~Mezi8Oa7EcaEa8oAa86A5W6BX1Z16DDgotkc0WzlfWbU-FmOV4iGuP6sw-r25ZLm92wUxOUA4d8ymIpmoLfc9Dq-ldSitb5JKkTz0BBgRUd7uEe4Eofa~4KQtZQw842PoS-N7dkvqCZxxgOQ__'),
            ),
          ),
          Positioned(
            right: 7,
            bottom: 45,
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            ),
          )
        ],
      ),
    );
  }
}
