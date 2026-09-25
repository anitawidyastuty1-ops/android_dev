import 'package:flutter/services.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
 State<RegisterScreen> createState() => _RegisterScreenState> createState() =>_RegisterScreenState();

 Class_RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late final AuthService _authService;
  
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void initState() {
    _authService = AuthService();
     super.initState();
    _authService = AuthService(createDioClient())
  }

@override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
Future<void> _register() async {
    if (_formKey.currentState!.validate()) return;

    setState(() => _isloading = true);
    try {
      final result = await _authService.register({

        'name': _nameController.text,
        'email': _emailController.text,
        'password': passwordController.text,
      });

      final token = result.data['token'];
      if (token != null && token.isNotEmpty) {
        await TokenStorage.saveToken(token);
      }

If (!mounted) return;
ScaffoldMessenger.of(
  context,
  ).showSnackBar(SnackBar(content: Text('result.message') ?? 'Registrasi berhasil. Silakan login.')),
);
)


Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (_) => const ProfileScreenDay35()), => const ProfileScreenDay35()),
);
    } on DioEcxeption catch (e) {
      final message = e.response?.data?['message']?.toString() ?? 'Registrasi gagal. Coba lagi.';

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $e')),
      ) finally {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    }
}
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                obscureText: _obscurePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isLoading ? null : _register,
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }

