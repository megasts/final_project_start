import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'JSON/User.dart';
import 'JSON/todos.dart';
import 'constants.dart';
import 'drawer.dart';

Future<List<Todos>> fetchTodos(client, userId) async {
  final response =
      await client.get(Uri.parse(URL_GET_USERS_TASKS + userId.toString()));

  return parseTodos(response.body);
}

List<Todos> parseTodos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Todos>((json) => Todos.fromJson(json)).toList();
}

class InfoDouble extends StatefulWidget {
  const InfoDouble({Key? key}) : super(key: key);

  @override
  State<InfoDouble> createState() => _InfoDoubleState();
}

class _InfoDoubleState extends State<InfoDouble> {
  late List<Todos> todosList;
  late List<Todos> todosListUser;
  @override
  Widget build(BuildContext context) {
    final userList = ModalRoute.of(context)!.settings.arguments as User;
    final appTitle = 'Пользователь № ${userList.userId}';

    return Scaffold(
      appBar: AppBar(title: Text(appTitle), actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/aboutScreen');
            },
            icon: const Icon(Icons.info)),
        TextButton(
            onPressed: () {
              if (!ModalRoute.of(context)!.isFirst) {
                Navigator.pop(context);
              }
            },
            child: const Text(
              'Назад',
              style: TextStyle(color: Colors.black),
            ))
      ]),
      drawer: const BuildDrawer(),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(1),
                margin: const EdgeInsets.all(5),
                child: (Card(
                  elevation: 2,
                  color: const Color(0xffb2ebf2),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            userList.name,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Text('Логин: ${userList.username}'),
                        Text('E-mail: ${userList.email}'),
                        Text('Почтовый адрес: '
                            'улица ${userList.address.street}, '
                            'офис ${userList.address.suite}, '
                            'город ${userList.address.city}, '
                            'индекс ${userList.address.zipcode},\n'
                            '(данные геолокации: ${userList.address.geo.lng},'
                            '${userList.address.geo.lat})'),
                        Text('Телефон: ${userList.phone}'),
                        Text('Сайт: ${userList.website}'),
                        Text('Место работы: ${userList.company.name}'),
                        Text('Крылатая фраза: ${userList.company.catchPhrase}'),
                        Text('Сфера деятельности: ${userList.company.bs}'),
                      ],
                    ),
                  ),
                )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Text("Список задач:",
                style: Theme.of(context).textTheme.headline6),
          ),
          Expanded(
            flex: 9,
            child: (FutureBuilder<List<Todos>>(
                future: fetchTodos(http.Client(), userList.userId),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Ошибка загрузки'),
                    );
                  } else if (snapshot.hasData) {
                    todosList = snapshot.data!;
                    int item = todosList.length;
                    return _todosListView(todosList, item);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })),
          )
        ],
      ),
    );
  }
}

ListView _todosListView(todosList, item) {
  return ListView.builder(
    itemCount: todosList.length,
    itemBuilder: (context, index) {
      return _todosListTile(
        todosList[index].taskId,
        todosList[index].title,
        todosList[index].completed,
        context,
      );
    },
  );
}

Container _todosListTile(
    int todoId, String todoTitle, bool completed, context) {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.all(5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: completed ? const Color(0xff80d2f9) : const Color(0xfffFB740),
        border: Border.all()),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: "№ $todoId: ",
            style: Theme.of(context).textTheme.headline6,
            children: <TextSpan>[
              TextSpan(
                  text: " $todoTitle\n",
                  style: const TextStyle(fontStyle: FontStyle.italic)),
            ],
          ),
          textAlign: TextAlign.start,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 15,
              child: Text(
                completed ? "выполнена" : "актуальна",
                style: TextStyle(
                    color: completed ? Colors.green : const Color(0xffef5350)),
              ),
            ),
            Checkbox(
              value: completed ? true : false,
              onChanged: (bool? value) {},
            ),
          ],
        )
      ],
    ),
  );
}
