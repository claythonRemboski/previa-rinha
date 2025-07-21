<?php

namespace App\Services;

class PaymentProcessorService
{
    public function __construct() {}

    public function processPayment()
    {
        try {
            return response()->json(['status' => 'ok']);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
