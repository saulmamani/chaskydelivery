<?php

namespace Database\Factories;

use App\Models\Empresa;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Empresa>
 */
class EmpresaFactory extends Factory
{
    protected $model = Empresa::class;
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'nombre' => $this->faker->company,
            'ciudad' => $this->faker->randomElement(['Oruro', 'La Paz', 'Cochabamba', 'Santa Cruz']),
            'direccion' => $this->faker->address,
            'localizacion' => $this->faker->latitude . ',' . $this->faker->longitude,
            'celular' => $this->faker->phoneNumber,
            'email' => $this->faker->email,
            'estado' => $this->faker->randomElement(['Abierto', 'Cerrado']),
            'created_at' => $this->faker->date('Y-m-d H:i:s'),
            'updated_at' => $this->faker->date('Y-m-d H:i:s')
        ];
    }
}
