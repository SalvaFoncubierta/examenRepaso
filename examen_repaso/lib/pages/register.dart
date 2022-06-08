import 'package:examen_repaso/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  TextEditingController mailCtrl = TextEditingController();
  TextEditingController nickNameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController confirmPasswordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  registerButton(context),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Center(
                            child: Text(
                              "Registro",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          createTextFormField(
                              "Correo electrónico", mailCtrl, 1, false),
                          textFormFieldEspace(),
                          createTextFormField("NickName", nickNameCtrl, 2, false),
                          textFormFieldEspace(),
                          createTextFormField(
                              "Contraseña", passwordCtrl, 3, true),
                          textFormFieldEspace(),
                          createTextFormField("Confirmar Contraseña",
                              confirmPasswordCtrl, 4, true),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    addUser(mailCtrl, passwordCtrl);
                                    NavigateToLogin(context);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black, onPrimary: Colors.white,),
                                child: Text("Registro"),
                                                          ),
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
      ),
    );
  }

  TextFormField createTextFormField(String labelName,
      TextEditingController ctrl, int numberOfTextFormField, bool obscure) {
    return TextFormField(
      obscureText: obscure,
      decoration: InputDecoration(
          border: const OutlineInputBorder(), labelText: labelName),
      validator: (value) {
        //El 1 es del correo electrónico, el 2 del nickname, el 3 contraseña y el 4 confirmar contraseña
        if (numberOfTextFormField == 1) {
          String pattern =
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
          RegExp regExp = RegExp(pattern);
          if(!regExp.hasMatch(value!)) {
            return "Correo inválido";
          } else {
            return null;
          }
        } else if (numberOfTextFormField == 2) {
          if (value!.length <= 3) {
            return "El nickname debe tener más de 3 caracteres";
          } else if (value.length > 10) {
            return "El nickname no puede tener más de 10 caracteres";
          } else {
            return null;
          }
        } else if (numberOfTextFormField == 3) {
          if (value!.length < 6) {
            return "La contraseña debe tener al menos 6 caracteres";
          } else if (value.length > 10) {
            return "La contraseña no puede tener más de 10 caracteres";
          } else {
            return null;
          }
        } else if (numberOfTextFormField == 4) {
          if( value! != passwordCtrl.text) {
            return "Error, las contraseñas no coinciden";
          } else {
            return null;
          }
        } else {
          return null;
        }
      },
      controller: ctrl,
    );
  }

  SizedBox textFormFieldEspace() {
    return const SizedBox(
      height: 20,
    );
  }

  // ignore: non_constant_identifier_names
  void NavigateToLogin(BuildContext context) {
    Navigator.pop(context);
  }

  Align registerButton(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: TextButton(
        onPressed: () {
          NavigateToLogin(context);
        },
        child: Text("Volver", style: Themes.lightTheme.textTheme.bodyText1),
      ),
    );
  }

  void addUser(TextEditingController emailCtrl, TextEditingController passwordCtrl) {
     FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailCtrl.text, password: passwordCtrl.text);  
  }
}
