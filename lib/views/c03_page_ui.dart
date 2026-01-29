import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class C03PageUi extends StatefulWidget {
  const C03PageUi({super.key});

  @override
  State<C03PageUi> createState() => _C03PageUiState();
}

class _C03PageUiState extends State<C03PageUi> {
  bool _isAccepted = false; // สำหรับ Checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        // โลโก้เล็กที่มุมขวาบนตามดีไซน์
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF00C853), width: 1.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "H",
                style: TextStyle(
                  color: Color(0xFF00C853),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // 1. หัวข้อหน้าจอ
              Text(
                "Create your account",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),

              // 2. ฟิลด์กรอกข้อมูล Name, Email, Password, Confirm Password
              _buildInputLabel("Name"),
              _buildTextField("ex: jon smith"),
              const SizedBox(height: 15),
              
              _buildInputLabel("Email"),
              _buildTextField("ex: jon.smith@email.com"),
              const SizedBox(height: 15),
              
              _buildInputLabel("Password"),
              _buildTextField("*********", isPassword: true),
              const SizedBox(height: 15),
              
              _buildInputLabel("Confirm password"),
              _buildTextField("*********", isPassword: true),
              const SizedBox(height: 15),

              // 3. Checkbox เงื่อนไขการใช้งาน
              Row(
                children: [
                  Checkbox(
                    value: _isAccepted,
                    activeColor: const Color(0xFF00C853),
                    onChanged: (value) {
                      setState(() {
                        _isAccepted = value!;
                      });
                    },
                  ),
                  const Text("I understood the "),
                  const Text(
                    "terms & policy.",
                    style: TextStyle(
                      color: Color(0xFF00C853),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // 4. ปุ่ม SIGN UP สีเขียว
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00C853),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "SIGN UP",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),
              const Text("or sign up with", style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 20),

              // 5. ปุ่ม Social Media (ใช้รูปภาพตามที่คุณต้องการ)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _socialSquareButton('assets/images/google.png'),
                  const SizedBox(width: 20),
                  _socialSquareButton('assets/images/facebook1.png'),
                  const SizedBox(width: 20),
                  _socialSquareButton('assets/images/twitter.png'),
                ],
              ),

              const SizedBox(height: 30),

              // 6. ส่วนท้ายย้อนไปหน้า Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Have an account? "),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text(
                      "SIGN IN",
                      style: TextStyle(
                        color: Color(0xFF00C853),
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
    );
  }

  // --- Widget เสริม ---

  Widget _buildInputLabel(String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {bool isPassword = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black26),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }

  Widget _socialSquareButton(String imagePath) {
    return Container(
      height: 60,
      width: 80,
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          width: 30,
          height: 30,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.broken_image, color: Colors.grey),
        ),
      ),
    );
  }
}