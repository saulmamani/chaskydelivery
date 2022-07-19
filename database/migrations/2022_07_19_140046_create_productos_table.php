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
        Schema::create('productos', function (Blueprint $table) {
            $table->id();
            $table->string('codigo', 20);
            $table->string('nombre', 250);
            $table->text('descripcion')->nullable();
            $table->decimal('precio', 10, 2);
            $table->decimal('oferta', 10, 2)->nullable();

            //foreing key table categorias
            $table->unsignedBigInteger('categoria_id');
            $table->foreign('categoria_id')->references('id')->onDelete('CASCADE')->on('categorias');

            $table->unsignedBigInteger('empresa_id');
            $table->foreign('empresa_id')->references('id')->onDelete('CASCADE')->on('empresas');

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
        Schema::dropIfExists('productos');
    }
};
