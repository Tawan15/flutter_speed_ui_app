import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class C03PageUi extends StatefulWidget {
  const C03PageUi({super.key});

  @override
  State<C03PageUi> createState() => _C03PageUiState();
}

class _C03PageUiState extends State<C03PageUi> {
  bool _isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // พื้นหลังหลักสีขาวสะอาด
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Header: Back Button & Image Logo Frame
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF19C463), width: 1.2), // สีเขียวขอบโลโก้
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(
                          'assets/images/img10.png',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => 
                            const Center(child: Text("H", style: TextStyle(color: Color(0xFF19C463), fontWeight: FontWeight.bold))),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Text(
                  "Create your account",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 35),

                // Fields
                _buildInputLabel("Name"),
                _buildTextField("ex: jon smith"),
                const SizedBox(height: 18),
                
                _buildInputLabel("Email"),
                _buildTextField("ex: jon.smith@email.com"),
                const SizedBox(height: 18),
                
                _buildInputLabel("Password"),
                _buildTextField("*********", isPassword: true),
                const SizedBox(height: 18),
                
                _buildInputLabel("Confirm password"),
                _buildTextField("*********", isPassword: true),
                const SizedBox(height: 20),

                // Checkbox Section
                Row(
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Checkbox(
                        value: _isAccepted,
                        activeColor: const Color(0xFF19C463),
                        side: const BorderSide(color: Color(0xFF19C463), width: 1.5),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        onChanged: (v) => setState(() => _isAccepted = v!),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text("I understood the ", style: TextStyle(color: Colors.grey[700], fontSize: 14)),
                    const Text(
                      "terms & policy.",
                      style: TextStyle(color: Color(0xFF19C463), fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Main Sign Up Button
                _buildPrimaryButton("SIGN UP", const Color(0xFF19C463), () {}),
                
                const SizedBox(height: 25),
                Text("or sign up with", style: TextStyle(color: Colors.grey[500], fontSize: 14)),
                const SizedBox(height: 25),

                // Social Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _socialButton('assets/images/google.png'),
                    _socialButton('assets/images/facebook1.png'),
                    _socialButton('assets/images/twitter.png'),
                  ],
                ),
                const SizedBox(height: 35),

                // Footer
                _buildFooterText("Have an account? ", "SIGN IN", () => Navigator.pop(context)),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ปรับแก้สี Label ให้เป็นสีเทาตามรูป
  Widget _buildInputLabel(String label) => Align(
    alignment: Alignment.centerLeft,
    child: Text(
      label,
      style: GoogleFonts.poppins(
        color: const Color(0xFF7D7D7D), // สีเทาเข้มปานกลางของหัวข้อฟิลด์
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
    ),
  );

  // ปรับแก้สีพื้นหลัง TextField ให้เป็นเทาอ่อนมาก (F9F9F9)
  Widget _buildTextField(String hint, {bool isPassword = false}) => Container(
    margin: const EdgeInsets.only(top: 8),
    decoration: BoxDecoration(
      color: const Color(0xFFF9F9F9), // สีพื้นหลังฟิลด์ที่ดูนุ่มนวล
      borderRadius: BorderRadius.circular(12),
    ),
    child: TextField(
      obscureText: isPassword,
      style: const TextStyle(color: Colors.black87),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFFC2C2C2), fontSize: 14), // สีของ Hint text
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      ),
    ),
  );

  Widget _buildPrimaryButton(String text, Color color, VoidCallback onPressed) => SizedBox(
    width: double.infinity,
    height: 58,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ),
  );

  // สีปุ่ม Social เทาอ่อน (F5F5F5)
  Widget _socialButton(String path) => Container(
    height: 55,
    width: (MediaQuery.of(context).size.width - 90) / 3,
    decoration: BoxDecoration(
      color: const Color(0xFFF5F5F5),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Center(child: Image.asset(path, width: 26)),
  );

  Widget _buildFooterText(String t1, String t2, VoidCallback onTap) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(t1, style: const TextStyle(color: Colors.grey)),
      GestureDetector(
        onTap: onTap,
        child: Text(
          t2,
          style: const TextStyle(color: Color(0xFF19C463), fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}