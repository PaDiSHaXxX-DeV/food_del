import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_devilery/screens/splash_page.dart';
import 'package:food_devilery/utils/my_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sign_page extends StatefulWidget {
  const Sign_page({super.key});

  @override
  State<Sign_page> createState() => _Sign_pageState();
}

final TextEditingController _nameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final _dima = GlobalKey<FormState>();

class _Sign_pageState extends State<Sign_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: My_colors.backround_E5E5E5,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(color: My_colors.F2A902),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            Row(
              children: [
                Container(
                  height: 40,
                  width: 20,
                  color: My_colors.F2A902,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'SIGN IN',
                  style: TextStyle(
                      color: My_colors.F2A902,
                      fontSize: 38,
                      fontWeight: FontWeight.w300),
                )
              ],
            ),
            const SizedBox(
              height: 150,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.63,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: My_colors.F2A902,
                borderRadius: BorderRadius.all(Radius.elliptical(1000, 170)),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.05,
                    top: -50,
                    child: Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height * 0.41,
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
                                    labelText: 'User Name',
                                    labelStyle: TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.0),
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Your User Name';
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
                                  decoration: InputDecoration(
                                    fillColor: Colors.red,
                                    focusColor: Colors.red,
                                    labelText: 'Password',
                                    labelStyle: TextStyle(color: Colors.grey),
                                    suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          Icons.remove_red_eye_outlined),
                                    ),
                                    border: const OutlineInputBorder(
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
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 36, right: 26),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        height: 55,
                                        width: 55,
                                        decoration: const BoxDecoration(
                                            color: My_colors.F2A902,
                                            shape: BoxShape.circle),
                                      ),
                                      Positioned(
                                        left: 20,
                                        top: 20,
                                        child: Container(
                                          height: 55,
                                          width: 55,
                                          decoration: const BoxDecoration(
                                              color: Color(0xFFBE441D),
                                              shape: BoxShape.circle),
                                        ),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                      onTap: () {/**/},
                                      child: Text('Forgot Password?'))
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            InkWell(
                              onTap: () {
                                if (_dima.currentState!.validate()) {
                                  String email = _nameController.text.trim();
                                  String password =
                                      _passwordController.text.trim();
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
                                      "Login",
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
                    ),
                  ),
                  Positioned(
                    bottom: 190,
                    left: MediaQuery.of(context).size.width * 0.48,
                    child: const Text(
                      'Or',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Positioned(
                    bottom: 150,
                    left: 135,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        color: Colors.white,
                        child: Center(
                          child: Image.asset('assets/icons/fac.png'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 150,
                    left: 185,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        color: Colors.white,
                        child: Center(
                          child: Image.asset('assets/icons/Google.png'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 150,
                    left: 235,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        color: Colors.white,
                        child: Center(
                          child: Image.asset('assets/icons/twit.png'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.53,
                    child: Container(
                      width: double.infinity,
                      height: 30,
                      decoration:const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
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
