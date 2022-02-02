import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return  Scaffold(appBar: AppBar(
          title: const Text('Итоговый проект'),

          toolbarHeight: 40,),
          body: Container(
            //decoration: const BoxDecoration(
              //image: DecorationImage(
               // image: AssetImage('assets/bird.jpg'),
           //     fit: BoxFit.cover,
           //   ),
           // ),
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: SingleChildScrollView(
              child: Column(children: const [
                SizedBox(height: 10,),
                Text(
                  'TODO\nна Flutter',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 157,height: 90,
                  child: Image(image: AssetImage('assets/bird.png'),),),
                SizedBox(height: 19,),
                AuthForm(),
                SizedBox(height: 28,),
                ],),
            ),
          )
      );
  }
}

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  static const borderStile = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(36)),
      borderSide: BorderSide(
          color: Color(0xFFeceff1), width: 2
      )
  );
  static const borderFocusStile = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(36)),
      borderSide: BorderSide(
          color: Color(0xFF0079D0), width: 2
      )
  );
  static const linkTextStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Color(0xFF0079D0)
  );

  final _loginText = TextEditingController();
  final _passwordText = TextEditingController();
  String? errorText;

  void _auth() {
    _loginText.text;
    _passwordText.text;
    if(_loginText.text == '9995556677'&& _passwordText.text=='admin') {
      errorText = null;
      Navigator.pushReplacementNamed(context, '/homePage');
    }
    else {errorText="!!! Не верный телефон или пароль !!!";}
  setState(() {

  });
  }



  @override

  Widget build(BuildContext context) {
    final errorText=this.errorText;
    return Column(children: [
      const Text("введите логин\n (номер телефона 10 цифр)",textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.6)),),
      const SizedBox(height: 19,),
      TextField(
        controller: _loginText,
        //textInputAction: '+7',
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          prefix: Text('+7'),
          //hintText: "введите номер телефона",
          filled: true,
          fillColor: Color(0xFFeceff1),
          enabledBorder: borderStile,
          focusedBorder: borderFocusStile,
          labelText: 'Телефон',
        ),
      ),
      const SizedBox(height: 19,),
      TextField(
        controller: _passwordText,
        obscureText: true,
        obscuringCharacter: '*',
        decoration: const InputDecoration(
          // hintText: "введите пароль",
          filled: true,
          fillColor: Color(0xFFeceff1),
          enabledBorder: borderStile,
          focusedBorder: borderFocusStile,

          labelText: 'Пароль',
        ),
      ),

      SizedBox(height: 28,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(errorText ?? '',
            style: const TextStyle(color: Colors.deepOrange),),
        ),),

      SizedBox(width: 154, height:42, child:
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFF0079D0),
          shape: RoundedRectangleBorder(
            borderRadius:  BorderRadius.circular(36.0),

            ),

        ),
        onPressed: _auth,
        child: const Text('Войти'),
      )
      ),
      // const SizedBox(height: 42,),
      // InkWell(child: const  Text('Регистрация',
      //   style: linkTextStyle,),
      //     onTap: () {}),
      // const SizedBox(height: 19,),
      // InkWell(child: const Text('Забыли пароль?', style: linkTextStyle,),
      //     onTap: () {})

    ]
    );
  }
}
