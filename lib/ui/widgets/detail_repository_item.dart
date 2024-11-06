import 'package:flutter/material.dart';
import 'package:git_repository/core/util/util.dart';

class DetailRepositoryItem extends StatelessWidget {
  const DetailRepositoryItem({
    super.key,
    required this.avatarColor,
    required this.avatarIcon,
    required this.itemName,
    required this.itemDetail,
  });

  final Color avatarColor;
  final IconData avatarIcon;
  final String itemName;
  final String itemDetail;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: avatarColor,
          radius: 16,
          child: Icon(
            avatarIcon,
            color: Colors.white,
            size: 20,
          ),
        ),
        SizedBox(width: 10),
        Text(
          itemName,
          style: repositoryInfoItem,
        ),
        Spacer(),
        Text(
          itemDetail,
          style: repositoryInfoItem,
        ),
      ],
    );
  }
}
