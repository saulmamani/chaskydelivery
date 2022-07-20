<?php

namespace Database\Seeders;

use App\Models\Categoria;
use App\Models\Empresa;
use App\Models\Producto;
use Elastic\Elasticsearch\ClientBuilder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
 //       $client = ClientBuilder::create()->build();
//        $client->indices()->delete(['index' => 'productos']);
//        $client->indices()->create(['index' => 'productos']);

        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);

        DB::table('categorias')->insert([
            ['nombre' => 'Comidas Nacionales'],
            ['nombre' => 'Comidas Internacionales'],
            ['nombre' => 'Abarrotes'],
            ['nombre' => 'Bebidas'],
            ['nombre' => 'Carnes'],
            ['nombre' => 'Embutidos'],
            ['nombre' => 'Frutas y verduras'],
            ['nombre' => 'Lácteos'],
            ['nombre' => 'Huevos'],
            ['nombre' => 'Artículos de higiene'],
            ['nombre' => 'Artículos de mascotas'],
            ['nombre' => 'Varios']
        ]);

        Empresa::factory(5)->create();
        Producto::factory(90)->create();

    }
}
