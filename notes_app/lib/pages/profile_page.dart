import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notes_app/auth/bloc/logout/logout_bloc.dart';
import 'package:notes_app/auth/pages/login_page.dart';
import 'package:notes_app/data/datasources/auth_local_datasource.dart';
import 'package:notes_app/data/datasources/auth_remote_datasource.dart';
import 'package:notes_app/data/datasources/variable.dart';
import 'package:notes_app/data/models/response/auth_response.dart';
import 'package:notes_app/data/models/response/avatar_response_model.dart';
import 'package:notes_app/pages/home_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePicker _picker = ImagePicker();

  List<Avatar> avatars = [];
  bool isLoadingAvatars = true;
  User? userData;

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _loadAvatars();
  }

  Future<void> _loadUserData() async {
    try {
      final authData = await AuthLocalDatasource().getAuthData();
      final saveAvatarId = await
       AuthLocalDatasource().getAvatarId();

      setState(() {
        userData = authData.user;
        if(saveAvatarId != null && 
        userData != null) {
          userData = userData!.copyWith(
            avatarId: saveAvatarId,
            avatar: userData!.avatar
          );
        }
      });
    } catch (e) {
      if(mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error loading user data: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } 
  }

  Future<void> _loadAvatars() async {
    final result = await AuthRemoteDatasource().getAvatars();
    result.fold(
      (error) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: 
      Text('Error loading avatar $error'),
      ),), 
      (data) => setState(() {
        avatars = data;
        isLoadingAvatars = false;
      }));
  }

  Widget _buildProfilePicture() {
    String? imageUrl;
    if(userData?.avatar?.imagePath != null) {
      imageUrl = '${Variable.baseUrl}/${userData?.avatar?.imagePath}';
    }

    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[850],
        image: imageUrl != null 
        ? DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover
        )
        : null,
      ),
      child: imageUrl == null 
      ? Icon(Icons.person, size: 50, 
      color: Colors.white) : null,
    );
  }

  Future<void> _handleAvatarSelection(Avatar avatar) async {
    try {
      showDialog(
        context: context, 
        builder: (context) => Center(
          child: CircularProgressIndicator(),
        ));

        await AuthLocalDatasource().saveAvatarId(avatar.id!);
        final result = await AuthRemoteDatasource().updateAvatar(avatar.id!);

        if(mounted) {
          Navigator.pop(context);
        }

        result.fold(
          (error) {
            if(mounted) {
              Navigator.pop(context);
              _showCustomSnackBar(context, 'Error updating avatar: $error', isSuccess: false);
            }
          }, 
          (data) async {
            if (mounted) {
              await AuthLocalDatasource().saveAuthData(data);

              setState(() {
                userData = data.user;
              });
              Navigator.pop(context);
              _showCustomSnackBar(context, 'Avatar berhasil di update 🎉🎉🎉', isSuccess: true);
            }
          });
    } catch (e) {
      if(mounted) {
        Navigator.pop(context);
        Navigator.pop(context);
        _showCustomSnackBar(context, 'error updating avatar: $e', isSuccess: false);
      }
    }
  }

  void _showCustomSnackBar(BuildContext context, String message, {bool isSuccess = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isSuccess ? Colors.greenAccent : Colors.red.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isSuccess ? Icons.check_circle : Icons.error,
                  color: isSuccess ? Colors.green : Colors.red,
                ),
              ),
              SizedBox(width: 12,),
              Expanded(
                child: Text(message, style: TextStyle(
                  color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),),)
            ],
          ),
        ),
        backgroundColor: Colors.grey[850],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
        elevation: 4,
        
        )
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    avatars.clear();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(context: context, 
              backgroundColor: Colors.grey[850],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
              builder: (context) => _buildAvatarSelector());
            },
            child: Center(
              child: Stack(
                children: [
                  _buildProfilePicture(),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[850],
                      ),
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red
                        ),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 32.0),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey[850],
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              children: [
                _buildInfoTile(
                  icon: Icons.person,
                  title: 'Name',
                  value: userData?.name ?? 'Loading...',
                ),
                const SizedBox(height: 16.0),
                _buildInfoTile(
                  icon: Icons.email,
                  title: 'Email',
                  value: userData?.email ?? 'Loading...',
                ),
                const SizedBox(height: 16.0),
                _buildInfoTile(
                  icon: Icons.phone,
                  title: 'Phone',
                  value: userData?.phone ?? 'Loading...',
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
                onPressed: () {},
                child: BlocConsumer<LogoutBloc, LogoutState>(
                    listener: (context, state) {
                  state.maybeWhen(
                      orElse: () {},
                      success: () async {
                        await AuthLocalDatasource().removeAuthData();
                        if (context.mounted) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        }
                      });
                }, builder: (context, state) {
                  return ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                child: Container(
                                  padding: EdgeInsets.all(24),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[850],
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          offset: const Offset(0, 4),
                                        )
                                      ]),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.logout_outlined,
                                          color: Colors.white,
                                          size: 32,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 24,
                                      ),
                                      Text(
                                        'Logout',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        'Are you sure you want to logout?',
                                        style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 32,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              style: TextButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 16),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  side: BorderSide(
                                                      color: Colors.grey[700]!),
                                                ),
                                              ),
                                              child: Text(
                                                'Cancel',
                                                style: TextStyle(
                                                    color: Colors.grey[400],
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Expanded(
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    context
                                                        .read<LogoutBloc>()
                                                        .add(LogoutEvent
                                                            .logout());
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.red,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 16),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12))),
                                                  child: Text(
                                                    'Logout',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  )))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.logout_outlined),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Logout',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ));
                })),
          )
        ],
      ),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 20, color: Colors.red),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        Padding(
          padding: const EdgeInsets.only(left: 28.0),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAvatarSelector() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Choose Your Fighter !', style: TextStyle(
              color: Colors.white, 
              fontSize: 20, 
              fontWeight: FontWeight.bold,),),
              SizedBox(height: 20,),
              if(isLoadingAvatars) const Center(child: CircularProgressIndicator())
              else 
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: avatars.length,
                  itemBuilder: (context, index) {
                    final avatar = avatars[index];
                    final bool isSelected = avatar.id == userData?.avatarId;

                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: GestureDetector(
                        onTap: () => _handleAvatarSelection(avatar),
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: isSelected ? Border.all(
                              color: Colors.red,
                              width: 2,
                            ) : null,
                            image: DecorationImage(
                              image: NetworkImage('${Variable.baseUrl}/${avatar.imagePath}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
              )
        ],
      ),
    );
  }

  Widget _buildAvatarOption({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.red,
          child: Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}