import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vitapmate/constants.dart';
import 'package:vitapmate/router/route_names.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
      child: BottomNavigationBar(
        currentIndex: selectedIndex,

        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          switch (index) {
            case 0:
              GoRouter.of(context).goNamed(RouteNames.timetablePageRoutename);
              break;
            case 1:
              GoRouter.of(context).goNamed(RouteNames.attendanceRoutename);
              break;
            case 2:
              GoRouter.of(context).goNamed(RouteNames.vtoputilsRoutename);
              break;
            case 3:
              GoRouter.of(context).goNamed(RouteNames.socialRouteName);
              break;
          }
        },
        items: [
          _buildNavItem(
            Icons.table_chart_outlined,
            Icons.table_chart,
            'Timetable',
            0,
          ),
          _buildNavItem(Icons.book_outlined, Icons.book, 'Attendance', 1),
          _buildNavItem(Icons.view_cozy_outlined, Icons.view_cozy, 'Others', 2),
          _buildNavItem(Icons.token_outlined, Icons.token, 'Social ', 3),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    IconData icon,
    IconData sicon,
    String label,
    int index,
  ) {
    final bool isSelected = selectedIndex == index;

    return BottomNavigationBarItem(
      icon: Stack(
        alignment: Alignment.center,
        children: [
          if (isSelected)
            Container(
              width: 48,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.secondary.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          if (isSelected) Icon(icon),
          if (!isSelected) Icon(sicon),
        ],
      ),
      label: isSelected ? label : '',
    );
  }
}
