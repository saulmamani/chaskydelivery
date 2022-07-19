<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('empresas', function (Blueprint $table) {
            $table->id();
            $table->string('nombre', '100')->unique();
            $table->string('ciudad', '50');
            $table->string('direccion', '100')->nullable();
            $table->string('localizacion')->nullable();
            $table->string('celular', '20');
            $table->string('email', '50')->nullable();
            $table->enum('estado', ['Abierto', 'Cerrado']);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('empresas');
    }
};
