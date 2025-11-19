import 'package:flutter/material.dart';
import '/db_helper.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  void register() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Semua field harus diisi!')));
      return;
    }

    try {
      await DBHelper.register(name, email, password);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Registrasi berhasil!')));
      Navigator.pop(context); // kembali ke login
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F5F7),
      body: Stack(
        children: [
          // BACKGROUND GRADIENT
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFAF7FF), Color(0xFFEDE9FF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // CONTENT
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TITLE
                Text(
                  "Buat Akun",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Mulai perjalanan fashion kamu sekarang",
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                ),

                const SizedBox(height: 35),

                // CARD FORM
                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _inputField("Nama Lengkap", nameController),
                      const SizedBox(height: 15),
                      _inputField("Email", emailController),
                      const SizedBox(height: 15),
                      _inputField("Password", passController, isPass: true),
                      const SizedBox(height: 25),

                      // REGISTER BUTTON
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: register,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text(
                            "Daftar",
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 0.5,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // LOGIN TEXT
                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      "Sudah punya akun? Login",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // CUSTOM INPUT FIELD
  Widget _inputField(
    String label,
    TextEditingController c, {
    bool isPass = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: c,
          obscureText: isPass,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF3F2F4),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
