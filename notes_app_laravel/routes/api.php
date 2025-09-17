<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\AvatarController;
use App\Http\Controllers\Api\NotesController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);
Route::post('/forgotpassword', [AuthController::class, 'forgotpassword']);
Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');
Route::post('/update-avatar', [AuthController::class, 'updateAvatar'])->middleware('auth:sanctum'); 

Route::apiResource('/api-notes', NotesController::class)->middleware('auth:sanctum');

// Route Avatars =>buat get, update, hapus (bekerja di table avatar)
Route::get('/avatars', [AvatarController::class, 'index'])->middleware('auth:sanctum');
Route::post('/avatars', [AvatarController::class, 'store'])->middleware('auth:sanctum');
Route::delete('/avatars/{id}', [AvatarController::class, 'destroy'])->middleware('auth:sanctum');
