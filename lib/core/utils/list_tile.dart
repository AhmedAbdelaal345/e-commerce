import 'package:final_projects/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ListTileWidget extends StatelessWidget {
  ListTileWidget({required this.imageIcon,required this.text, required this.screan, super.key});
  Widget screan;
  String text;
  String imageIcon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return screan;
            },
          ),
        );
      },
      child: ListTile(
        leading: SvgPicture.asset(imageIcon),
        subtitle: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            '${text}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        trailing: SvgPicture.asset(AppAssets.arrow_next),
      ),
    );
  }
}
