import 'package:balangoda_pulse/src/constants/Image_strings.dart';
import 'package:balangoda_pulse/src/constants/colors.dart';
import 'package:balangoda_pulse/src/constants/text_strings.dart';
import 'package:balangoda_pulse/src/features/core/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget{
  const DashboardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: const Icon(
            Icons.menu,
            color: Colors.black
        ),
        title: Text(
            appName,
            style: Theme.of(context).textTheme.headlineSmall
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 20, top: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: cardBgColor
              ),
              child: IconButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileScreen()
                        )
                    );
                  },
                  icon: const Image(image: AssetImage(userProfile))
              )
          )
        ]
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}