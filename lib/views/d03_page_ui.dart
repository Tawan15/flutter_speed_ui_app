import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class D03PageUi extends StatefulWidget {
  const D03PageUi({super.key});

  @override
  State<D03PageUi> createState() => _D03PageUIState();
}

class _D03PageUIState extends State<D03PageUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // 1. ปุ่มย้อนกลับ
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: const Icon(Icons.arrow_back_ios_new, size: 20),
                ),
              ),

              const SizedBox(height: 30),
              // แก้ไขข้อความเป็น Hello! Register to get started
              Text(
                "Hello! Register to get\nstarted",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1E232C),
                ),
              ),
              const SizedBox(height: 30),

              // --- ส่วนที่แก้สี Hint Text ---
              _buildTextField("Username", hintColor: const Color(0xFF8391A1)),
              const SizedBox(height: 15),
              _buildTextField("Email", hintColor: const Color(0xFF8391A1)),
              const SizedBox(height: 15),
              _buildTextField("Password", hintColor: const Color(0xFF8391A1)),
              const SizedBox(height: 15),
              _buildTextField("Confirm password", hintColor: const Color(0xFF8391A1)),

              const SizedBox(height: 30),
              
              // 2. ปุ่ม Register (เปลี่ยนจากชื่อ Login เป็น Register ให้ตรงหน้า)
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E232C),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text("Register", style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),

              const SizedBox(height: 35),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey.shade300)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Or Register with", style: TextStyle(color: Colors.grey)),
                  ),
                  Expanded(child: Divider(color: Colors.grey.shade300)),
                ],
              ),

              const SizedBox(height: 25),

              // 3. ปุ่มโซเชียล
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _socialButton('assets/images/facebook1.png'),
                  const SizedBox(width: 15),
                  _socialButton('assets/images/google.png'),
                  const SizedBox(width: 15),
                  _socialButton('assets/images/apple.png'),
                ],
              ),

              const SizedBox(height: 40),
              // ข้อความกลับไปหน้า Login
              Center(
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.poppins(color: const Color(0xFF1E232C)),
                      children: [
                        const TextSpan(text: "Already have an account? "),
                        TextSpan(
                          text: "Login Now",
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF35C2C1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialButton(String imagePath) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 90,
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Image.asset(imagePath, width: 30, height: 30, fit: BoxFit.contain),
        ),
      ),
    );
  }

  // เพิ่มพารามิเตอร์ hintColor เพื่อเปลี่ยนสีได้ตามต้องการ
  Widget _buildTextField(String hint, {bool isPassword = false, Color hintColor = Colors.grey}) {
    return TextField(
      obscureText: isPassword,
      style: GoogleFonts.poppins(color: const Color(0xFF1E232C)),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(color: hintColor), // แก้ไขสีฟอนต์คำใบ้ที่นี่
        fillColor: const Color(0xFFF7F8F9),
        filled: true,
        suffixIcon: isPassword ? const Icon(Icons.visibility_outlined, color: Color(0xFF8391A1)) : null,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFE8ECF4)),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF35C2C1)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}