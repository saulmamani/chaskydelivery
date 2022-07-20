<?php

namespace App\Http\Controllers;

use Elastic\Elasticsearch\Client;
use Illuminate\Http\Request;

class ProductoElasticController extends Controller
{
    public function searchMobile(Request $request, Client $client)
    {
        $txtBuscar = $request->input('txtBuscar');
        if (!isset($txtBuscar))
            $txtBuscar = '';

        $productos = $client->search([
            'index' => 'productos',
            'body' => [
                'query' => [
                    'match' => [
                        'nombre' => $txtBuscar
                    ]
                ],
            ]
        ]);

$total = $productos['hits']['total']['value'];
error_log($total);

        //dd($productos);
        return response()->json($productos['hits']['hits']);
    }
}
