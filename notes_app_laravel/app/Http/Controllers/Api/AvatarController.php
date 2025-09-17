<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Avatar;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;

class AvatarController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $avatars = Avatar::all();
        return response([
            'status' => 'success',
            'data' => $avatars,
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try{
            $request->validate([
                "name" => 'required|string|max:255',
                "image_path" => 'required|image|mimes:jpg,png,jpeg,gif',
            ]);
            $path = public_path('images/avatars');
            if(!File::isDirectory($path)) {
                File::makeDirectory($path, 0777, true, true);
            }
            $image = $request->file('image_path');
            $imageName = time() . '_' . uniqid() . '.' . $image->getClientOriginalExtension();
            $image->move($path, $imageName);
            $imagePath = 'images/avatars/' . $imageName;

            $avatar = Avatar::create([
                'name' => $request->name,
                'image_path' => $imagePath,
            ]);

            return response([
                'status' => 'success',
                'message' => 'Avatar berhasil ditambahkan',
                'data' => $avatar
            ], 201);
        } catch (\Exception $e){
            return response([
                'status' => 'error',
                'message' => 'Gagal menambahkan avatar',
            'error' => $e->getMessage()
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
        try{
            $avatar = Avatar::findOrFail($id);

            if(File::exists(public_path($avatar->image_path))) {
                File::delete(public_path($avatar->image_path));
            }
            $avatar->delete();

        return response([
                'status' => 'success',
                'message' => 'Avatar berhasil dihapus',
        ],200);
        }   catch (\Exception $e) {
             return response([
                'status' => 'error',
                'message' => 'Gagal menghapus avatar',
                'error' => $e->getMessage()
            ], 500);
        }
    }
    
}
