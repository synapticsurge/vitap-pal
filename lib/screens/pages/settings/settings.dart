import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vitapmate/router/route_names.dart';
import 'package:vitapmate/constants.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = ['credentials', 'features'];
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: ListView.builder(
        itemCount: items.length,

        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.backgroundDark,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.backgroundDark, width: 20),
            ),
            child: ListTile(
              title: Text(
                items[index],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                switch (items[index]) {
                  case "features":
                    GoRouter.of(
                      context,
                    ).pushNamed(RouteNames.featuresRouteName);
                    break;
                  case "credentials":
                    GoRouter.of(context).pushNamed(RouteNames.credsRouteName);
                    break;
                }
              },
            ),
          );
        },
      ),
    );
  }
}
