<?php

namespace App\Observers;

use App\Models\Producto;
use Elastic\Elasticsearch\Client;

class ProductoObserver
{
    private $client;

    public function __construct(Client $client)
    {
        $this->client = $client;
    }

    /**
     * Handle the Producto "created" event.
     *
     * @param \App\Models\Producto $producto
     * @return void
     */
    public function created(Producto $producto)
    {
        $this->client->index([
            'index' => 'productos',
            'type' => 'producto',
            'id' => $producto->id,
            'body' => [
                'phonetic' => $producto->nombre,
                'nombre' => $producto->nombre,
                'descripcion' => $producto->descripcion,
                'categoria' => $producto->categoria->nombre,
                'empresa' => [
                    "nombre" => $producto->empresa->nombre,
                    "direccion" => $producto->empresa->direccion,
                    "celular" => $producto->empresa->celular
                ]
            ]
        ]);
    }

    /**
     * Handle the Producto "updated" event.
     *
     * @param \App\Models\Producto $producto
     * @return void
     */
    public function updated(Producto $producto)
    {
        //
    }

    /**
     * Handle the Producto "deleted" event.
     *
     * @param \App\Models\Producto $producto
     * @return void
     */
    public function deleted(Producto $producto)
    {
        $this->client->delete([
            'index' => 'productos',
            'type' => 'producto',
            'id' => $producto->id
        ]);
    }

    /**
     * Handle the Producto "restored" event.
     *
     * @param \App\Models\Producto $producto
     * @return void
     */
    public function restored(Producto $producto)
    {
        //
    }

    /**
     * Handle the Producto "force deleted" event.
     *
     * @param \App\Models\Producto $producto
     * @return void
     */
    public function forceDeleted(Producto $producto)
    {
        //
    }
}
