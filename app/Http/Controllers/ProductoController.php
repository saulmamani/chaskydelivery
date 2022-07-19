<?php

namespace App\Http\Controllers;

use App\Models\Producto;
use Illuminate\Http\Request;

class ProductoController extends Controller
{
    public function index(Request $request){
        $empresaId = $request->input('empresaId');
        $txtBuscar = $request->input('txtBuscar');

        if(!isset($txtBuscar))
            $txtBuscar = '%';

        $productos = Producto::with(['categoria'])
            ->where('empresa_id', $empresaId)
            ->orderByDesc('id')
            ->where(function($query) use ($txtBuscar){
                $query->where('nombre', 'ilike', '%'.$txtBuscar.'%')
                    ->orWhereHas('categoria', function($query) use ($txtBuscar){
                        $query->where('nombre', 'ilike', '%'.$txtBuscar.'%');
                    });
            })
            ->get();
        return response()->json($productos);
    }

    public function store(Request $request){
        $producto = Producto::create($request->all());
        return response()->json($producto);
    }

    public function update(Request $request, $id){
        $producto = Producto::find($id);
        $producto->update($request->all());
        return response()->json($producto);
    }

    public function destroy($id){
        $producto = Producto::find($id);
        $producto->delete();
        return response()->json(['message' => 'Producto eliminado']);
    }
}
