import 'package:first_app/logic/bloc/bloc_theme/theme_bloc.dart';
import 'package:first_app/ui/widgets/drawer_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> menu = [
      {
        "title": "Counter bloc",
        "route": "/counter1",
        "trailingIcon": Icons.arrow_forward,
        "leadingIcon": Icons.home,
      },
      {
        "title": "Counter state full",
        "route": "/counter2",
        "trailingIcon": Icons.arrow_forward,
        "leadingIcon": Icons.contact_emergency,
      },
      {
        "title": "Users",
        "route": "/users",
        "trailingIcon": Icons.arrow_forward,
        "leadingIcon": Icons.accessibility_outlined,
      },
    ];
    return Drawer(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const DrawerHeader(
              child: CircleAvatar(
                backgroundImage: AssetImage("images/profile.png"),
                radius: 50,
              ),
            ),
            IconButton(
              onPressed: () {
                context.read<ThemeBloc>().add(SwitchThemeEvent());
              },
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return DrawerItemWidget(
                title: menu[index]["title"],
                leadingIcon: menu[index]["leadingIcon"],
                trailingIcon: menu[index]["trailingIcon"],
                onAction: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, menu[index]["route"]);
                },
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                height: 6,
              );
            },
            itemCount: menu.length,
          ),
        ),
      ],
    ));
  }
}
/* const Divider(height: 3, color: Colors.deepOrange),
          ListTile(
            title: const Text(
              "Contact",
              style: TextStyle(fontSize: 25),
            ),
            leading: const Icon(
              Icons.contact_emergency,
            ),
            trailing: const Icon(Icons.arrow_right),
            // event click contact
            onTap: () {
              Navigator.of(context).pop(); //close menu
              Navigator.pushNamed(context, "/contact");
            },
          ),*/
