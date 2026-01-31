import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app/views/e03_page_ui.dart';
import 'package:flutter_speed_ui_app/views/e04_page_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class E02PageUi extends StatefulWidget {
  const E02PageUi({super.key});

  @override
  State<E02PageUi> createState() => _E02PageUiState();
}

class _E02PageUiState extends State<E02PageUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. ส่วนรูปภาพด้านบน (โค้งมนซ้ายล่างเป๊ะ 100%)
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft:
                          Radius.circular(1), // แก้ไขกลับเป็น 100 ตามต้นฉบับ
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/img4.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back_ios_new,
                          size: 20, color: Color(0xFFFF9124)),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text(
                    "Welcome back",
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Login to your account",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // ช่อง Email
                  _buildTextField("Enter email or phone"),
                  const SizedBox(height: 15),

                  // ช่อง Password พร้อมไอคอนปิดตา
                  _buildTextField("Password", isPassword: true),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const E04PageUi()),
                        );
                      },
                      child: Text(
                        "Forgot Password?",
                        style:
                            GoogleFonts.poppins(color: const Color(0xFFFF9124)),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // ปุ่ม Log In
                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFFCC33), Color(0xFFFF9124)],
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: Text(
                        "Log In",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // --- แก้ไข: ส่วน OR พร้อมเส้นไล่เฉดสีส้ม (Gradient Line) ---
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1.2,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFFFF9124).withOpacity(0.0),
                                const Color(0xFFFF9124),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "OR",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1.2,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFFFF9124),
                                const Color(0xFFFF9124).withOpacity(0.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // --------------------------------------------------

                  const SizedBox(height: 30),

                  // --- ส่วน Social Login ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialImage('assets/images/google.png'),
                      const SizedBox(width: 50),
                      _buildSocialImage('assets/images/facebook2.png'),
                      const SizedBox(width: 50),
                      _buildSocialImage('assets/images/apple.png'),
                    ],
                  ),

                  const SizedBox(height: 40),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an Account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const E03PageUi()),
                        );
                        },
                        child: Text(
                          "Create Account",
                          style: GoogleFonts.poppins(
                            color: const Color(0xFFFF9124),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          hintText: hint,
          hintStyle: GoogleFonts.poppins(color: Colors.grey),
          border: InputBorder.none,
          suffixIcon: isPassword
              ? const Icon(Icons.visibility_off_outlined, color: Colors.grey)
              : null,
        ),
      ),
    );
  }

  Widget _buildSocialImage(String assetPath) {
    return Image.asset(
      assetPath,
      height: 40,
      width: 40,
      fit: BoxFit.contain,
    );
  }
}
