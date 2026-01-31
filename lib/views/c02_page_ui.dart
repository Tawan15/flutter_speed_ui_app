import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app/views/c03_page_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class C02PageUi extends StatefulWidget {
  const C02PageUi({super.key});

  @override
  State<C02PageUi> createState() => _C02PageUiState();
}

class _C02PageUiState extends State<C02PageUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // --- ส่วน Header: ขยับปุ่มย้อนกลับลงมานิดนึงตามรูป ---
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(Icons.arrow_back_ios_new,
                          color: Colors.black, size: 22),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // 1. โลโก้พร้อมกรอบสีเขียว
                Center(
                  child: Container(
                    width: 95,
                    height: 95,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color(0xFF19C463), // สีเขียวตรงตามต้นฉบับ
                        width: 2.5,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/img10.png',
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(
                                child: Text("H",
                                    style: TextStyle(
                                        color: Color(0xFF19C463),
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 45),

                // 2. หัวข้อ (ปรับสีดำสนิทตามรูป)
                Text(
                  "Sign in your account",
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 40),

                // 3. ช่องกรอกข้อมูล (ปรับสี Label และพื้นหลังเป๊ะๆ)
                _buildInputLabel("Email"),
                _buildTextField("ex: jon.smith@email.com"),
                const SizedBox(height: 20),
                _buildInputLabel("Password"),
                _buildTextField("*********", isPassword: true),
                const SizedBox(height: 35),

                // 4. ปุ่ม SIGN IN (ใช้สีเขียวสด 19C463)
                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF19C463),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "SIGN IN",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                const Text("or sign in with",
                    style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 14)),
                const SizedBox(height: 25),

                // 5. ปุ่ม Social
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _socialSquareButton('assets/images/google.png'),
                    _socialSquareButton('assets/images/facebook1.png'),
                    _socialSquareButton('assets/images/twitter.png'),
                  ],
                ),

                const SizedBox(height: 20),

                // 6. ส่วนท้าย (ปรับสีตามรูป)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? ",
                        style: TextStyle(color: Color(0xFF757575))),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const C03PageUi()),
                        );
                      },
                      child: const Text(
                        "SIGN UP",
                        style: TextStyle(
                          color: Color(0xFF19C463),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ปรับสี Label ให้เป็นสีเทาตามรูป
  Widget _buildInputLabel(String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: GoogleFonts.poppins(
            fontSize: 15,
            color: const Color(0xFF7D7D7D), // สีเทา Label จากรูป
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildTextField(String hint, {bool isPassword = false}) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9), // สีพื้นหลังเทาอ่อนมากตามรูป
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xFFC2C2C2), fontSize: 14),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        ),
      ),
    );
  }

  Widget _socialSquareButton(String imagePath) {
    return Container(
      height: 55,
      width: (MediaQuery.of(context).size.width - 90) / 3,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5), // สีพื้นหลังปุ่ม Social
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child:
            Image.asset(imagePath, width: 26, height: 26, fit: BoxFit.contain),
      ),
    );
  }
}
