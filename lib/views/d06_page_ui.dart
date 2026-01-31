import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app/views/d07_page_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class D06PageUI extends StatefulWidget {
  const D06PageUI({super.key});

  @override
  State<D06PageUI> createState() => _D06PageUIState();
}

class _D06PageUIState extends State<D06PageUI> {
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
              _backButton(context),

              const SizedBox(height: 30),

              // 2. หัวข้อ Create new password
              Text(
                "Create new password",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1E232C),
                ),
              ),
              
              const SizedBox(height: 10),

              // 3. คำอธิบาย
              Text(
                "Your new password must be unique from those previously used.",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color(0xFF8391A1),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 30),

              // 4. ช่องกรอกรหัสผ่านใหม่
              _buildTextField("New Password", isPassword: true, hintColor: const Color(0xFF8391A1)),
              const SizedBox(height: 15),
              _buildTextField("Confirm Password", isPassword: true, hintColor: const Color(0xFF8391A1)),

              const SizedBox(height: 30),

              // 5. ปุ่ม Reset Password
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const D07PageUI()),
                    );
                    // ไปยังหน้า Password Changed Success
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E232C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Reset Password",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ฟังก์ชันสร้าง TextField ที่คุณใช้ในหน้าอื่นๆ
  Widget _buildTextField(String hint, {bool isPassword = false, Color hintColor = Colors.grey}) {
    return TextField(
      obscureText: isPassword,
      style: GoogleFonts.poppins(color: const Color(0xFF1E232C)),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(color: hintColor),
        fillColor: const Color(0xFFF7F8F9),
        filled: true,
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

  Widget _backButton(BuildContext context) {
    return InkWell(
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
    );
  }
}