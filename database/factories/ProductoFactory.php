<?php

namespace Database\Factories;

use App\Models\Producto;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Producto>
 */
class ProductoFactory extends Factory
{
    protected $model = Producto::class;
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */

    public function definition()
    {
        return [
            'codigo' => $this->faker->randomNumber(7),
            'nombre' => $this->faker->name,
            'descripcion' => $this->faker->sentence,
            'precio' => $this->faker->randomFloat(2, 0, 100),
            'oferta' => $this->faker->randomFloat(2, 0, 100),
            'categoria_id' => $this->faker->numberBetween(1, 12),
            'empresa_id' => $this->faker->numberBetween(1, 5),
            'created_at' => $this->faker->date('Y-m-d H:i:s'),
            'updated_at' => $this->faker->date('Y-m-d H:i:s')
        ];
    }
}
