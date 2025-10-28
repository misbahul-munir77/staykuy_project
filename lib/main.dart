import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Warna tema (mudah diubah)
const Color kBackgroundDark = Color(0xFF222222);
const Color kPrimaryBlue = Color(0xFF0BB0FF); // tombol biru
const double kPanelMaxWidth = 420; // lebar maksimum panel putih di layar besar

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lupa Password Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryBlue,
        scaffoldBackgroundColor: kBackgroundDark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ForgotPasswordPage(),
    );
  }
}

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailCtrl = TextEditingController(
    text: 'fatihmumtazah@gmail.com', // bisa diubah atau dikosongkan
  );

  bool _sending = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    super.dispose();
  }

  void _sendCode() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _sending = true);

    // Simulasi proses kirim (di project nyata ganti dengan API call)
    await Future.delayed(const Duration(seconds: 1, milliseconds: 200));

    setState(() => _sending = false);

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Kode dikirim ke ${_emailCtrl.text.trim()}.'),
      ),
    );

    // Navigasi ke halaman verifikasi kode kalau ada:
    // Navigator.of(context).push(...);
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email tidak boleh kosong';
    }
    final email = value.trim();
    final emailRegex = RegExp(r'^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(email)) {
      return 'Masukkan alamat email yang valid';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // background sudah di theme
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          final panelWidth =
              constraints.maxWidth < 500 ? constraints.maxWidth * 0.92 : kPanelMaxWidth.toDouble();

          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Container(
                width: panelWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Back button (kiri atas)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(24),
                        onTap: () {
                          // di app nyata: Navigator.pop(context)
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Back tapped (replace with Navigator.pop)')),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(Icons.arrow_back, size: 26),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),

                    // Ilustrasi placeholder
                    SizedBox(
                      height: 160,
                      child: Center(
                        child: Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                            color: kBackgroundDark.withValues(alpha: 0.06),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.mail_outline,
                              size: 64,
                              color: kBackgroundDark,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Title
                    const Center(
                      child: Text(
                        'Lupa Password',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Subtitle
                    const Center(
                      child: Text(
                        'Silahkan masukkan alamat email anda di bawah agar\nkami bisa merecover akun anda',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Form
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Email anda',
                            style: TextStyle(fontSize: 13, color: Colors.black87),
                          ),
                          const SizedBox(height: 8),

                          // Custom text field with icon box
                          TextFormField(
                            controller: _emailCtrl,
                            keyboardType: TextInputType.emailAddress,
                            validator: _validateEmail,
                            decoration: InputDecoration(
                              hintText: 'contoh: nama@domain.com',
                              contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                              prefixIcon: Container(
                                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                width: 42,
                                height: 42,
                                decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(Icons.email_outlined, size: 20),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(color: Colors.black12),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(color: Colors.black12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: kPrimaryBlue.withValues(alpha: 0.9), width: 1.5),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Tombol utama
                          SizedBox(
                            height: 48,
                            child: ElevatedButton(
                              onPressed: _sending ? null : _sendCode,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryBlue,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                elevation: 0,
                              ),
                              child: _sending
                                  ? const SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                                    )
                                  : const Text(
                                      'Kirimkan Kode',
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                    ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          // Kode tidak terkirim? link kecil
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Kode tidak terkirim? ',
                                style: TextStyle(fontSize: 12, color: Colors.black54),
                              ),
                              GestureDetector(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Permintaan kirim ulang diklik')),
                                  );
                                },
                                child: Text(
                                  'Klik di sini untuk mengirim ulang',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: kPrimaryBlue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
