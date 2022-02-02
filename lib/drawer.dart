import 'package:flutter/material.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius:
                  const BorderRadius.only(bottomRight: Radius.circular(120))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Итоговый проект',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    child: Image.asset('assets/flutter.png'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'TODO',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              )),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('Главная страница'),
          ),
          ListTile(
            leading: const Icon(Icons.account_box),
            title: const Text('Список пользователей'),
            onTap: () {
              Navigator.pushNamed(context, '/homePage');
            },
          ),
          Divider(
            thickness: 1,
            color: Theme.of(context).dividerColor,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('Страница авторизации'),
          ),
          ListTile(
            leading: const Icon(Icons.accessibility_outlined),
            title: const Text('Выйти для повторной авторизации'),
            onTap: () {
             Navigator.pushNamedAndRemoveUntil  (context, '/auth', ModalRoute.withName('/auth'));
            },
          ),
          Divider(
            thickness: 1,
            color: Theme.of(context).dividerColor,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('О программе'),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('О программе'),
            onTap: () {
              Navigator.pushNamed(context, '/aboutScreen');
            },
          ),
          Divider(
            thickness: 1,
            color: Theme.of(context).dividerColor,
          ),
          // const Padding(
          //   padding: EdgeInsets.only(left: 20),
          //   child: Text('Настройки'),
          // ),
          // ListTile(
          //   leading: const Icon(Icons.settings),
          //   title: const Text('Настройки'),
          //   onTap: () {
          //
          //   },
          // ),
        ],
      ),
    );
  }
}