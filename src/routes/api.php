<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\PaymentProcessor;


Route::post('/payment-processor', [PaymentProcessor::class, 'save']);
