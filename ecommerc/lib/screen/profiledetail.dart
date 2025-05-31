import 'package:ecommerce/main.dart';
import 'package:ecommerce/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class Profiledetail extends StatefulWidget {
  const Profiledetail({super.key});

  @override
  State<Profiledetail> createState() => _ProfiledetailState();
}

class _ProfiledetailState extends State<Profiledetail> {
  bool _isEditing = false;
  bool _notificationsEnabled = true;
  File? _imageFile;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _nameController.text = user.displayName ?? '';
      _emailController.text = user.email ?? '';
      _phoneController.text = user.phoneNumber ?? '+92 300 1234567';
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _imageFile = File(picked.path);
      });
    }
  }

  String _getInitials(String name) {
    if (name.trim().isEmpty) return '?';
    final parts = name.trim().split(' ');
    return parts.length > 1
        ? (parts[0][0] + parts[1][0]).toUpperCase()
        : parts[0][0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final name = _nameController.text;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
  title: const Text("My Profile", style: TextStyle(color: Colors.white)),
  centerTitle: true,
  backgroundColor: const Color(0xff134e5e),
  leading: IconButton(
    icon: const Icon(Icons.home, color: Colors.white),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => TabbarScreen()),
      );
    },
  ),
  actions: [
    TextButton.icon(
      onPressed: () {
        setState(() {
          _isEditing = !_isEditing;
        });
      },
      icon: Icon(
        _isEditing ? Icons.check : Icons.edit,
        color: Colors.white,
      ),
      label: Text(
        _isEditing ? "Save" : "Edit",
        style: const TextStyle(color: Colors.white),
      ),
    ),
  ],
),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 80),
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff134e5e), Color(0xff71b280)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      _imageFile != null
                          ? CircleAvatar(
                            radius: 60,
                            backgroundImage: FileImage(_imageFile!),
                          )
                          : CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                            child: Text(
                              _getInitials(name),
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff134e5e),
                              ),
                            ),
                          ),
                      if (_isEditing)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                            onTap: _pickImage,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: Color(0xff134e5e),
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _buildTextField("Name", _nameController, _isEditing),
                    const SizedBox(height: 15),
                    _buildTextField("Email", _emailController, false),
                    const SizedBox(height: 15),
                    _buildTextField(
                      "Phone",
                      _phoneController,
                      _isEditing,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 30),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 3,
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(
                              Icons.notifications,
                              color: Color(0xff134e5e),
                            ),
                            title: const Text("Notifications"),
                            trailing: Switch(
                              value: _notificationsEnabled,
                              onChanged: (val) {
                                setState(() {
                                  _notificationsEnabled = val;
                                });
                              },
                              activeColor: const Color(0xff134e5e),
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            leading: const Icon(
                              Icons.lock,
                              color: Color(0xff134e5e),
                            ),
                            title: const Text("Privacy Settings"),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),
                            onTap: () {},
                          ),
                          const Divider(),
                          ListTile(
                            leading: const Icon(
                              Icons.logout,
                              color: Colors.red,
                            ),
                            title: const Text(
                              "Logout",
                              style: TextStyle(color: Colors.red),
                            ),
                            onTap: () async {
                              await FirebaseAuth.instance.signOut();
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const LoginScreen(),
                                ),
                                (route) => false,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    bool enabled, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      enabled: enabled,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: enabled ? Colors.white : Colors.grey[200],
      ),
    );
  }
}
