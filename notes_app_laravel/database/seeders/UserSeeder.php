<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('users')->insert(array(   
            array(
                'name' => 'Admin Unna',
                'username' => 'nnadmin',
                'email' => 'unna@g.c',
                'phone' => '021 909090',
                'password' => bcrypt('090909'),
            ),
            array(
                'name' => 'User Unna',
                'username' => 'nna',
                'email' => 'user@g.c',
                'phone' => '021 909091',
                'password' => bcrypt('090909'),
            ),
        ));
    }
}
