import 'package:amazon_clone/constatn/globalvariable.dart';
import 'package:amazon_clone/features/auth/widgets/customelevatedbutton.dart';
import 'package:amazon_clone/features/auth/widgets/textinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AuthScreen extends StatefulWidget {
  static const String routhname = '/authscreen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

enum Auth_name { signin, signup }

class _AuthScreenState extends State<AuthScreen> {
  final signinkey = GlobalKey<FormState>();
  final signupkey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  Auth_name authname = Auth_name.signin;

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariable.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  color: authname == Auth_name.signup
                      ? GlobalVariable.backgroundColor
                      : GlobalVariable.greyBackgroundCOlor,
                  child: ListTile(
                    title: const Text(
                      "Create Account",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: Radio(
                      activeColor: GlobalVariable.secondaryColor,
                      value: Auth_name.signup,
                      groupValue: authname,
                      onChanged: ((value) => setState(() {
                            authname = value!;
                          })),
                    ),
                  ),
                ),
              ),
              if (authname == Auth_name.signup)
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    color: GlobalVariable.backgroundColor,
                    child: Form(
                      key: signinkey,
                      child: Column(
                        children: [
                          CustomTextInputfeild(
                            controller: _nameController,
                            hint: "Name",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextInputfeild(
                            controller: _emailController,
                            hint: "Email",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextInputfeild(
                            controller: _passwordController,
                            hint: "Password",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomElevatedBustton(text: "Sign up", ontap: () {})
                        ],
                      ),
                    ),
                  ),
                ),
              Container(
                color: authname == Auth_name.signin
                    ? GlobalVariable.backgroundColor
                    : GlobalVariable.greyBackgroundCOlor,
                child: ListTile(
                  title: const Text(
                    "Sign-in",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Radio(
                    activeColor: GlobalVariable.secondaryColor,
                    value: Auth_name.signin,
                    groupValue: authname,
                    onChanged: ((value) => setState(() {
                          authname = value!;
                        })),
                  ),
                ),
              ),
              if (authname == Auth_name.signin)
                Container(
                  padding: EdgeInsets.all(8),
                  color: GlobalVariable.backgroundColor,
                  child: SingleChildScrollView(
                    child: Form(
                      key: signinkey,
                      child: Column(
                        children: [
                          CustomTextInputfeild(
                            controller: _emailController,
                            hint: "Email",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextInputfeild(
                            controller: _passwordController,
                            hint: "Password",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomElevatedBustton(text: "Sign in", ontap: () {})
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
