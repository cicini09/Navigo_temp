import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void signUp() {
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      print("Please fill in all fields. (U clicked Sign up)");
      return;
    }

    if (password != confirmPassword) {
      print("Passwords do not match.");
      return;
    }

    print("Account Created Successfully!");
    print("Email: $email");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png', height: 80),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child:Text(
                    'Register',
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child:Text(
                    'Create your account',
                    style: GoogleFonts.poppins(fontSize: 16, color: Color.fromARGB(255, 59, 59, 59)),
                  ),
                ),
                SizedBox(height: 20),
                CustomTextField(controller: emailController, hintText: 'Email', icon: Icons.email),
                CustomTextField(controller: passwordController, hintText: 'Password', icon: Icons.lock, isPassword: true),
                CustomTextField(controller: confirmPasswordController, hintText: 'Confirm Password', icon: Icons.lock, isPassword: true),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 65, 105, 255),
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: signUp,
                    child: Text('Sign up', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
                SizedBox(height: 20),
                Text('Or sign up with:   ', style: GoogleFonts.poppins(fontSize: 14, color: Color.fromARGB(255, 59, 59, 59))),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //------------Google Icon
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: Image.asset('assets/google_icon.png', height: 24),
                        onPressed: () {
                          print("Wow such magic. (Google)");
                        },
                      ),
                    ),
                    SizedBox(width: 20),
                    //------------Facebook Icon
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: Image.asset('assets/facebook_icon.png', height: 24),
                        onPressed: () {
                          print("Wow amazing. (Facebook)");
                        },
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?', style: GoogleFonts.poppins(fontSize: 14)),
                    TextButton(
                      onPressed: () {
                        print("Login Clicked!");
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginForm()), // Updated name
                        );*/
                      },
                      child: Text('Login', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool isPassword;

  const CustomTextField({
    required this.controller,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = true; // Controls password visibility

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword ? _isObscured : false,
        decoration: InputDecoration(
          hintText: widget.hintText,
          filled: true,
          fillColor: Colors.grey[200],
          prefixIcon: Icon(widget.icon, color: Colors.grey),
          suffixIcon: widget.isPassword
              ? IconButton(
            icon: Icon(
              _isObscured ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _isObscured = !_isObscured; // Toggle password visibility
              });
            },
          )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const SocialButton({
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: IconButton(
        icon: FaIcon(icon, color: color),
        onPressed: () {},
      ),
    );
  }
}
