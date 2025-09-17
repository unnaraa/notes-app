<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function login(Request $request) {
        $user =  User::where('email', $request->email)->first();

        if(!$user){
            return response([
                'message' => ['Email Tidak Ada'],
            ], 404);
            
        }
        if(!Hash::check($request->password, $user->password)){
            return response([
                'message' => ['Password Salah'],
            ], 404);
            
           
        }
        $token = $user->createToken('auth_token')->plainTextToken;

        return response([
            'user' => $user,
            'token' => $token,
        ], 200);
        
    }
    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response([
           'message' => 'Berhasil Logout'
        ], 200);
    }

    public function register(Request $request)
{
    try{
        $request->validate([
        'name' => 'required|string|max:255',
        'username' => 'required|string|unique:users,username|max:255',
        'email' => 'required|string|email|unique:users,email|max:255',
        'password' => 'required|string|min:4',
        'phone' => 'required|string|max:11',
    ]);

    // buat akun baru
    $user = User::create([
        'name' => $request->name,
        'username' => $request->username,
        'email' => $request->email,
        'phone' => $request->phone,
        'password' => Hash::make($request->password),
    ]);
    
    $token = $user->createToken('auth_token')->plainTextToken;

    // response
    return response([
        'status' => 'success',
        'message' => 'Registration sccessfully',
        'user' => $user,
        'token' => $token,
    ], 201);

    } catch (\Exception $e) {
        return response([
            'status' => 'error',
            'message' => $e->getMessage(),
        ], 500);
    }
}
    public function updateAvatar(Request $request)
    {
        try{
            $request->validate([
                'avatar_id' => 'required|exists:avatar,id' //avatar = table, id = field
            ]);

            $user = $request->user();
            $user->avatar_id = $request->avatar_id;
            $user->save();

            return response([
                 'status' => 'success',
                'message' => 'Avatar berhasil update',
                'user' => $user->load('avatar'), // load table yg saling berelasi -> biar bisa ngambil data di table avatar yaitu name & image_path
            ], 200);
    } catch (\Exception $e ){
         return response([
                'status' => 'error',
            'message' => $e->getMessage()
            ], 500);
    }
        
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
