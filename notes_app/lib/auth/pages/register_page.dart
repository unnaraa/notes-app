import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/auth/bloc/register/register_bloc.dart';
import 'package:notes_app/auth/pages/login_page.dart';
import 'package:notes_app/data/datasources/auth_local_datasource.dart';
import 'package:notes_app/pages/home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() {
    if (!_validateInputs()) {
      // menghentikan proses regis kalo misalkan validasi nya gagal
      return;
    }

    context.read<RegisterBloc>().add(
      RegisterEvent.register(
        name:
            _nameController.text
                .trim(), //trim = buat menghapus spasi di awal dan akhir
        username: _usernameController.text.trim(),
        phone: _phoneController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
      ),
    );
  }

  bool _validateInputs() {
    List<String> errors = [];

    if (_nameController.text.trim().isEmpty) {
      errors.add('Nama lengkap nya harus diisi, yaa');
    }
    if (_usernameController.text.trim().isEmpty) {
      errors.add('Username nya harus diisi, yaa');
    } else if (_usernameController.text.trim().length < 4) {
      errors.add('Username minimal 4 karakter, yaa');
    }
    if (_phoneController.text.trim().isEmpty) {
      errors.add('Nomor telepon nya harus diisi, yaa');
    } else if (_phoneController.text.trim().length < 10) {
      errors.add('Nomor telepon minimal 10 digit, yaa');
    } else if (!RegExp(r'^[0-9]+$').hasMatch(_phoneController.text.trim())) {
      errors.add('Nomor telepon harus berupa angka, yaa');
    }
    if (_emailController.text.trim().isEmpty) {
      errors.add('Email nya harus diisi, yaa');
      // untuk mengecek format email yg valid
      // [\w-\.] = username yg terdiri dari angka, huruf, _, - dan .
      // @([\w-]+\.) =dipisahkan oleh @ dan  domain utama atau sub domain, kek gmail.com, .co.id
      // [\w-]{2,4} = ekstensi domain kek .com, .co.id, .net
    } else if (!RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(_emailController.text.trim())) {
      errors.add('Format Email tidak valid, yaa');
    }
    if (_passwordController.text.trim().isEmpty) {
      errors.add('Password nya harus diisi, yaa');
    } else if (_passwordController.text.trim().length < 6) {
      errors.add('Password minimal 6 karakter, yaa');
    }

    if (errors.isEmpty) {
      _showErrorDialog(errors);
      return false;
    }

    return true;
  }

  void _showErrorDialog(List<String> errors) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            'Validasi Gagal:(',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                errors
                    .map(
                      (error) => Padding(
                        padding: EdgeInsets.only(bottom: 4),
                        child: Row(
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: Colors.red[400],
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(error, style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    )
                    .toList(),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: TextStyle(
                  color: Colors.red[400],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Center(
                  child: ClipOval(
                    child: Image.asset(
                      'assets/image/notes.png',
                      height: 130,
                      width:
                          130, // Pastikan lebar dan tinggi sama untuk mendapatkan bentuk lingkaran
                      fit:
                          BoxFit
                              .cover, // Menjaga gambar tetap terisi penuh dalam lingkaran
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                const Text(
                  'Join Yoks!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Buat akun dulu yaaa, bub!',
                  style: TextStyle(color: Colors.grey[400], fontSize: 16),
                ),
                const SizedBox(height: 30),
               TextField(
                  controller: _nameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    labelStyle: TextStyle(color: Colors.grey[400]),
                    prefixIcon: Icon(Icons.person, color: Colors.grey[400]),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[800]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    filled: true,
                    fillColor: Colors.grey[900],
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _usernameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Colors.grey[400]),
                    prefixIcon: Icon(
                      Icons.alternate_email,
                      color: Colors.grey[400],
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[800]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    filled: true,
                    fillColor: Colors.grey[900],
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _phoneController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Phone',
                    labelStyle: TextStyle(color: Colors.grey[400]),
                    prefixIcon: Icon(
                      Icons.phone_android,
                      color: Colors.grey[400],
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[800]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    filled: true,
                    fillColor: Colors.grey[900],
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.grey[400]),
                    prefixIcon: Icon(Icons.email, color: Colors.grey[400]),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[800]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    filled: true,
                    fillColor: Colors.grey[900],
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.grey[400]),
                    prefixIcon: Icon(Icons.lock, color: Colors.grey[400]),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey[400],
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[800]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    filled: true,
                    fillColor: Colors.grey[900],
                  ),
                ),
                const SizedBox(height: 32),
                BlocListener<RegisterBloc, RegisterState>(
                  listener: (context, state) {
                    state.when(
                      initial: () {},
                      loading: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false, //ini buat g bisa klik yg luar dari dialog
                          builder:
                              (context) =>
                                  Center(child: CircularProgressIndicator()),
                        );
                      },
                      success: (authResponse) async {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }

                        // simpan data ke local storage(token atau data user berhasil regis atau login)
                        await AuthLocalDatasource().saveAuthData(authResponse);

                        if (context.mounted) {
                          final pesan = ScaffoldMessenger.of(context);

                          await Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                            (route) => false,
                          );

                          Future.delayed(Duration(milliseconds: 200), () {
                            pesan.showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.grey[700],
                                margin: EdgeInsets.all(20),
                                duration: Duration(milliseconds: 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                content: Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        'Berhasil Register! Selamat datang ${authResponse.user!.name}',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                        }
                      },
                      error: (message) {
                        // menghapus dialog loading
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }

                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      message,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    );
                  },
                  child: BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: state.maybeWhen(
                            loading: () => null,
                            orElse: () => _register,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 10,
                          ),
                          child:state.maybeWhen(
                            loading: () => const CircularProgressIndicator(color: Colors.white),
                            orElse: () =>  const Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          )
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}