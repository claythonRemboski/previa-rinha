<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\PaymentProcessorController;


Route::post('/payment-processor', [PaymentProcessorController::class, 'save']);
