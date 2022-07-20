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

        //multi-match search by phonetic, descripcion
        $params = [
            'index' => 'productos',
            'type' => 'producto',
            'body' => [
                'query' => [
                    'match' => [
                        'nombre' => [
                            'query' => $txtBuscar,
                            'fuzziness' => 3
                        ]
                    ]
                ]
            ]
        ];

        $productos = $client->search($params);
        $total = $productos['hits']['total']['value'];

        return response()->json([
            "total" => $total,
            "data" => $productos['hits']['hits']
        ]);
    }
}
