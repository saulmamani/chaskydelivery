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
            'nombre' => $this->faker->randomElement([
                'Lavandina',
                'Limpiador de toilets',
                'Limpiador de baños',
                'Limpiador anti-bacteriano',
                'Limpiador de vidrios',
                'Limpiador de pisos',
                'Detergentes para el lavado de ropas',
                'Suavizante para ropas',
                'Líquido lavaplatos',
                'Quitamanchas',
                'Jabón líquido o sanitizante de manos',

                'whisky',
                'vodka',
                'tequila',
                'ron',
                'ginebra',
                'pisco',
                'brandy',
                'coñac',

                'Nabo.',
                'Pepino.',
                'Pimiento.',
                'Puerro.',
                'Rábano.',
                'Remolacha.',
                'Setas.',
                'Tomate.',

                'Caldo de pollo',
                'Pollo a la braza',
                'Salchipapa',
                'Pollo a la parrilla',
                'Chairo',
                'Sopa de mani',
                'Picante de pollo',
                'Aji de cordero',
                'Lentejas',
                'Papa liza',
                'Papa rellena',
                'Papa cocida',

                'Cerveza',
                'Vino',
                'Whisky',

                'Café',
                'Té',
                'Café con leche',

                'Aceite de oliva',

                'Pizza',
                'Pizza con queso',
                'Pizza con champiñones',
                'Pizza con tomate',
                'Pizza con cebolla',
                'Pizza con tomate y queso',
                'Pizza con tomate y cebolla',
                'Pizza con tomate y champiñones',
                'Pizza con tomate y queso y cebolla',

                'Huevos fritos',
            ]),
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
