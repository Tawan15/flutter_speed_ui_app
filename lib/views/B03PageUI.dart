import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app/views/B02PageUI.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class B03pageui extends StatefulWidget {
  const B03pageui({super.key});

  @override
  State<B03pageui> createState() => _B03pageuiState();
}

class _B03pageuiState extends State<B03pageui> {
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
                const SizedBox(height: 30),

                // 1. ปุ่มย้อนกลับ
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.arrow_back_ios_new,
                        color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                const SizedBox(height: 30),

                // 2. หัวข้อ Create Account
                Text(
                  "Create Account",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F41BB),
                  ),
                ),

                const SizedBox(height: 10),

                // 3. คำบรรยาย
                Text(
                  "Create an account so you can explore all the existing jobs",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 40),

                // 4. ช่องกรอกข้อมูล (เรียกใช้ฟังก์ชันที่แก้ใหม่ด้านล่าง)
                _buildInput("Email"),
                const SizedBox(height: 20),
                _buildInput("Password", isPassword: true),
                const SizedBox(height: 20),
                _buildInput("Confirm Password", isPassword: true),

                const SizedBox(height: 40),

                // 5. ปุ่ม Sign up
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1F41BB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      shadowColor: Color(0xFF1F41BB).withOpacity(0.5),
                    ),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // 6. กลับไปหน้า Login
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const B02pageui()),
                    );
                  },
                  child: Text(
                    "Already have an account",
                    style: GoogleFonts.inter(
                      color: const Color.fromARGB(255, 86, 86, 86),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // 7. Or continue with
                Text(
                  "Or continue with",
                  style: GoogleFonts.inter(
                    color: Color(0xFF1F41BB),
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                // 8. ปุ่ม Social
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

  // --- ฟังก์ชันที่แก้ไขใหม่: ทำให้มีกรอบสีขึ้นเวลา Focus ---
  Widget _buildInput(String hint, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFFF1F4FF), // สีเทาอ่อนเดิมที่คุณใช้

        // สีกรอบตอนที่กดเลือก (Focus)
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color:
                Colors.blueAccent, // เปลี่ยนเป็นสีกรอบที่คุณต้องการเวลา Focus
            width: 2.0,
          ),
        ),

        // สีกรอบตอนปกติ (ไม่ได้กด)
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color.fromARGB(0, 250, 37, 37), // ซ่อนกรอกปกติให้ดูคลีนเหมือนเดิม
          ),
        ),

        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      ),
    );
  }

  Widget _squareSocial(IconData icon) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: const Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.black,
            size: 28,
          ),
        ),
      ),
    );
  }
}
