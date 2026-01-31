import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class E03PageUi extends StatefulWidget {
  const E03PageUi({super.key});

  @override
  State<E03PageUi> createState() => _E03PageUiState();
}

class _E03PageUiState extends State<E03PageUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. ส่วนรูปภาพด้านบน (โค้งมนซ้ายล่างเหมือนหน้า Login)
            Stack(
              children: [
                Container(
                  // ปรับความสูงเหลือ 0.3 เพื่อให้รูปแสดงแค่นิดเดียวตามที่ส่งมา
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      // ปรับความโค้งมนมุมล่างซ้ายให้โค้งสวยพอดี
                      bottomLeft: Radius.circular(0),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/img4.png'),
                      // ใช้ Alignment.bottomCenter เพื่อล็อคให้เห็นส่วนล่างของรูปที่สวยที่สุด
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // ปุ่มย้อนกลับ (วงกลมขาว ไอคอนส้ม ตามแบบ)
                Positioned(
                  top: 40,
                  left: 20,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_back, // ใช้ไอคอนลูกศรธรรมดาให้เหมือนในรูป
                        size: 20,
                        color: Color(0xFFFF9124),
                      ),
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
                  // 2. หัวข้อ Register
                  Text(
                    "Register",
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Create your new account",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 25),

                  // 3. ช่องกรอกข้อมูลต่างๆ
                  _buildTextField("Name"),
                  const SizedBox(height: 10),
                  _buildTextField("E-mail"),
                  const SizedBox(height: 10),
                  _buildTextField("Phone"),
                  const SizedBox(height: 10),
                  _buildTextField("Password", isPassword: true),

                  const SizedBox(height: 20),

                  // 4. ข้อความ Terms & Conditions (เหมือนเป๊ะตามรูป)
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 13),
                      children: [
                        const TextSpan(text: "By signing up you agree to our "),
                        TextSpan(
                          text: "Terms & Conditions",
                          style: GoogleFonts.poppins(
                            color: const Color(0xFFFF9124),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        const TextSpan(text: "\nand "),
                        TextSpan(
                          text: "Privacy Policy",
                          style: GoogleFonts.poppins(
                            color: const Color(0xFFFF9124),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // 5. ปุ่ม Sign Up (Gradient)
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
                        "Sign Up",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // 6. ส่วน OR พร้อมลายเส้นไล่เฉดสี
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

                  const SizedBox(height: 30),

                  // 7. ส่วน Social Icons (เว้นไว้ใส่รูป Google, Facebook, Apple)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialImage('assets/images/google.png'),
                      const SizedBox(width: 40),
                      _buildSocialImage('assets/images/facebook2.png'),
                      const SizedBox(width: 40),
                      _buildSocialImage('assets/images/apple.png'),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // 8. ส่วน Log In ท้ายหน้า
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an Account? "),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Text(
                          "Log In",
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

  // Widget สำหรับช่องกรอกข้อมูล
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
        ),
      ),
    );
  }

  // Widget สำหรับรูป Social
  Widget _buildSocialImage(String assetPath) {
    return Image.asset(
      assetPath,
      height: 35, // ปรับขนาดให้พอดีตามแบบ
      width: 35,
      fit: BoxFit.contain,
    );
  }
}
