<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Notes;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;

class NotesController extends Controller
{
    public function index(Request $request)
    {
        try{
            $user = $request->user();
            if(!$user){
                return response([
                    'status' => 'error',
                    'message' => 'Unauthorized',
                ], 404);
            } 
            $notes = Notes::where('user_id', $request->user()->id)
            ->when(
                $request->title,
                function($query) use ($request){
                    $query->where('title', 'like', "%{request->title");
                }
            )
            ->orderBy('created_at', 'desc')
            ->get();

            return response()->json([
                'status' => 'Success',
                'message' => 'Berhasil ambil data notes',
                'data' => $notes,
            ], 200);
            
        } catch(Exception $e){
            return response()->json([
                'status' => 'error',
                'message' => 'gagal mengambil data notes',
                'data' => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {
            $request->validate([
                'title' => 'required|string|max:255',
                'deskripsi' => 'required|string',
                'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg',
            ]);

            $path = public_path('images/notes');
            // Ini ngecek apakah folder ada atau tdk
            // kalau tidak ada maka buat folder 
            if (!File::isDirectory($path)) {
                // 0777 =  permission atau akses penuh untuk folder => aman untuk lokal doang
                // izin akses yang mengizinkan semua pengguna untuk membaca, menulis, dan mengeksekusi
                // 0755 => ngasih hak akses izin bacaa ke public, kalau nulis atau nambah cuma buat pemilik (orang cuma bisa liat)
                // true = beri akses
                File::makeDirectory($path, 0777, true, true);
            }
            $imagePath = null;
            if($request->hasFile('image')) {
                $image = $request->file('image');
                $imageName = time() . '_' . uniqid() . '.' . $image->getClientOriginalName();
                $image->move($path, $imageName);
                $imagePath = 'images/notes/' . $imageName;
            }

            $note = Notes::create([
                'user_id' => $request->user()->id,
                'title' => $request->title,
                'deskripsi' => $request->deskripsi,
                'image' => $imagePath,
            ]);
            return response()->json([
                'status' => 'Success',
                'message' => 'Berhasil menambahkan data notes',
                'data' => $note,
            ], 201);
            } catch (Exception $e) {
                return response()->json([
                    'status' => 'Error',
                    'message' => 'gagal menambahkan data notes',
                    'data' => $e->getMessage(),
                ], 500);
            }
        }

    public function update(Request $request, string $id)
    {
        try {
            $note = Notes::where('user_id', $request->user()->id)->find($id);
            if (!$note) {
                return response([
                    'status' => 'Error',
                    'message' => 'Data notes tidak ditemukan',
                ], 404);
            }
            $request->validate([
                'title' => 'required|string|max:255',
                'deskripsi' => 'required|string',
                'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg',
            ]);
            $updateData = [
                'title' => $request->title,
                'deskripsi' => $request->deskripsi,
            ];

            if($request->hasFile('image')) {
                if($note->image && File::exists(public_path($note->image))) {
                    File::delete(public_path($note->image));
                }

                $image = $request->file('image');
                $imageName = time() . '.' . uniqid() . '.' . $image->getClientOriginalName();
                $image->move( public_path('images/notes'), $imageName);
                $updateData['image'] = 'images/notes/' . $imageName;
            }
            $note->update($updateData);
            return response([
                'status' => 'Success',
                'message' => 'Berhasil mengupdate data notes',
                'data' => $note->fresh(),
            ], 200);
            } catch (Exception $e) {
                return response([
                    'status' => 'Error',
                    'message' => 'gagal mengupdate data notes',
                    'data' => $e->getMessage(),
                ], 500);
            }
            
    }

    public function destroy(Request $request, string $id)
    {
        try {
            $note = Notes::where('user_id', $request->user()->id)->find($id);
            if (!$note) {
                return response([
                    'status' => 'Error',
                    'message' => 'Data notes tidak ditemukan',
                ], 404);
            }
            if($note->image && File::exists(public_path($note->image))) {
                File::delete(public_path($note->image));
            }
            $note->delete();
            return response([
                'status' => 'Success',
                'message' => 'Berhasil menghapus data notes',
            ], 200);
            } catch (Exception $e) {
                return response([
                    'status' => 'Error',
                    'message' => 'gagal menghapus data notes',
                    'data' => $e->getMessage(),
                ], 500);
        }
    }
}