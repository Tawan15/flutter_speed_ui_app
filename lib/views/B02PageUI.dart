import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app/views/B03PageUI.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class B02pageui extends StatefulWidget {
  const B02pageui({super.key});

  @override
  State<B02pageui> createState() => _B02pageuiState();
}

class _B02pageuiState extends State<B02pageui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              children: [
                const SizedBox(height: 40),

                // 1. ปุ่มย้อนกลับ
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.arrow_back_ios_new,
                        color: Colors.black, size: 22),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                const SizedBox(height: 30),

                // 2. หัวข้อ Login
                Text(
                  "Login here",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1F41BB), // สีน้ำเงินเข้มตามดีไซน์
                  ),
                ),

                const SizedBox(height: 20),

                // 3. คำบรรยาย
                Text(
                  "Welcome back you've\nbeen missed!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    height: 1.3,
                  ),
                ),

                const SizedBox(height: 40),

                // 4. ช่องกรอกข้อมูล (เปลี่ยนมาใช้ _buildTextField ตัวที่มีสีกรอบ)
                _buildTextField("Email"),
                const SizedBox(height: 20),
                _buildTextField("Password", isPassword: true),

                const SizedBox(height: 15),

                // 5. Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot your password ?",
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF1F41BB),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 6. ปุ่ม Sign in
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1F41BB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      shadowColor: const Color(0xFF1F41BB).withOpacity(0.4),
                    ),
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // 7. Create new account
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const B03pageui()),
                    );
                  },
                  child: Text(
                    "Create new account",
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF494949),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                // 8. Or continue with
                Text(
                  "Or continue with",
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF1F41BB),
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 20),

                // 9. ปุ่ม Social
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _squareSocial(FontAwesomeIcons.google),
                    const SizedBox(width: 15),
                    _squareSocial(FontAwesomeIcons.facebookF),
                    const SizedBox(width: 15),
                    _squareSocial(FontAwesomeIcons.apple),
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

  // --- Widget TextField ตัวที่แก้ไขให้มีสีกรอบตอนกด (Focus) ---
  Widget _buildTextField(String hint, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFFC2C2C2), fontSize: 16),
        filled: true,
        fillColor: const Color(0xFFF1F4FF), // สีฟ้าอ่อนตามดีไซน์ B02

        // สีกรอบตอนกด (Focus)
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFF1F41BB), // สีน้ำเงินเข้ม
            width: 2.0,
          ),
        ),

        // สีกรอบปกติ (ตอนยังไม่กด)
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),

        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      ),
    );
  }

  Widget _squareSocial(IconData icon) {
    return Container(
      height: 50,
      width: 60,
      decoration: BoxDecoration(
        color: const Color(0xFFECECEC),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: () {},
        icon: FaIcon(icon, color: Colors.black, size: 22),
      ),
    );
  }
}
