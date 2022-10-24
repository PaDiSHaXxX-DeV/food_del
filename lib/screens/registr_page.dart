import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_devilery/screens/splash_page.dart';
import 'package:food_devilery/utils/my_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Registr_page extends StatefulWidget {
  const Registr_page({super.key});

  @override
  State<Registr_page> createState() => _Registr_pageState();
}

class _Registr_pageState extends State<Registr_page> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _dima = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: My_colors.F2A902,
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(color: Colors.white),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 20,
                color: Colors.white,
              ),
              const SizedBox(
                width: 20,
              ),
              const Text(
                'REGISTER',
                style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w200,
                    color: Colors.white),
              )
            ],
          ),
          const SizedBox(
            height: 68,
          ),
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Form(
              key: _dima,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 18),

                  Padding(
                    padding: const EdgeInsets.all(10.0),

                    //! ++++++++++++++++++++++++++++++++++++++++
                    child: Container(
                      //height: double.infinity,
                      //width: double.infinity,
                      child: TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          fillColor: Colors.red,
                          focusColor: Colors.red,
                          labelText: 'First Name',
                          labelStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Your First Name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          fillColor: Colors.red,
                          focusColor: Colors.red,
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Your Email';
                          }
                          return null;
                        }),
                  ),
                  //!!==============================================
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          fillColor: Colors.red,
                          focusColor: Colors.red,
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Your password';
                          }
                          return null;
                        }),
                  ),
                  //!!==============================================

                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1,color: My_colors.F2A902),
                                shape: BoxShape.circle, color: Colors.white),
                          ),
                          Container(
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: My_colors.F2A902),
                          ),
                          Container(
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1,color: My_colors.F2A902),
                                shape: BoxShape.circle, color: Colors.white),
                          ),

                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (_dima.currentState!.validate()) {
                        String email = _nameController.text.trim();
                        String password = _passwordController.text.trim();
                        saveLogin(context);
                      }
                    },
                    child: Container(
                      height: 40,
                      width: 282,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          My_colors.F2A902,
                          Color.fromARGB(255, 252, 188, 38),
                          Color.fromARGB(255, 255, 200, 72)
                        ]),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            width: 110,
                          ),
                          Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            width: 97,
                          ),
                          Icon(
                            Icons.navigate_next_rounded,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

void saveLogin(context) async {
  SharedPreferences _pref = await SharedPreferences.getInstance();
  _pref.setBool("isLoggedIn", true);
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => Splash_page()));
}
