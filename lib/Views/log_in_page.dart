import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:my_project/Views/sign_up_page.dart';

import 'Styles/Colors.dart';
import 'Styles/StyleText.dart';
import 'Widgets/WidgetBox.dart';

class log_in_page extends StatefulWidget {
  const log_in_page({super.key});

  @override
  State<log_in_page> createState() => _log_in_pageState();
}

class _log_in_pageState extends State<log_in_page> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController input_mail = TextEditingController();
  TextEditingController input_password = TextEditingController();

  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'lib/Views/Styles/Backgrounds/Background_4.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 250, 50, 300),
              child: WidgetBox(
                  SizedBox(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: input_mail,
                                  validator: MultiValidator([
                                    MinLengthValidator(5,
                                        errorText: 'Required field'),
                                    EmailValidator(
                                        errorText: 'Enter a valid mail')
                                  ]),
                                  style: Text_Input_SignIn_Login_White,
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                      hintText: 'Email address',
                                      hintStyle: Text_Hint_SignIn_Login_Blue,
                                      border: InputBorder.none,
                                      prefixIcon: const Icon(
                                        Icons.mail_outline_rounded,
                                        color: Color_Light_Blue,
                                      )),
                                ),
                                TextFormField(
                                  controller: input_password,
                                  obscureText: showPassword,
                                  style: Text_Input_SignIn_Login_White,
                                  autocorrect: false,
                                  enableInteractiveSelection: false,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: Text_Hint_SignIn_Login_Blue,
                                    border: InputBorder.none,
                                    prefixIcon: const Icon(
                                      Icons.password_outlined,
                                      color: Color_Light_Blue,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          showPassword = !showPassword;
                                        });
                                      },
                                      icon: showPassword
                                          ? const Icon(
                                              Icons.visibility,
                                              color: Color_Light_Blue,
                                            )
                                          : const Icon(
                                              Icons.visibility_off,
                                              color: Color_Blue,
                                            ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: InkWell(
                                onTap: () {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  if (_formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Colors.white,
                                        content: Text(
                                          'Validation Successful',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color_Blue,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Log in',
                                      style: Text_Widget_Buttons_Black,
                                    ),
                                  ),
                                ),
                              )),
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const sign_in_page()));
                            },
                            child: Center(
                              child: Text('I do not have an account',
                                  style: Text_Sign_In_Small_Blue),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                  Color_Dark_Gray,
                  Color_Dark_Gray),
            )
          ],
        ),
      ),
    );
  }
}
