import 'package:flutter/material.dart';

class Practice2 extends StatelessWidget {
  const Practice2({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 250),
                Text("Thuc hanh 2", style: TextStyle(fontSize: 22)),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    hintText: "Email",
                  ),
                  validator: (value) {
                    if (value == null || value == "") {
                      return "Email khong hop le";
                    }
                    final emailRegex = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );
                    if (!emailRegex.hasMatch(value)) {
                      return 'Email khong dung dinh dang';
                    }
                  },
                ),
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Email hợp lệ')),
                      );
                    }
                  },
                  child: const Text("Kiem tra"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
