import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profiledetail extends StatefulWidget {
  const Profiledetail({super.key});

  @override
  State<Profiledetail> createState() => _ProfiledetailState();
}

class _ProfiledetailState extends State<Profiledetail> {
  bool _isEditing = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData(); // 🔥 Firebase user data load کریں
  }

  void _loadUserData() {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      _nameController.text = user.displayName ?? '';
      _emailController.text = user.email ?? '';
      _phoneController.text = user.phoneNumber ?? '+92 300 1234567'; // اگر آپ نے فون نمبر نہیں رکھا تو یہ ڈیفالٹ
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
        backgroundColor: Colors.green.shade600,
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.check : Icons.edit),
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing;
                if (!_isEditing) {
                  // Save profile changes here
                  FocusScope.of(context).unfocus();
                }
              });
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Image with Gradient
            Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green.shade600, Colors.green.shade400],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        "https://randomuser.me/api/portraits/men/75.jpg",
                      ),
                    ),
                    if (_isEditing)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 18,
                          child: IconButton(
                            icon: Icon(Icons.camera_alt, size: 18, color: Colors.green.shade700),
                            onPressed: () {
                              // Image picker logic
                            },
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
                  _buildTextField("Email", _emailController, false), // Email is not editable here
                  const SizedBox(height: 15),
                  _buildTextField("Phone", _phoneController, _isEditing),

                  const SizedBox(height: 30),

                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    elevation: 3,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.notifications, color: Colors.green.shade600),
                          title: const Text("Notifications"),
                          trailing: Switch(
                            value: true,
                            onChanged: (val) {},
                            activeColor: Colors.green.shade600,
                          ),
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.lock, color: Colors.green.shade600),
                          title: const Text("Privacy Settings"),
                          trailing: Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {},
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.logout, color: Colors.red.shade600),
                          title: const Text("Logout", style: TextStyle(color: Colors.red)),
                          onTap: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.pop(context);
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
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, bool enabled,
      {TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: controller,
      enabled: enabled,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: enabled ? Colors.white : Colors.grey[200],
      ),
    );
  }
}