import 'package:final_project_start/JSON/User.dart';
import 'package:final_project_start/users_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:final_project_start/constants.dart';
import 'dart:convert';

import 'drawer.dart';

Future<List<User>> _fetchUser() async {
  final response = await http.get(Uri.parse(URL_GET_USERS_LIST));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((user) => User.fromJson(user)).toList();
  } else {
    throw Exception('Ошибка загрузки');
  }
}

ListView _usersListView(data) {
  return ListView.separated(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _userListTile(
          index,
          data,
          data[index].userId,
          data[index].name,
          data[index].email,
          context,
        );
      },
      separatorBuilder: (BuildContext context, index) {
        return Divider(
          thickness: 1,
          color: Theme.of(context).dividerColor,
        );
      });
}

Container _userListTile(
  index,
  data,
  int userId,
  String userName,
  String userEmail,
  BuildContext context,
) {
  return Container(
    padding: const EdgeInsets.all(5),
    child: ListTile(
      title: Text.rich(
        TextSpan(
            text: 'Пользователь $userId\n',
            style: Theme.of(context).textTheme.subtitle1,
            children: <TextSpan>[
              TextSpan(
                text: userName,
                style: Theme.of(context).textTheme.headline5,
              ),
            ]),
        textAlign: TextAlign.center,
      ),
      subtitle: Text(userEmail, textAlign: TextAlign.right),
      tileColor: index.isEven ? Colors.blue.shade200 : Colors.grey.shade300,
      selectedTileColor: Theme.of(context).focusColor,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const InfoDouble(),
                settings: RouteSettings(
                  arguments: data[index],
                )));
      },
    ),
  );
}
// Container(padding: const EdgeInsets.all(5),
// alignment: Alignment.centerRight,

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<User>> futureUsers;
  late List<User> userList;

  @override
  void initState() {
    super.initState();
    futureUsers = _fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Список пользователей'), actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/aboutScreen');
            },
            icon: const Icon(Icons.info)),
      ]),
      drawer: const BuildDrawer(),
      body: Center(
        child: FutureBuilder<List<User>>(
            future: futureUsers,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                userList = snapshot.data!;
                return _usersListView(userList);
              } else if (snapshot.hasError) {
                return Text('Произошла ошибка:\n${snapshot.error}');
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
