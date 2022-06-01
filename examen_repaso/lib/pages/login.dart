import 'package:examen_repaso/utils/roots.dart';
import 'package:flutter/material.dart';

import '../themes/themes.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  TextEditingController nickNameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      registerButton(context),
                      SizedBox(
                          width: 270,
                          height: 270,
                          child: Image.asset('lib/assets/logo.png'))
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nickNameCtrl,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "NickName"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: passwordCtrl,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Contraseña"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            NavigateToBattleship(context);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.black, onPrimary: Colors.white),
                          child: const Text("Login"),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void NavigateToRegister(BuildContext context) {
    Navigator.pushNamed(context, Roots.register);
  }

  // ignore: non_constant_identifier_names
  void NavigateToBattleship(BuildContext context) {
    if (validateUser(context)) {
      Navigator.pushNamed(context, Roots.battleship);
    }
  }

  Align registerButton(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () {
          NavigateToRegister(context);
        },
        child: Text("Registrar", style: Themes.lightTheme.textTheme.bodyText1),
      ),
    );
  }

  bool validateUser(BuildContext context) {
    if (nickNameCtrl.text.isEmpty || passwordCtrl.text.isEmpty) {
      const snackBar = SnackBar(
        content: Text('Error, rellena todos los campos.'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    } else {
      return true;
    }
  }
}
