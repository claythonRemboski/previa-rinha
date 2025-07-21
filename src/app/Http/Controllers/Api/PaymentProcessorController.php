<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\PaymentProcessorService;

class PaymentProcessorController extends Controller
{
    public $paymentProcessorService;

    public function __construct(PaymentProcessorService $paymentProcessorService)
    {
        $this->paymentProcessorService = $paymentProcessorService;
    }

    public function index()
    {
        //teste
    }

    /**
     * Store a newly created resource in storage.
     */
    public function save(Request $request)
    {
        $response = $this->paymentProcessorService->processPayment();
        
        return $response;
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
